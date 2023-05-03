<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Traits\Notify;
use App\Http\Traits\Upload;
use App\Models\Configure;
use App\Models\Currency;
use App\Models\CurrencySell;
use App\Models\Language;
use App\Models\Testimonial;
use App\Models\User;
use Illuminate\Routing\Route;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\DB;
use Stevebauman\Purify\Facades\Purify;
use Illuminate\Support\Facades\Validator;
use Facades\App\Services\BasicService;
use Illuminate\Http\Request;

class CurrencyController extends Controller
{
    use Upload, Notify;

    public function listCrypto()
    {
        $data['control'] = Configure::first();
        $data['currency'] = Currency::where('flag', 1)->orderBy('id', 'desc')->get();
        return view('admin.currency.crypto.list', $data);
    }

    public function createCrypto()
    {
        return view('admin.currency.crypto.create');
    }

    public function storeCrypto(Request $request)
    {
        $purifiedData = Purify::clean($request->except('image', '_token', '_method'));
        $rules = [
            'name' => 'required|max:40',
            'code' => 'required',
            'symbol' => 'required',
            'reserve' => 'required|numeric|min:0',
            'buy_rate' => 'required|numeric|min:0',
            'sell_rate' => 'required|numeric|min:0',
            'minSell' => 'required|numeric|min:0',
            'maxSell' => 'required|numeric|min:0',
            'commission_rate' =>'required|numeric|min:0',
            'commission_type' =>'required',
        ];
        $message = [
            'name.required' => 'Name field is required',
            'name.max' => 'This field may not be greater than :max characters',
            'code.required' => 'Code field is required',
            'symbol.required' => 'Symbol field is required',
            'buy_rate.required' => 'Buy Rate field is required',
            'sell_rate.required' => 'Sell Rate field is required',
            'reserve.required' => 'Reserve field is required',
            'minSell.required' => 'Minimum Sell field is required',
            'maxSell.required' => 'Maximum Sell field is required',
            'commission_rate.required' => 'Commission Rate  is required',
            'commission_type.required' => 'Commission Type is required',
        ];

        $validate = Validator::make($purifiedData, $rules, $message);

        if ($validate->fails()) {
            return back()->withInput()->withErrors($validate);
        }

        try {
            $currency = new Currency();

            $input_form = [];
            if ($request->has('field_name')) {
                for ($a = 0; $a < count($request->field_name); $a++) {
                    $arr = array();
                    $arr['field_name'] = clean($request->field_name[$a]);
                    $arr['field_level'] = $request->field_name[$a];
                    $arr['type'] = $request->type[$a];
                    $arr['validation'] = $request->validation[$a];
                    $input_form[$arr['field_name']] = $arr;
                }
            }

            $input_post = [];
            if ($request->has('field_specification')) {
                for ($a = 0; $a < count($request->field_specification); $a++) {
                    $arr = array();
                    $arr['field_name'] = clean($request->field_specification[$a]);
                    $arr['field_level'] = $request->field_specification[$a];
                    $arr['type'] = $request->type_specification[$a];
                    $arr['validation'] = $request->validation_specification[$a];
                    $input_post[$arr['field_name']] = $arr;
                }
            }

            if (isset($purifiedData['field_name'])) {
                $currency->form_field = $input_form;
            }

            if (isset($purifiedData['field_specification'])) {
                $currency->receiver_form = $input_post;
            }

            if (isset($purifiedData['name'])) {
                $currency->name = @$purifiedData['name'];
            }
            if (isset($purifiedData['code'])) {
                $currency->code = strtoupper(@$purifiedData['code']);
            }
            if (isset($purifiedData['symbol'])) {
                $currency->symbol = @$purifiedData['symbol'];
            }
            if (isset($purifiedData['buy_rate'])) {
                $currency->buy_rate = @$purifiedData['buy_rate'];
            }
            if (isset($purifiedData['sell_rate'])) {
                $currency->sell_rate = @$purifiedData['sell_rate'];
            }
            if (isset($purifiedData['commission_rate'])) {
                $currency->commission_rate = @$purifiedData['commission_rate'];
            }
            if (isset($purifiedData['commission_type'])) {
                $currency->commission_type = @$purifiedData['commission_type'];
            }
            if (isset($purifiedData['minSell'])) {
                $currency->min_sell = @$purifiedData['minSell'];
            }
            if (isset($purifiedData['maxSell'])) {
                $currency->max_sell = @$purifiedData['maxSell'];
            }
            if (isset($purifiedData['reserve'])) {
                $currency->reserve = @$purifiedData['reserve'];
            }
            if (isset($purifiedData['note'])) {
                $currency->note = @$purifiedData['note'];
            }

            $currency->status = isset($purifiedData['status']) == 'true' ? 1 : 0;
            $currency->buy_status = isset($purifiedData['buyStatus']) == 'true' ? 1 : 0;
            $currency->sell_status = isset($purifiedData['sellStatus']) == 'true' ? 1 : 0;

            if ($request->hasFile('image')) {
                try {
                    $currency->image = $this->uploadImage($request->image, config('location.currency.path'), config('location.currency.size'));
                } catch (\Exception $exp) {
                    return back()->with('error', 'Image could not be uploaded.');
                }
            }

            $currency->flag = 1;
            $currency->save();
            return back()->with('success', 'Currency Successfully Saved');

        } catch (\Exception $e) {
            return back();
        }

    }

