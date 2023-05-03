<section class="home-section">
    <div class="container h-100 pt-5">
        <div class="row h-100 gx-4 gy-5 g-lg-5 align-items-center justify-content-between">
            @if(isset($templates['hero'][0]) && $hero = $templates['hero'][0])
                <div class="col-lg-6">
                    <div class="text-box">
                        <h5>
                            <img src="{{asset($themeTrue).'/images/icon/lightning.png'}}"
                                 alt="..."/>@lang(optional($hero->description)->title)
                        </h5>
                        <h1>
                            @lang(optional($hero->description)->sub_title)
                        </h1>
                        <p>
                            @lang(optional($hero->description)->short_description)
                        </p>
                        <a href="{{$hero->templateMedia()->button_link}}">
                            <button class="btn-ico">@lang(optional($hero->description)->button_name)</button>
                        </a>
                    </div>
                </div>
            @endif

            @if($sendCurrencies)
                <div class="col-lg-5 ps-lg-5">
                    <div class="exchange-box">
                        <form action="{{route('user.sellCurrency.request')}}" method="post">
                            @csrf
                            <div class="row g-3">
                                <div class="col-12  currencies d-flex">
                                    <div>
                                        <img id="exchangeImg"
                                             src="{{getFile(config('location.currency.path'))}}"
                                             alt="..."/>
                                        <h5 id="exchangeName"></h5>
                                        <h5 id="exchangeName"></h5>
                                    </div>
                                    <i class="fad fa-exchange-alt"></i>

                                    <div>
                                        <img id="exchangeImg2"
                                             src="{{getFile(config('location.currency.path'))}}"
                                             alt="..."/>
                                        <h5 id="exchangeName2"></h5>
                                    </div>
                                </div>
                                <div class="input-box col-12 col-sm-6">
                                    <label for="">@lang('send')</label>
                                    <div class="mb-3">
                                        <input type="text" step="any" name="sendAmount" class="form-control inputAmount"
                                               placeholder="1"/>
                                        <p class="text-danger minMax"></p>
                                        @error('sendAmount')
                                        <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div>
                                        <select class="form-select" id="send" name="sendCurrency">
                                            @forelse($sendCurrencies as $currency)
                                                <option data-obj="{{$currency}}"
                                                        data-img="{{getFile(config('location.currency.path').$currency->image)}}"
                                                        value="{{$currency->id}}">
                                                    @lang($currency->name)
                                                </option>
                                            @empty
                                            @endforelse
                                        </select>
                                        @error('sendCurrency')
                                        <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="input-box col-12 col-sm-6">
                                    <label for="">@lang('Receive')</label>
                                    <div class="mb-3">
                                        <input type="number" step="any" name="receiveAmount" class="form-control getAmount" readonly
                                               placeholder="0.00"/>
                                        @error('receiveAmount')
                                        <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div>
                                        <select class="form-select" id="receive" name="receiveCurrency">
                                            @forelse($getCurrencies as $currency)
                                                <option data-obj="{{$currency}}"
                                                        data-img="{{getFile(config('location.currency.path').$currency->image)}}"
                                                        value="{{$currency->id}}">
                                                    @lang($currency->name)
                                                </option>
                                            @empty
                                            @endforelse
                                        </select>
                                        @error('receiveCurrency')
                                        <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-12 ">
                                    <div class="d-flex flex-wrap justify-content-between">
                                        <input type="hidden" class="rate" name="rate" value="">
                                        <span class="exchange-rate">@lang('Exchange rate: 1 USD = 89 BDT')</span>
                                        <span id="reserve"></span>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <button type="submit" class="btn-ico">@lang('swap currencies')</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            @endif
        </div>
    </div>

