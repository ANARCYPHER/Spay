<?php

namespace App\Http\Controllers;

use App\Models\Configure;
use App\Models\Content;
use App\Models\Currency;
use App\Models\CurrencySell;
use App\Models\Language;
use App\Models\Template;
use App\Models\Subscriber;
use App\Http\Traits\Notify;
use App\Models\Testimonial;
use Illuminate\Http\Request;
use App\Models\ContentDetails;
use Illuminate\Support\Facades\Artisan;
use Stevebauman\Purify\Facades\Purify;
use Illuminate\Support\Facades\Validator;
use Facades\App\Services\BasicCurl;

class FrontendController extends Controller
{
    use Notify;

    public function __construct()
    {
        $this->theme = template();
    }

    public function index()
    {

        $templateSection = ['hero', 'how-it-work', 'about-us', 'latest-exchange', 'faq', 'testimonial', 'blog', 'contact-us'];
        $data['templates'] = Template::templateMedia()->whereIn('section_name', $templateSection)->get()->groupBy('section_name');

        $contentSection = ['how-it-work', 'faq', 'testimonial', 'blog'];
        $data['contentDetails'] = ContentDetails::select('id', 'content_id', 'description', 'created_at')
            ->whereHas('content', function ($query) use ($contentSection) {
                return $query->whereIn('name', $contentSection);
            })
            ->with(['content:id,name',
                'content.contentMedia' => function ($q) {
                    $q->select(['content_id', 'description']);
                }])
            ->orderBy('created_at', 'desc')
            ->get()->groupBy('content.name');


        $currencies = Currency::whereStatus(1)->orderBy('name')->get();
        $data['sendCurrencies'] = $currencies->where('sell_status',1);
        $data['getCurrencies'] = $currencies->where('buy_status',1);

        $data['exchange'] = CurrencySell::with(['sendCurrency', 'receiveCurrency'])->whereProcess_step(3)->take(10)->orderBy('id', 'DESC')->get();

        $data['userTestimonial'] = Testimonial::with('user')->whereStatus(1)->orderBy('id', 'desc')->take(10)->get();

        return view($this->theme . 'home', $data);
    }


    public function about()
    {

        $templateSection = ['about-us', 'testimonial','faq','how-it-work'];
        $data['templates'] = Template::templateMedia()->whereIn('section_name', $templateSection)->get()->groupBy('section_name');

        $data['userTestimonial'] = Testimonial::with('user')->whereStatus(1)->orderBy('id', 'desc')->take(10)->get();

        $contentSection = ['testimonial','faq','how-it-work'];
        $data['contentDetails'] = ContentDetails::select('id', 'content_id', 'description', 'created_at')
            ->whereHas('content', function ($query) use ($contentSection) {
                return $query->whereIn('name', $contentSection);
            })
            ->with(['content:id,name',
                'content.contentMedia' => function ($q) {
                    $q->select(['content_id', 'description']);
                }])
            ->get()->groupBy('content.name');
        return view($this->theme . 'about', $data);
    }


    public function blog()
    {

        $data['title'] = "Blog";
        $contentSection = ['blog'];

        $templateSection = ['blog'];
        $data['templates'] = Template::templateMedia()->whereIn('section_name', $templateSection)->get()->groupBy('section_name');

        $data['contentDetails'] = ContentDetails::select('id', 'content_id', 'description', 'created_at')
            ->whereHas('content', function ($query) use ($contentSection) {
                return $query->whereIn('name', $contentSection);
            })
            ->with(['content:id,name',
                'content.contentMedia' => function ($q) {
                    $q->select(['content_id', 'description']);
                }])
            ->latest()
            ->get()->groupBy('content.name');
        return view($this->theme . 'blog', $data);
    }

    public function blogDetails($slug = null, $id)
    {
        $getData = Content::findOrFail($id);

        $contentSection = [$getData->name];
        $contentDetail = ContentDetails::select('id', 'content_id', 'description', 'created_at')
            ->where('content_id', $getData->id)
            ->whereHas('content', function ($query) use ($contentSection) {
                return $query->whereIn('name', $contentSection);
            })
            ->with(['content:id,name',
                'content.contentMedia' => function ($q) {
                    $q->select(['content_id', 'description']);
                }])
            ->get()->groupBy('content.name');

        $singleItem['title'] = @$contentDetail[$getData->name][0]->description->title;
        $singleItem['description'] = @$contentDetail[$getData->name][0]->description->description;
        $singleItem['date'] = dateTime(@$contentDetail[$getData->name][0]->created_at, 'd M, Y');
        $singleItem['image'] = getFile(config('location.content.path') . @$contentDetail[$getData->name][0]->content->contentMedia->description->image);


        $contentSectionPopular = ['blog'];
        $popularContentDetails = ContentDetails::select('id', 'content_id', 'description', 'created_at')
            ->where('content_id', '!=', $getData->id)
            ->whereHas('content', function ($query) use ($contentSectionPopular) {
                return $query->whereIn('name', $contentSectionPopular);
            })
            ->with(['content:id,name',
                'content.contentMedia' => function ($q) {
                    $q->select(['content_id', 'description']);
                }])
            ->get()->groupBy('content.name');

        return view($this->theme . 'blogDetails', compact('singleItem', 'popularContentDetails'));
    }