    public function editCrypto($id)
    {
        $data['crypto'] = Currency::findOrFail($id);
        return view('admin.currency.crypto.edit', $data);
    }

    public function updateCrypto(Request $request, $id)
    {
        $purifiedData = Purify::clean($request->except('image', '_token', '_method'));
        $rules = [
            'name' => 'required|max:40',
            'code' => 'required',
            'symbol' => 'required',
            'buy_rate' => 'required|numeric|min:0',
            'sell_rate' => 'required|numeric|min:0',
            'reserve' => 'required|numeric|min:0',
            'minSell' => 'required|numeric|min:0',
            'maxSell' => 'required|numeric|min:0',
            'commission_rate' =>'required|numeric|min:0',
            'commission_type' =>'required',
        ];
        $message = [
            'name.required' => 'Name field is required',
            'name.max' => 'This field may not be greater than :max characters',
            'code.required' => 'Code field is required',
            'symbol.required' => 'Symbol field is required',
            'buy_rate.required' => 'Buy Rate field is required',
            'sell_rate.required' => 'Sell Rate field is required',
            'reserve.required' => 'Reserve field is required',
            'minSell.required' => 'Minimum Sell field is required',
            'maxSell.required' => 'Maximum Sell field is required',
            'commission_rate.required' => 'Commission Rate  is required',
            'commission_type.required' => 'Commission Type is required',
        ];

        $validate = Validator::make($purifiedData, $rules, $message);

        if ($validate->fails()) {
            return back()->withInput()->withErrors($validate);
        }

        try {
            $input_form = [];
            if ($request->has('field_name')) {
                for ($a = 0; $a < count($request->field_name); $a++) {
                    $arr = array();
                    $arr['field_name'] = clean($request->field_name[$a]);
                    $arr['field_level'] = $request->field_name[$a];
                    $arr['type'] = $request->type[$a];
                    $arr['validation'] = $request->validation[$a];
                    $input_form[$arr['field_name']] = $arr;
                }
            }

            $input_post = [];
            if ($request->has('field_specification')) {
                for ($a = 0; $a < count($request->field_specification); $a++) {
                    $arr = array();
                    $arr['field_name'] = clean($request->field_specification[$a]);
                    $arr['field_level'] = $request->field_specification[$a];
                    $arr['type'] = $request->type_specification[$a];
                    $arr['validation'] = $request->validation_specification[$a];
                    $input_post[$arr['field_name']] = $arr;
                }
            }

            $currency = Currency::findOrFail($id);

            if (isset($purifiedData['name'])) {
                $currency->name = @$purifiedData['name'];
            }
            if (isset($purifiedData['code'])) {
                $currency->code = strtoupper(@$purifiedData['code']);
            }
            if (isset($purifiedData['symbol'])) {
                $currency->symbol = @$purifiedData['symbol'];
            }
            if (isset($purifiedData['buy_rate'])) {
                $currency->buy_rate = @$purifiedData['buy_rate'];
            }
            if (isset($purifiedData['sell_rate'])) {
                $currency->sell_rate = @$purifiedData['sell_rate'];
            }
            if (isset($purifiedData['commission_rate'])) {
                $currency->commission_rate = @$purifiedData['commission_rate'];
            }
            if (isset($purifiedData['commission_type'])) {
                $currency->commission_type = @$purifiedData['commission_type'];
            }
            if (isset($purifiedData['minSell'])) {
                $currency->min_sell = @$purifiedData['minSell'];
            }
            if (isset($purifiedData['maxSell'])) {
                $currency->max_sell = @$purifiedData['maxSell'];
            }
            if (isset($purifiedData['reserve'])) {
                $currency->reserve = @$purifiedData['reserve'];
            }

            $currency->status = isset($purifiedData['status']) == 'true' ? 1 : 0;
            $currency->buy_status = isset($purifiedData['buyStatus']) == 'true' ? 1 : 0;
            $currency->sell_status = isset($purifiedData['sellStatus']) == 'true' ? 1 : 0;

            if ($request->hasFile('image')) {
                $currency->image = $this->uploadImage($request->image, config('location.currency.path'), config('location.currency.size'), $currency->image);
            }

            if (isset($purifiedData['field_name'])) {
                $currency->form_field = $input_form;
            }

            if (isset($purifiedData['field_specification'])) {
                $currency->receiver_form = $input_post;
            }

            if (isset($purifiedData['note'])) {
                $currency->note = @$purifiedData['note'];
            }

            $currency->save();
            return back()->with('success', 'Updated Successfully');

        } catch (\Exception $e) {
            return back();
        }

    }

