<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Http\Traits\Notify;
use App\Http\Traits\Upload;
use App\Models\Configure;
use App\Models\CurrencySell;
use App\Models\Testimonial;
use Illuminate\Support\Str;
use App\Models\Currency;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Stevebauman\Purify\Facades\Purify;

class CurrencyController extends Controller
{
    use Upload, Notify;

    public function __construct()
    {
        $this->middleware(['auth']);
        $this->middleware(function ($request, $next) {
            $this->user = auth()->user();
            return $next($request);
        });
        $this->theme = template();
    }

    public function sellCurrencyRequest(Request $request)
    {
        $purifiedData = Purify::clean($request->except('_token', '_method'));
        $rules = [
            'sendAmount' => 'required',
            'sendCurrency' => 'required',
            'receiveAmount' => 'required',
            'receiveCurrency' => 'required',
        ];
        $message = [
            'sendAmount.required' => 'Send field is required',
            'sendCurrency.required' => 'Currency field is required',
            'receiveAmount.required' => 'Receive field is required',
            'receiveCurrency.required' => 'Currency field is required',
        ];

        $validate = Validator::make($purifiedData, $rules, $message);

        if ($validate->fails()) {
            return back()->withInput()->withErrors($validate);
        }

        $data['receiverCurrency'] = Currency::findOrFail($request->receiveCurrency);
        $data['senderCurrency'] = Currency::findOrFail($request->sendCurrency);

        if ($data['receiverCurrency']->reserve < $request->receiveAmount) {
            return back()->with('warning', 'The amount of exchange exceed our reserve. Please contact the administrator.');
        }

        if ($data['senderCurrency']->min_sell > $request->sendAmount) {
            return back()->with('warning', 'Minimum Exchange ' . $data['senderCurrency']->min_sell . ' ' . $data['senderCurrency']->code);
        }

        if ($data['senderCurrency']->max_sell < $request->sendAmount) {
            return back()->with('warning', 'Maximum Exchange ' . $data['senderCurrency']->max_sell . ' ' . $data['senderCurrency']->code);
        }

        $baseCurrency = config('basic.base_currency_rate');

        if ($data['senderCurrency']->flag != $data['receiverCurrency']->flag) // fiat-> crypto or Crypto-> Fiat
        {
            if ($data['senderCurrency']->flag == 0 && $data['receiverCurrency']->flag == 1)  //fiat-> crypto
            {
                $getDollarRate = $baseCurrency / $data['senderCurrency']->sell_rate;
                $amount = $getDollarRate * $request->sendAmount;
                $conversionRate = (1 / $data['receiverCurrency']->buy_rate) * $getDollarRate;
                $conversion = (1 / $data['receiverCurrency']->buy_rate) * $amount;
            } else  //crypto => fiat
            {
                $getDollarRate = $data['senderCurrency']->sell_rate / $baseCurrency;
                $amount = $getDollarRate * $request->sendAmount;
                $conversion = $data['receiverCurrency']->buy_rate * $amount;
                $conversionRate = $getDollarRate;
            }
        } else {
            if ($data['senderCurrency']->flag == 0 && $data['receiverCurrency']->flag == 0) // fiat-> fiat
            {
                $getDollarRate = $data['receiverCurrency']->buy_rate / $data['senderCurrency']->sell_rate;
                $input = $getDollarRate * $request->sendAmount;
                $conversion = $input;
                $conversionRate = $getDollarRate;
            } else // crypto-> crypto
            {
                $getDollarRate = $data['senderCurrency']->sell_rate / $data['receiverCurrency']->buy_rate;
                $conversion = $getDollarRate * $request->sendAmount;
                $conversionRate = $getDollarRate;
            }
        }

        //Exchange Charge Calculation
        $exchangeCharge = 0;
        if ($data['receiverCurrency']->commission_rate > 0) {
            if ($data['receiverCurrency']->commission_type == 0) {
                $exchangeCharge = $data['receiverCurrency']->commission_rate;
            } else {
                $exchangeCharge = $conversion * $data['receiverCurrency']->commission_rate / 100;
            }
        }

        $currencySell = new CurrencySell();

        $currencySell->user_id = $this->user->id;
        $currencySell->send_currency_id = $data['senderCurrency']->id;
        $currencySell->receive_currency_id = $data['receiverCurrency']->id;
        $currencySell->send_amount = $request->sendAmount;
        $currencySell->receive_amount = $conversion - $exchangeCharge;
        $currencySell->rate = $conversionRate;
        $currencySell->uuid = Str::uuid();
        $currencySell->exchange_id = strRandom(14);
        $currencySell->save();

        return redirect()->route('user.sellCurrency.step1', $currencySell->uuid);

    }

    public function sellCurrencyStep1($uuid)
    {
        $data['sellCurrencies'] = CurrencySell::with(['sendCurrency', 'receiveCurrency'])->where('user_id',auth()->id())->where('uuid', $uuid)->firstOrFail();
        return view($this->theme . 'user.currency.sellForm1', $data);
    }