</section>
@push('script')
    <script>
        var inputAmount = 0, getAmount = 0, senderFlag = 0
            receiverFlag = 0, sendCurrency = {}, receiveCurrency = {}
        baseCurrency = "{{config('basic.base_currency_rate')}}";


        sendCurrency = $('#send').find(':selected').data('obj')
        if(sendCurrency){
            $('#exchangeName').text(sendCurrency.name);
            senderFlag = sendCurrency.flag;
            $('#exchangeImg').attr('src', $('#send').find(':selected').data('img'));
        }

            receiveCurrency = $('#receive').find(':selected').data('obj')

        if(receiveCurrency){
            $('#exchangeName2').text(receiveCurrency.name);
            receiverFlag = receiveCurrency.flag;
            $('#reserve').text(`Reserve: ${receiveCurrency.reserve} ${receiveCurrency.code}`)
        }
        if(receiveCurrency) {
            checkCalc(inputAmount = 0, getAmount = 0, sendCurrency, receiveCurrency, senderFlag, receiverFlag)
        }


        $('#exchangeImg2').attr('src', $('#receive').find(':selected').data('img'));
        $('.inputAmount').on('keyup', function () {
            inputAmount = $(this).val()


            if(parseFloat(sendCurrency.min_sell)>inputAmount){
                $('.minMax').text(`Minimum ${sendCurrency.min_sell} ${sendCurrency.code}`);
                return 0;
            }else{
                $('.minMax').text(``);
            }

            if(parseFloat(sendCurrency.max_sell) < inputAmount){
                $('.minMax').text(`Maximum ${sendCurrency.max_sell} ${sendCurrency.code}`);
                return 0;
            }else{
                $('.minMax').text(``);
            }

            checkCalc(inputAmount, getAmount, sendCurrency, receiveCurrency, senderFlag, receiverFlag)
        });

        $('.getAmount').on('keyup', function () {
            getAmount = $(this).val();
            checkCalc(inputAmount, getAmount, sendCurrency, receiveCurrency, senderFlag, receiverFlag)
        });

        $('#send').on('change', function () {
            var img = $(this).find(':selected').data('img')
            var obj = $(this).find(':selected').data('obj')
            var receiveObj = $('#receive').find(':selected').data('obj')
            $('#exchangeName').text(obj.name);
            $('#exchangeImg').attr('src', img);
            $('.exchange-rate').text(`Exchange rate: 1 ${obj.code} = 89 ${receiveObj.code}`)
            senderFlag = obj.flag;
            sendCurrency = obj;

            checkCalc(inputAmount, getAmount, sendCurrency, receiveCurrency, senderFlag, receiverFlag)
        });

        $('#receive').change(function () {
            $('.inputAmount').val(0)
            $('.getAmount').val(0)

            inputAmount = 0;
            getAmount = 0;
            commissionRate =0;

            var obj = $(this).find(':selected').data('obj')
            var senderObj = $('#send').find(':selected').data('obj')
            receiveCurrency = obj;
            receiverFlag = obj.flag;
            var img = $(this).find(':selected').data('img')
            $('#exchangeImg2').attr('src', img);
            $('#exchangeName2').text(obj.name);
            $('.exchange-rate').text(`Exchange rate: 1 ${senderObj.code} = 89 ${obj.code}`)
            $('#reserve').text("Reserve: " + obj.reserve + " " + obj.code);

            checkCalc(inputAmount, getAmount, sendCurrency, receiveCurrency, senderFlag, receiverFlag);
        });

        function checkCalc(inputAmount = 0, getAmount = 0, sendCurrency, receiveCurrency, senderFlag, receiverFlag) {


            if(inputAmount == 0){
                $('.minMax').text(``);
            }


            if (senderFlag != receiverFlag) { // fiat-> crypto or Crypto-> Fiat

                if (senderFlag == 0 && receiverFlag == 1) { //fiat-> crypto
                    var getDollarRate = parseFloat(baseCurrency) / sendCurrency.sell_rate; // BASE_CURRENCY_RATE /GBP Rate

                    var amount = getDollarRate * inputAmount; //( getDollarRate * sendAmount)
                    var conversionRate = (1 / receiveCurrency.buy_rate) * getDollarRate;
                    var conversion = (1 / receiveCurrency.buy_rate) * amount;  // 1 /btc_rate * $sss

                    $('.getAmount').val(conversion.toFixed(8));

                    $('.exchange-rate').text(`1 ${sendCurrency.code} = ${conversionRate.toFixed(8)} ${receiveCurrency.code}`)
                    $('.rate').val(conversionRate);

                } else { //crypto => fiat
                    var getDollarRate = sendCurrency.sell_rate / parseFloat(baseCurrency);
                    var amount = getDollarRate * inputAmount;
                    var conversion = receiveCurrency.buy_rate * amount;
                    $('.getAmount').val(conversion.toFixed(4));
                    $('.exchange-rate').text(`1 ${sendCurrency.code} = ${getDollarRate.toFixed(2)} ${receiveCurrency.code}`)
                    $('.rate').val(getDollarRate);
                }

            } else {
                if (senderFlag == 0 && receiverFlag == 0) { // fiat-> fiat

                    var getDollarRate = receiveCurrency.buy_rate / sendCurrency.sell_rate; // BASE_CURRENCY_RATE /JPY Rate
                    var input = getDollarRate * inputAmount; //( getDollarRate * sendAmount)

                    $('.getAmount').val(input.toFixed(4));

                    $('.exchange-rate').text(`1 ${sendCurrency.code} = ${getDollarRate.toFixed(2)} ${receiveCurrency.code}`)
                    $('.rate').val(getDollarRate);

                } else { // crypto-> crypto
                    var getDollarRate = sendCurrency.sell_rate / receiveCurrency.buy_rate;
                    var conversion = getDollarRate * inputAmount;
                    $('.getAmount').val(conversion.toFixed(4));

                    $('.exchange-rate').text(`1 ${sendCurrency.code} = ${getDollarRate.toFixed(2)} ${receiveCurrency.code}`)
                    $('.rate').val(getDollarRate);
                }
            }
        }
    </script>
@endpush