    public function deleteCrypto($id)
    {
        $currency = Currency::findOrFail($id);

        $old_image = $currency->image;
        $location = config('location.currency.path');
        if (!empty($old_image)) {
            @unlink($location . '/' . $old_image);
        }

        $currency->delete();
        return back()->with('success', 'Currency has been deleted');
    }

    public function activeMultiple(Request $request)
    {
        if ($request->strIds == null) {
            session()->flash('error', 'You do not select ID.');
            return response()->json(['error' => 1]);
        } else {
            Currency::whereIn('id', $request->strIds)->update([
                'status' => 1,
            ]);
            session()->flash('success', 'Currencies Has Been Active');
            return response()->json(['success' => 1]);
        }

    }

    public function deActiveMultiple(Request $request)
    {
        if ($request->strIds == null) {
            session()->flash('error', 'You do not select ID.');
            return response()->json(['error' => 1]);
        } else {
            Currency::whereIn('id', $request->strIds)->update([
                'status' => 0,
            ]);
            session()->flash('success', 'Currencies Has Been Deactive');
            return response()->json(['success' => 1]);
        }
    }

    public function listFiat()
    {
        $data['control'] = Configure::first();
        $data['currency'] = Currency::where('flag', 0)->orderBy('id', 'desc')->get();
        return view('admin.currency.fiat.list', $data);
    }

    public function fiatControlAction(Request $request)
    {
        $configure = Configure::firstOrNew();
        $reqData = Purify::clean($request->except('_token', '_method'));

        $request->validate([
            'fiat_currency_api' => 'required',
        ]);


        config(['basic.fiat_currency_status' => (int)$reqData['fiat_currency_status']]);
        config(['basic.fiat_currency_api' => $reqData['fiat_currency_api']]);

        $fp = fopen(base_path() . '/config/basic.php', 'w');
        fwrite($fp, '<?php return ' . var_export(config('basic'), true) . ';');
        fclose($fp);

        $configure->fill($reqData)->save();

        session()->flash('success', ' Updated Successfully');

        Artisan::call('optimize:clear');
        Artisan::call('config:clear');
        Artisan::call('view:clear');
        return back();
    }
    public function cryptoControlAction(Request $request)
    {
        $configure = Configure::firstOrNew();
        $reqData = Purify::clean($request->except('_token', '_method'));

        $request->validate([
            'crypto_currency_api' => 'required',
        ]);


        config(['basic.crypto_currency_status' => (int)$reqData['crypto_currency_status']]);
        config(['basic.crypto_currency_api' => $reqData['crypto_currency_api']]);

        $fp = fopen(base_path() . '/config/basic.php', 'w');
        fwrite($fp, '<?php return ' . var_export(config('basic'), true) . ';');
        fclose($fp);

        $configure->fill($reqData)->save();

        session()->flash('success', ' Updated Successfully');

        Artisan::call('optimize:clear');
        Artisan::call('config:clear');
        Artisan::call('view:clear');
        return back();
    }