    public function sellCurrencyStep1Submit(Request $request, $uuid)
    {
        $data['sellCurrencies'] = CurrencySell::with(['sendCurrency', 'receiveCurrency'])->where('user_id',auth()->id())->where('uuid', $uuid)->firstOrFail();

        $rulesSpecification = [];
        $inputFieldSpecification = [];
        if ($data['sellCurrencies']->receiveCurrency->receiver_form != null) {
            foreach ($data['sellCurrencies']->receiveCurrency->receiver_form as $key => $cus) {
                $rulesSpecification[$key] = [$cus->validation];
                if ($cus->type == 'file') {
                    array_push($rulesSpecification[$key], 'image');
                    array_push($rulesSpecification[$key], 'mimes:jpeg,jpg,png');
                    array_push($rulesSpecification[$key], 'max:2048');
                }
                if ($cus->type == 'text') {
                    array_push($rulesSpecification[$key], 'max:191');
                }
                if ($cus->type == 'textarea') {
                    array_push($rulesSpecification[$key], 'max:300');
                }
                $inputFieldSpecification[] = $key;
            }
        }


        $this->validate($request,$rulesSpecification);



        $collectionSpecification = collect($request);
        $reqFieldSpecification = [];
        if ($data['sellCurrencies']->receiveCurrency->receiver_form != null) {
            foreach ($collectionSpecification as $k => $v) {
                foreach ($data['sellCurrencies']->receiveCurrency->receiver_form as $inKey => $inVal) {
                    if ($k != $inKey) {
                        continue;
                    } else {
                        if ($inVal->type == 'file') {
                            if ($request->hasFile($inKey)) {

                                try {
                                    $image = $request->file($inKey);
                                    $location = config('location.sellingPost.path');
                                    $filename = $this->uploadImage($image, $location);;
                                    $reqField[$inKey] = [
                                        'field_name' => $inKey,
                                        'field_value' => $filename,
                                        'field_level' => $inVal->field_level,
                                        'type' => $inVal->type,
                                        'validation' => $inVal->validation,
                                    ];

                                } catch (\Exception $exp) {
                                    return back()->with('error', 'Image could not be uploaded.')->withInput();
                                }

                            }
                        } else {
                            $reqFieldSpecification[$inKey] = [
                                'field_name' => $inKey,
                                'field_value' => $v,
                                'field_level' => $inVal->field_level,
                                'type' => $inVal->type,
                                'validation' => $inVal->validation,
                            ];
                        }
                    }
                }
            }
            $data['sellCurrencies']->receiver_info = $reqFieldSpecification;
        } else {
            $data['sellCurrencies']->receiver_info = null;
        }

        $data['sellCurrencies']->process_step = 1;
        $data['sellCurrencies']->save();

        return redirect()->route('user.sellCurrency.step2', $data['sellCurrencies']->uuid);
    }

    public function sellCurrencyStep2($uuid)
    {
        $data['sellCurrencies'] = CurrencySell::with(['sendCurrency', 'receiveCurrency'])->where('user_id',auth()->id())->where('uuid', $uuid)->firstOrFail();
        return view($this->theme . 'user.currency.sellForm2', $data);
    }

    public function sellCurrencyStep2Submit(Request $request, $uuid)
    {
        $data['sellCurrencies'] = CurrencySell::with(['sendCurrency', 'receiveCurrency'])->where('user_id',auth()->id())->where('uuid', $uuid)->firstOrFail();

        $rules = [];
        $inputField = [];
        if ($data['sellCurrencies']->sendCurrency->form_field != null) {
            foreach ($data['sellCurrencies']->sendCurrency->form_field as $key => $cus) {
                $rules[$key] = [$cus->validation];
                if ($cus->type == 'file') {
                    array_push($rules[$key], 'image');
                    array_push($rules[$key], 'mimes:jpeg,jpg,png');
                    array_push($rules[$key], 'max:2048');
                }
                if ($cus->type == 'text') {
                    array_push($rules[$key], 'max:191');
                }
                if ($cus->type == 'textarea') {
                    array_push($rules[$key], 'max:300');
                }
                $inputField[] = $key;
            }
        }
        $this->validate($request, $rules);

        $collection = collect($request);
        $reqField = [];
        if ($data['sellCurrencies']->sendCurrency->form_field != null) {
            foreach ($collection as $k => $v) {
                foreach ($data['sellCurrencies']->sendCurrency->form_field as $inKey => $inVal) {
                    if ($k != $inKey) {
                        continue;
                    } else {
                        if ($inVal->type == 'file') {
                            if ($request->hasFile($inKey)) {

                                try {
                                    $image = $request->file($inKey);
                                    $location = config('location.sellingPost.path');
                                    $filename = $this->uploadImage($image, $location);;
                                    $reqField[$inKey] = [
                                        'field_name' => $inKey,
                                        'field_value' => $filename,
                                        'field_level' => $inVal->field_level,
                                        'type' => $inVal->type,
                                        'validation' => $inVal->validation,
                                    ];

                                } catch (\Exception $exp) {
                                    return back()->with('error', 'Image could not be uploaded.')->withInput();
                                }

                            }
                        } else {
                            $reqField[$inKey] = [
                                'field_name' => $inKey,
                                'field_value' => $v,
                                'type' => $inVal->type,
                                'field_level' => $inVal->field_level,
                                'validation' => $inVal->validation,
                            ];
                        }
                    }
                }
            }
            $data['sellCurrencies']->sender_info = $reqField;
        } else {
            $data['sellCurrencies']->sender_info = null;
        }

        $data['sellCurrencies']->process_step = 2;
        $data['sellCurrencies']->save();

        return redirect()->route('user.sellCurrency.step3', $data['sellCurrencies']->uuid);
    }