    public function faq()
    {

        $templateSection = ['faq'];
        $data['templates'] = Template::templateMedia()->whereIn('section_name', $templateSection)->get()->groupBy('section_name');

        $contentSection = ['faq'];
        $data['contentDetails'] = ContentDetails::select('id', 'content_id', 'description', 'created_at')
            ->whereHas('content', function ($query) use ($contentSection) {
                return $query->whereIn('name', $contentSection);
            })
            ->with(['content:id,name',
                'content.contentMedia' => function ($q) {
                    $q->select(['content_id', 'description']);
                }])
            ->get()->groupBy('content.name');

        $data['increment'] = 1;
        return view($this->theme . 'faq', $data);
    }

    public function contact()
    {
        $templateSection = ['contact-us'];
        $templates = Template::templateMedia()->whereIn('section_name', $templateSection)->get()->groupBy('section_name');
        $title = 'Contact Us';
        $contact = @$templates['contact-us'][0]->description;

        return view($this->theme . 'contact', compact('title', 'contact'));
    }

    public function contactSend(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|max:50',
            'email' => 'required|email|max:91',
            'subject' => 'required|max:100',
            'message' => 'required|max:1000',
        ]);
        $requestData = Purify::clean($request->except('_token', '_method'));

        $basic = (object)config('basic');
        $basicEmail = $basic->sender_email;

        $name = $requestData['name'];
        $email_from = $requestData['email'];
        $subject = $requestData['subject'];
        $message = $requestData['message'] . "<br>Regards<br>" . $name;
        $from = $email_from;

        $headers = "From: <$from> \r\n";
        $headers .= "Reply-To: <$from> \r\n";
        $headers .= "MIME-Version: 1.0\r\n";
        $headers .= "Content-Type: text/html; charset=ISO-8859-1\r\n";

        $to = $basicEmail;

        if (@mail($to, $subject, $message, $headers)) {
            // echo 'Your message has been sent.';
        } else {
            //echo 'There was a problem sending the email.';
        }

        return back()->with('success', 'Mail has been sent');
    }

    public function getLink($getLink = null, $id)
    {
        $getData = Content::findOrFail($id);

        $contentSection = [$getData->name];
        $contentDetail = ContentDetails::select('id', 'content_id', 'description', 'created_at')
            ->where('content_id', $getData->id)
            ->whereHas('content', function ($query) use ($contentSection) {
                return $query->whereIn('name', $contentSection);
            })
            ->with(['content:id,name',
                'content.contentMedia' => function ($q) {
                    $q->select(['content_id', 'description']);
                }])
            ->get()->groupBy('content.name');

        $title = @$contentDetail[$getData->name][0]->description->title;
        $description = @$contentDetail[$getData->name][0]->description->description;
        return view($this->theme . 'getLink', compact('contentDetail', 'title', 'description'));
    }

    public function subscribe(Request $request)
    {
        $rules = [
            'email' => 'required|email|max:255|unique:subscribers'
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return redirect(url()->previous() . '#subscribe')->withErrors($validator);
        }
        $data = new Subscriber();
        $data->email = $request->email;
        $data->save();
        return redirect(url()->previous() . '#subscribe')->with('success', 'Subscribed Successfully');
    }

    public function language($code)
    {
        $language = Language::where('short_name', $code)->first();
        if (!$language) $code = 'US';
        session()->put('trans', $code);
        session()->put('rtl', $language ? $language->rtl : 0);
        return redirect()->back();
    }

    public function exchangeRate()
    {
        $data['currencies'] = Currency::whereStatus(1)->paginate(config('basic.paginate'));
        return view($this->theme . 'exchangeRate', $data);
    }

    public function latestExchange()
    {
        $data['exchange'] = CurrencySell::with(['sendCurrency', 'receiveCurrency'])->whereProcess_step(3)->take(10)->orderBy('id', 'DESC')->get();
        return view($this->theme . 'latestExchange', $data);
    }

    public function fiatRate(Request $request)
    {
        if (config('basic.fiat_currency_status') == 0){
            return false;
        }

        if ($request->strIds == null) {
            session()->flash('error', 'You do not select ID.');
            return response()->json(['error' => 1]);
        } else {


            $countries = Currency::select('id', 'code', 'buy_rate', 'sell_rate','commission_rate','commission_type')
                ->when($request->strIds != null, function ($query)  {
                    $query->whereIn('id',request()->strIds);
                })
                ->where('flag', 0)->where('status', 1)->get();

            $endpoint = 'live';
            $access_key = config('basic.fiat_currency_api');
            $currencies = join(',', $countries->pluck('code')->toArray()) . ',' . config('basic.currency');



            $source = config('basic.currency');
            $curl = curl_init();
            curl_setopt_array($curl, array(
                CURLOPT_URL => "https://api.apilayer.com/currency_data/live?source=$source&currencies=$currencies",
                CURLOPT_HTTPHEADER => array(
                    "Content-Type: text/plain",
                    "apikey: $access_key"
                ),
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_ENCODING => "",
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_TIMEOUT => 0,
                CURLOPT_FOLLOWLOCATION => true,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => "GET"
            ));
            $response = curl_exec($curl);
            curl_close($curl);
            $res = json_decode($response);


            if ($res && $res->success == true) {
                $getRateCollect = collect($res->quotes)->toArray();
                foreach ($countries as $data) {
                    $newCode = $source . $data->code;

                    if (isset($getRateCollect[$newCode])) {
                        $data->buy_rate = @$getRateCollect[$newCode];
                        $data->sell_rate = @$getRateCollect[$newCode];
                        $data->update();
                    }
                }

                $configure = Configure::firstOrNew();
                $curl = curl_init();
                curl_setopt_array($curl, array(
                    CURLOPT_URL => "https://api.apilayer.com/currency_data/live?source=USD&currencies=" . config('basic.currency'),
                    CURLOPT_HTTPHEADER => array(
                        "Content-Type: text/plain",
                        "apikey: $access_key"
                    ),
                    CURLOPT_RETURNTRANSFER => true,
                    CURLOPT_ENCODING => "",
                    CURLOPT_MAXREDIRS => 10,
                    CURLOPT_TIMEOUT => 0,
                    CURLOPT_FOLLOWLOCATION => true,
                    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                    CURLOPT_CUSTOMREQUEST => "GET"
                ));
                $response = curl_exec($curl);
                curl_close($curl);
                $result = json_decode($response);

                $getRateCollectNew = collect($result->quotes)->toArray();
                $newCode2 = 'USD' . config('basic.currency');


                if (isset($getRateCollectNew[$newCode2])) {
                    $base_currency_rate = 1/$getRateCollectNew[$newCode2] ?? 1;


                    config(['basic.base_currency_rate' => $base_currency_rate]);
                    $fp = fopen(base_path() . '/config/basic.php', 'w');
                    fwrite($fp, '<?php return ' . var_export(config('basic'), true) . ';');
                    fclose($fp);
                    $configure->base_currency_rate = $base_currency_rate;
                    $configure->save();


                    $currencyBaseCheck = Currency::select('id', 'code', 'buy_rate', 'sell_rate','commission_rate','commission_type')
                        ->where('code',config('basic.currency'))->where('flag', 0)->where('status', 1)->get();

                    foreach ($currencyBaseCheck as $currency){
                        $currency->buy_rate = 1;
                        $currency->sell_rate = 1;
                        $currency->save();
                    }

                    $output = new \Symfony\Component\Console\Output\BufferedOutput();
                    Artisan::call('optimize:clear', array(), $output);
                    return $output->fetch();

                }

                session()->flash('success', 'Rate Updated');
                if($request->ajax()){
                    return response()->json(['success' => 1]);
                }else{
                    return 0;
                }
            }
        }



    }

    public function cryptoRate(Request $request)
    {
        if (config('basic.crypto_currency_status') == 0){
            return false;
        }

        if ($request->strIds == null) {
            session()->flash('error', 'You do not select ID.');
            return response()->json(['error' => 1]);
        }else{
            $countries = Currency::select('id', 'code', 'buy_rate', 'sell_rate','commission_rate','commission_type')
                ->when($request->strIds != null, function ($query)  {
                    $query->whereIn('id',request()->strIds);
                })
                ->where('flag', 1)->where('status', 1)->get();
            $access_key = config('basic.crypto_currency_api');
            $currencies = join(',', $countries->pluck('code')->toArray());
            $result = file_get_contents('https://min-api.cryptocompare.com/data/pricemulti?fsyms='.$currencies.'&tsyms=USD&api_key='.$access_key);
            $cryptos = json_decode($result);

            foreach ($cryptos as $key => $crypto){

                $output = $countries->where('code',$key)->first();
                if(!$output){
                    continue;
                }else{
                    $output->buy_rate = $crypto->USD;
                    $output->sell_rate = $crypto->USD;
                    $output->save();
                }

            }
            session()->flash('success', 'Rate Updated');
            if($request->ajax()){
                return response()->json(['success' => 1]);
            }else{
                return 0;
            }
        }
    }

    public function exchangeCharge(Request $request)
    {
        $currency = Currency::where('id', $request->receiveCurrencyId)->first();
        if (!$currency) {
            return response()->json(['error' => 'Invalid Gateway'], 422);
        }

        //Exchange Charge Calculation
        $exchangeCharge=0;
        if($currency->commission_rate > 0)
        {
            if($currency->commission_type == 0){
                $exchangeCharge= $currency->commission_rate;
            }else{
                $exchangeCharge=$request->inputAmount*$currency->commission_rate/100;
            }
        }

        return [
            'echangeCharge' => $exchangeCharge,
        ];

    }
}