    public function createFiat()
    {
        return view('admin.currency.fiat.create');
    }

    public function storeFiat(Request $request)
    {
        $purifiedData = Purify::clean($request->except('image', '_token', '_method'));
        $rules = [
            'name' => 'required|max:40',
            'code' => 'required',
            'symbol' => 'required',
            'reserve' => 'required|numeric|min:0',
            'buy_rate' => 'required|numeric|min:0',
            'sell_rate' => 'required|numeric|min:0',
            'minSell' => 'required|numeric|min:0',
            'maxSell' => 'required|numeric|min:0',
            'commission_rate' =>'required|numeric|min:0',
            'commission_type' =>'required',
        ];
        $message = [
            'name.required' => 'Name field is required',
            'name.max' => 'This field may not be greater than :max characters',
            'code.required' => 'Code field is required',
            'symbol.required' => 'Symbol field is required',
            'rate.required' => 'Rate field is required',
            'minSell.required' => 'Minimum Sell field is required',
            'maxSell.required' => 'Maximum Sell field is required',
            'commission_rate.required' => 'Commission Rate  is required',
            'commission_type.required' => 'Commission Type is required',
        ];

        $validate = Validator::make($purifiedData, $rules, $message);

        if ($validate->fails()) {
            return back()->withInput()->withErrors($validate);
        }

        try {
            $currency = new Currency();

            $input_form = [];
            if ($request->has('field_name')) {
                for ($a = 0; $a < count($request->field_name); $a++) {
                    $arr = array();
                    $arr['field_name'] = clean($request->field_name[$a]);
                    $arr['field_level'] = $request->field_name[$a];
                    $arr['type'] = $request->type[$a];
                    $arr['validation'] = $request->validation[$a];
                    $input_form[$arr['field_name']] = $arr;
                }
            }

            $input_post = [];
            if ($request->has('field_specification')) {
                for ($a = 0; $a < count($request->field_specification); $a++) {
                    $arr = array();
                    $arr['field_name'] = clean($request->field_specification[$a]);
                    $arr['field_level'] = $request->field_specification[$a];
                    $arr['type'] = $request->type_specification[$a];
                    $arr['validation'] = $request->validation_specification[$a];
                    $input_post[$arr['field_name']] = $arr;
                }
            }

            if (isset($purifiedData['field_name'])) {
                $currency->form_field = $input_form;
            }

            if (isset($purifiedData['field_specification'])) {
                $currency->receiver_form = $input_post;
            }

            if (isset($purifiedData['name'])) {
                $currency->name = @$purifiedData['name'];
            }
            if (isset($purifiedData['code'])) {
                $currency->code = strtoupper(@$purifiedData['code']);
            }
            if (isset($purifiedData['symbol'])) {
                $currency->symbol = @$purifiedData['symbol'];
            }
            if (isset($purifiedData['buy_rate'])) {
                $currency->buy_rate = @$purifiedData['buy_rate'];
            }
            if (isset($purifiedData['sell_rate'])) {
                $currency->sell_rate = @$purifiedData['sell_rate'];
            }
            if (isset($purifiedData['minSell'])) {
                $currency->min_sell = @$purifiedData['minSell'];
            }
            if (isset($purifiedData['maxSell'])) {
                $currency->max_sell = @$purifiedData['maxSell'];
            }
            if (isset($purifiedData['commission_rate'])) {
                $currency->commission_rate = @$purifiedData['commission_rate'];
            }
            if (isset($purifiedData['commission_type'])) {
                $currency->commission_type = @$purifiedData['commission_type'];
            }
            if (isset($purifiedData['reserve'])) {
                $currency->reserve = @$purifiedData['reserve'];
            }
            if (isset($purifiedData['note'])) {
                $currency->note = @$purifiedData['note'];
            }

            $currency->status = isset($purifiedData['status']) == 'true' ? 1 : 0;
            $currency->buy_status = isset($purifiedData['buyStatus']) == 'true' ? 1 : 0;
            $currency->sell_status = isset($purifiedData['sellStatus']) == 'true' ? 1 : 0;

            if ($request->hasFile('image')) {
                try {
                    $currency->image = $this->uploadImage($request->image, config('location.currency.path'), config('location.currency.size'));
                } catch (\Exception $exp) {
                    return back()->with('error', 'Image could not be uploaded.');
                }
            }

            $currency->flag = 0;
            $currency->save();
            return back()->with('success', 'Currency Successfully Saved');

        } catch (\Exception $e) {
            return back();
        }
    }