    public function sellCurrencyStep3($uuid)
    {
        $data['basic'] = Configure::firstOrNew();
        $data['sellCurrencies'] = CurrencySell::with(['sendCurrency', 'receiveCurrency'])->where('user_id',auth()->id())->where('uuid', $uuid)->firstOrFail();
        return view($this->theme . 'user.currency.sellForm3', $data);
    }

    public function sellCurrencyStep3Submit($uuid)
    {
        $sellCurrencies = CurrencySell::with(['sendCurrency', 'receiveCurrency'])->where('user_id',auth()->id())->where('uuid', $uuid)->firstOrFail();
        $sellCurrencies->process_step = 3;
        $sellCurrencies->save();

        $msg = [
            'username' => $sellCurrencies->user->username,
            'sendAmount' => $sellCurrencies->send_amount,
            'receiveAmount' => $sellCurrencies->receive_amount,
            'sendCurrency' => optional($sellCurrencies->sendCurrency)->code ?? 'USD',
            'receiveCurrency' => optional($sellCurrencies->receiveCurrency)->code ?? 'USD',

        ];
        $action = [
            "link" => route('admin.exchange.orderListDetails', $sellCurrencies->id),
            "icon" => "fa fa-money-bill-alt text-white"
        ];
        $this->adminPushNotification('EXCHANGE_REQUEST', $msg, $action);

        $this->sendMailSms($this->user, 'EXCHANGE_CREATE', [
            'sendAmount' => $sellCurrencies->send_amount,
            'receiveAmount' => $sellCurrencies->receive_amount,
            'sendCurrency' => optional($sellCurrencies->sendCurrency)->code ?? 'USD',
            'receiveCurrency' => optional($sellCurrencies->receiveCurrency)->code ?? 'USD',
        ]);

        return redirect()->route('home')->with('success', ' Thank you! After manually confirm your transaction will make the exchange.');
    }

    public function exchange()
    {
        $data['currencySells'] = CurrencySell::with(['sendCurrency', 'receiveCurrency'])->where('user_id', $this->user->id)->where('process_step', 3)->paginate(config('basic.paginate'));
        return view($this->theme . 'user.exchange.list', $data);
    }

    public function testimonial()
    {
        $data['currency_sells'] = CurrencySell::with(['sendCurrency:id,code', 'receiveCurrency:id,code'])->where('user_id', $this->user->id)->where('process_step', 3)->limit(15)->latest()->get();
        $data['testimonials'] = Testimonial::where('user_id', $this->user->id)->latest()->get();
        return view($this->theme . 'user.testimonial.list', $data);
    }

    public function testimonialStore(Request $request)
    {

        $currency_sells = CurrencySell::toBase()->where('user_id', $this->user->id)->where('process_step', 3)->get(['id'])->map(function ($item) {
            return $item->id;
        })->toArray();

        $purifiedData = Purify::clean($request->except('_token', '_method'));
        $rules = [
            'comments' => 'required',
            'rate' => ['required', Rule::in([1, 2, 3, 4, 5])],
            'currency_sell_id' => ['required', Rule::in($currency_sells)],
        ];
        $message = [
            'comments.required' => 'Comment field is required',
            'rate.required' => 'Rate field is required',
            'currency_sell_id.required' => 'Please select a transaction',
        ];

        $validate = Validator::make($purifiedData, $rules, $message);

        if ($validate->fails()) {
            return back()->withInput()->withErrors($validate);
        }
        if ($request->rate < 1) {
            return back()->with('danger', 'Rate must be greater than 0');
        }
        if ($request->rate > 5) {
            return back()->with('danger', 'Rate must be smaller than 6');
        }

        $testimonial = Testimonial::firstOrNew([
            'user_id' => $this->user->id,
            'currency_sell_id' => $purifiedData['currency_sell_id']
        ]);
        $testimonial->comments = $purifiedData['comments'];
        $testimonial->rate = $purifiedData['rate'];
        $testimonial->status = 0;
        $testimonial->save();

        return back()->with('success', 'Created Successfully');
    }
}