    public function editFiat($id)
    {
        $data['fiat'] = Currency::findOrFail($id);
        return view('admin.currency.fiat.edit', $data);
    }

    public function updateFiat(Request $request, $id)
    {
        $purifiedData = Purify::clean($request->except('image', '_token', '_method'));
        $rules = [
            'name' => 'required|max:40',
            'code' => 'required',
            'symbol' => 'required',
            'buy_rate' => 'required|numeric|min:0',
            'sell_rate' => 'required|numeric|min:0',
            'reserve' => 'required|numeric|min:0',
            'minSell' => 'required|numeric|min:0',
            'maxSell' => 'required|numeric|min:0',
            'commission_rate' =>'required|numeric|min:0',
            'commission_type' =>'required',
        ];
        $message = [
            'name.required' => 'Name field is required',
            'name.max' => 'This field may not be greater than :max characters',
            'code.required' => 'Code field is required',
            'symbol.required' => 'Symbol field is required',
            'buy_rate.required' => 'Buy Rate field is required',
            'sell_rate.required' => 'Sell Rate field is required',
            'reserve.required' => 'Reserve field is required',
            'minSell.required' => 'Minimum Sell field is required',
            'maxSell.required' => 'Maximum Sell field is required',
            'commission_rate.required' => 'Commission Rate  is required',
            'commission_type.required' => 'Commission Type is required',
        ];

        $validate = Validator::make($purifiedData, $rules, $message);

        if ($validate->fails()) {
            return back()->withInput()->withErrors($validate);
        }

        try {
            $input_form = [];
            if ($request->has('field_name')) {
                for ($a = 0; $a < count($request->field_name); $a++) {
                    $arr = array();
                    $arr['field_name'] = clean($request->field_name[$a]);
                    $arr['field_level'] = $request->field_name[$a];
                    $arr['type'] = $request->type[$a];
                    $arr['validation'] = $request->validation[$a];
                    $input_form[$arr['field_name']] = $arr;
                }
            }

            $input_post = [];
            if ($request->has('field_specification')) {
                for ($a = 0; $a < count($request->field_specification); $a++) {
                    $arr = array();
                    $arr['field_name'] = clean($request->field_specification[$a]);
                    $arr['field_level'] = $request->field_specification[$a];
                    $arr['type'] = $request->type_specification[$a];
                    $arr['validation'] = $request->validation_specification[$a];
                    $input_post[$arr['field_name']] = $arr;
                }
            }

            $currency = Currency::findOrFail($id);

            if (isset($purifiedData['name'])) {
                $currency->name = @$purifiedData['name'];
            }
            if (isset($purifiedData['code'])) {
                $currency->code = strtoupper(@$purifiedData['code']);
            }
            if (isset($purifiedData['symbol'])) {
                $currency->symbol = @$purifiedData['symbol'];
            }
            if (isset($purifiedData['buy_rate'])) {
                $currency->buy_rate = @$purifiedData['buy_rate'];
            }
            if (isset($purifiedData['sell_rate'])) {
                $currency->sell_rate = @$purifiedData['sell_rate'];
            }
            if (isset($purifiedData['minSell'])) {
                $currency->min_sell = @$purifiedData['minSell'];
            }
            if (isset($purifiedData['maxSell'])) {
                $currency->max_sell = @$purifiedData['maxSell'];
            }
            if (isset($purifiedData['commission_rate'])) {
                $currency->commission_rate = @$purifiedData['commission_rate'];
            }
            if (isset($purifiedData['commission_type'])) {
                $currency->commission_type = @$purifiedData['commission_type'];
            }
            if (isset($purifiedData['reserve'])) {
                $currency->reserve = @$purifiedData['reserve'];
            }

            if (isset($purifiedData['field_name'])) {
                $currency->form_field = $input_form;
            }

            if (isset($purifiedData['field_specification'])) {
                $currency->receiver_form = $input_post;
            }

            if (isset($purifiedData['note'])) {
                $currency->note = @$purifiedData['note'];
            }

            $currency->status = isset($purifiedData['status']) == 'true' ? 1 : 0;
            $currency->buy_status = isset($purifiedData['buyStatus']) == 'true' ? 1 : 0;
            $currency->sell_status = isset($purifiedData['sellStatus']) == 'true' ? 1 : 0;

            if ($request->hasFile('image')) {
                $currency->image = $this->uploadImage($request->image, config('location.currency.path'), config('location.currency.size'), $currency->image);
            }

            $currency->save();
            return back()->with('success', 'Updated Successfully');

        } catch (\Exception $e) {
            return back();
        }
    }

    public function deleteFiat($id)
    {
        $currency = Currency::findOrFail($id);

        $old_image = $currency->image;
        $location = config('location.currency.path');
        if (!empty($old_image)) {
            @unlink($location . '/' . $old_image);
        }

        $currency->delete();
        return back()->with('success', 'Currency has been deleted');
    }

    public function activeMultipleFiat(Request $request)
    {
        if ($request->strIds == null) {
            session()->flash('error', 'You do not select ID.');
            return response()->json(['error' => 1]);
        } else {
            Currency::whereIn('id', $request->strIds)->update([
                'status' => 1,
            ]);
            session()->flash('success', 'Currencies Has Been Active');
            return response()->json(['success' => 1]);
        }

    }

    public function deActiveMultipleFiat(Request $request)
    {
        if ($request->strIds == null) {
            session()->flash('error', 'You do not select ID.');
            return response()->json(['error' => 1]);
        } else {
            Currency::whereIn('id', $request->strIds)->update([
                'status' => 0,
            ]);
            session()->flash('success', 'Currencies Has Been Deactive');
            return response()->json(['success' => 1]);
        }
    }

    public function orderList(Request $request,$user_id=null)
    {
        $status = array();
        $routeName = request()->route()->getName();
        if ($routeName == 'admin.exchange.orderPendingList') {
            $status = [0];
        } elseif ($routeName == 'admin.exchange.orderCompleteList') {
            $status = [1];
        } elseif ($routeName == 'admin.exchange.orderRejectList') {
            $status = [2];
        } else {
            $status = [0, 1, 2];
        }

        if($user_id != null){
            $data['sellCurrencies'] = CurrencySell::with(['sendCurrency', 'receiveCurrency'])->where('user_id',$user_id)->where('process_step', 3)->whereIn('status', $status)->orderBy('id', 'DESC')->paginate(config('basic.paginate'));
        }else{
            $data['sellCurrencies'] = CurrencySell::with(['sendCurrency', 'receiveCurrency'])->where('process_step', 3)->whereIn('status', $status)->orderBy('id', 'DESC')->paginate(config('basic.paginate'));
        }

        return view('admin.currency.order.list', $data);
    }

    public function orderListDetails($id)
    {

        $data['sellCurrencies'] = CurrencySell::with(['sendCurrency', 'receiveCurrency'])->findOrFail($id);
        return view('admin.currency.order.details', $data);
    }

    public function orderComplete(Request $request, $id)
    {
        $purifiedData = Purify::clean($request->except('image', '_token', '_method'));
        $rules = [
            'comments' => 'required',
        ];
        $message = [
            'comments.required' => 'Comment field is required',
        ];

        $validate = Validator::make($purifiedData, $rules, $message);

        if ($validate->fails()) {
            return back()->withInput()->withErrors($validate);
        }

        $sellCurrency = CurrencySell::with(['sendCurrency', 'receiveCurrency'])->findOrFail($id);

        $sendCurrency = $sellCurrency->sendCurrency;
        $sendCurrency->reserve += $sellCurrency->send_amount;
        $sendCurrency->save();

        $receiveCurrency = $sellCurrency->receiveCurrency;
        $receiveCurrency->reserve -= $sellCurrency->receive_amount;
        $receiveCurrency->save();

        $sellCurrency->comments = $request->comments;
        $sellCurrency->status = 1;
        $sellCurrency->save();

        $user = $sellCurrency->user;


        //Refarrel Bonus
        $data['sellCurrencies'] =$sellCurrency;

        $data['receiverCurrency'] = Currency::where('code',config('basic.currency'))->firstOrFail();


        $baseCurrency = config('basic.base_currency_rate');

        if ($data['sellCurrencies']->sendCurrency->flag != $data['receiverCurrency']->flag) // fiat-> crypto or Crypto-> Fiat
        {
            if ($data['sellCurrencies']->sendCurrency->flag == 0 && $data['receiverCurrency']->flag == 1)  //fiat-> crypto
            {
                $getDollarRate = $baseCurrency / $data['sellCurrencies']->sendCurrency->sell_rate;
                $amount = $getDollarRate * $data['sellCurrencies']->send_amount;
                $conversion = (1 / $data['receiverCurrency']->buy_rate) * $amount;
            } else  //crypto => fiat
            {
                $getDollarRate = $data['sellCurrencies']->sendCurrency->sell_rate / $baseCurrency;
                $amount = $getDollarRate * $data['sellCurrencies']->send_amount;
                $conversion = $data['receiverCurrency']->buy_rate * $amount;
            }
        } else {
            if ($data['sellCurrencies']->sendCurrency->flag == 0 && $data['receiverCurrency']->flag == 0) // fiat-> fiat
            {
                $getDollarRate = $data['receiverCurrency']->buy_rate / $data['sellCurrencies']->sendCurrency->sell_rate;
                $input = $getDollarRate * $data['sellCurrencies']->send_amount;
                $conversion = $input;
            } else // crypto-> crypto
            {
                $getDollarRate = $data['sellCurrencies']->sendCurrency->sell_rate / $data['receiverCurrency']->buy_rate;
                $conversion = $getDollarRate * $data['sellCurrencies']->send_amount;
            }
        }
        $inBaseCurrencyRate =  $conversion;

        BasicService::setBonus($user, $inBaseCurrencyRate, 'exchange_bonus');

        $msg = [
            'sendAmount' => $sellCurrency->send_amount,
            'receiveAmount' => $sellCurrency->receive_amount,
            'sendCurrency' => optional($sellCurrency->sendCurrency)->code ?? 'USD',
            'receiveCurrency' => optional($sellCurrency->receiveCurrency)->code ?? 'USD',
        ];
        $action = [
            "icon" => "fa fa-money-bill-alt text-white"
        ];
        $this->userPushNotification($user, 'EXCHANGE_COMPLETE ', $msg, $action);

        $this->sendMailSms($user, 'EXCHANGE_COMPLETE', [
            'sendAmount' => $sellCurrency->send_amount,
            'receiveAmount' => $sellCurrency->receive_amount,
            'sendCurrency' => optional($sellCurrency->sendCurrency)->code ?? 'USD',
            'receiveCurrency' => optional($sellCurrency->receiveCurrency)->code ?? 'USD',
            'comments' => $request->comments,
        ]);

        return back()->with('success', 'Sucessfully Updated');
    }

    public function orderReject(Request $request, $id)
    {
        $purifiedData = Purify::clean($request->except('image', '_token', '_method'));
        $rules = [
            'comments' => 'required',
        ];
        $message = [
            'comments.required' => 'Comment field is required',
        ];

        $validate = Validator::make($purifiedData, $rules, $message);

        if ($validate->fails()) {
            return back()->withInput()->withErrors($validate);
        }

        $sellCurrency = CurrencySell::findOrFail($id);

        if ($sellCurrency->status != 1) {
            $sellCurrency->status = 2;
            $sellCurrency->comments = $request->comments;
            $sellCurrency->save();
        } else {
            return back()->with('warning', 'Status are not change able');
        }

        $user = $sellCurrency->user;
        $msg = [
            'sendAmount' => $sellCurrency->send_amount,
            'receiveAmount' => $sellCurrency->receive_amount,
            'sendCurrency' => optional($sellCurrency->sendCurrency)->code ?? 'USD',
            'receiveCurrency' => optional($sellCurrency->receiveCurrency)->code ?? 'USD',
        ];
        $action = [
            "link" => "",
            "icon" => "fa fa-money-bill-alt text-white"
        ];
        $this->userPushNotification($user, 'EXCHANGE_REJECTED ', $msg, $action);

        $this->sendMailSms($user, 'EXCHANGE_REJECTED', [
            'sendAmount' => $sellCurrency->send_amount,
            'receiveAmount' => $sellCurrency->receive_amount,
            'sendCurrency' => optional($sellCurrency->sendCurrency)->code ?? 'USD',
            'receiveCurrency' => optional($sellCurrency->receiveCurrency)->code ?? 'USD',
            'comments' => $request->comments,
        ]);
        return back()->with('success', 'Sucessfully Updated');
    }

    public function search(Request $request)
    {

        $search = $request->all();
        $dateSearch = $request->date_time;
        $date = preg_match("/^[0-9]{2,4}\-[0-9]{1,2}\-[0-9]{1,2}$/", $dateSearch);

        $sellCurrencies = CurrencySell::with('user')->orderBy('id', 'DESC')
            ->when(isset($search['status']), function ($query) use ($search) {
                return $query->where('status', $search['status']);
            })
            ->when(isset($search['user_name']), function ($query) use ($search) {
                return $query->whereHas('user', function ($q) use ($search) {
                    $q->where('email', 'LIKE', "%{$search['user_name']}%")
                        ->orWhere('username', 'LIKE', "%{$search['user_name']}%");
                });
            })
            ->when($date == 1, function ($query) use ($dateSearch) {
                return $query->whereDate("created_at", $dateSearch);
            })->where('process_step', 3)
            ->paginate(config('basic.paginate'));


        return view('admin.currency.order.list', compact('sellCurrencies', 'search'));
    }


    public function testimonial($user_id=null)
    {
        if($user_id != null){
            $data['testimonials']=Testimonial::with('user')->where('user_id',$user_id)->get();
        }else{
            $data['testimonials']=Testimonial::with('user')->get();
        }
        return view('admin.testimonial.list', $data);
    }

    public function activeMultipleTestimonial(Request $request)
    {
        if ($request->strIds == null) {
            session()->flash('error', 'You do not select ID.');
            return response()->json(['error' => 1]);
        } else {
            Testimonial::whereIn('id', $request->strIds)->update([
                'status' => 1,
            ]);
            session()->flash('success', 'Testimonial Has Been Approve');
            return response()->json(['success' => 1]);
        }

    }

    public function pendingMultipleTestimonial(Request $request)
    {
        if ($request->strIds == null) {
            session()->flash('error', 'You do not select ID.');
            return response()->json(['error' => 1]);
        } else {
            Testimonial::whereIn('id', $request->strIds)->update([
                'status' => 0,
            ]);
            session()->flash('success', 'Testimonial Has Been Pending');
            return response()->json(['success' => 1]);
        }
    }

    public function exchangeCharge(Request $request)
    {
        $currencySell =CurrencySell::findOrFail($request->id);
        $currencySell->receive_amount =$request->receiveAmount;
        $currencySell->send_amount =$request->sendAmount;

        $currencySell->save();

        return back()->with('success', 'Sucessfully Updated');
    }
}
