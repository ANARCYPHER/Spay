@extends('admin.layouts.app')
@section('title')
    @lang('Exchange #'.$sellCurrencies->exchange_id)
@endsection

@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">@lang('Transaction Information')
                            @if($sellCurrencies->status != 1)
                                <button data-toggle="modal" data-target="#action"
                                        class="btn btn-primary btn-sm float-right mb-2"><i
                                        class="fa fa-check-circle"></i>
                                    @lang('Action')
                                </button>
                            @endif
                        </h4>
                        <div class="p-4 border shadow-sm rounded">
                            <div class="row">
                                <div class="col-md-4 border-right">
                                    <ul class="list-style-none">
                                        <li class="my-2 border-bottom pb-3">
                                            <span class="font-weight-medium text-dark"><i
                                                    class="icon-info mr-2"></i>@lang('Exchange'): {{optional($sellCurrencies->sendCurrency)->code}}<i
                                                    class="fa fa-exchange-alt text-info px-2"></i> {{optional($sellCurrencies->receiveCurrency)->code}} <small
                                                    class="float-right">{{Carbon\Carbon::parse($sellCurrencies->created_at)->format('d M, Y H:i')}}</small></span>
                                        </li>
                                        <li class="my-3">
                                            <span><i class="icon-check mr-2"></i> @lang('Exchange Id') : <span
                                                    class="font-weight-medium text-dark">{{$sellCurrencies->exchange_id}}</span></span>
                                        </li>

                                        <li class="my-3">
                                            <span><i class="icon-check mr-2"></i> @lang('Send Currency') : <span
                                                    class="font-weight-medium text-dark">{{optional($sellCurrencies->sendCurrency)->name}}</span></span>
                                        </li>
                                        <li class="my-3">
                                            <span><i class="icon-check mr-2"></i> @lang('Receive Currency') : <span
                                                    class="font-weight-medium text-dark">{{optional($sellCurrencies->receiveCurrency)->name}}</span></span>
                                        </li>
                                        <li class="my-3">
                                            <span><i class="icon-check mr-2"></i> @lang('Send Amount') : <span
                                                    class="font-weight-medium text-info">{{$sellCurrencies->send_amount}} {{optional($sellCurrencies->sendCurrency)->code}}</span></span>
                                            @if($sellCurrencies->status != 1)
                                                <span class="info sendExchange" title='@lang("Edit Exchange")'
                                                      data-resource="{{$sellCurrencies}}" data-toggle="modal"
                                                      data-target="#changeExchange">
                                                <img class="info-icon"
                                                     src="{{asset('assets/admin/images/info.png')}}"
                                                     alt="...">
                                            @endif
                                    </span>
                                        </li>
                                        <li class="my-3">
                                            <span><i class="icon-check mr-2"></i> @lang('Receive Amount') : <span
                                                    class="font-weight-medium text-success">{{$sellCurrencies->receive_amount}} {{optional($sellCurrencies->receiveCurrency)->code}}</span></span>
                                        </li>

                                        <li class="my-3">
                                            <span><i class="icon-check mr-2"></i>@lang('Rate') : <span
                                                    class="font-weight-bold">@lang('1') {{optional($sellCurrencies->sendCurrency)->code}} <i
                                                        class="fa fa-exchange-alt text-info px-2"></i> {{$sellCurrencies->rate}} {{optional($sellCurrencies->receiveCurrency)->code}}</span></span>
                                        </li>

                                        <li class="my-3">
                                            <span><i class="icon-check mr-2"></i> @lang('Status') :
                                                @if($sellCurrencies->status == 0)
                                                    <span
                                                        class="badge badge-warning badge-pill">@lang('Awaiting')</span>
                                                @elseif($sellCurrencies->status == 1)
                                                    <span
                                                        class="badge badge-success badge-pill">@lang('Completed')</span>
                                                @elseif($sellCurrencies->status == 2)
                                                    <span class="badge badge-danger badge-pill">@lang('Rejected')</span>
                                                @endif
                                            </span></li>
                                    </ul>
                                </div>

                                @if(isset($sellCurrencies->sender_info) && !empty($sellCurrencies->sender_info))
                                    <div class="col-md-4 border-right">
                                        <ul class="list-style-none ">
                                            <li class="my-2 border-bottom pb-3">
                                            <span class="font-weight-medium text-dark"><i
                                                    class="fa fa-hand-holding-usd mr-2 text-warning"></i>@lang('Send Currency Information')<small
                                                    class="float-right font-weight-bold text-danger">@lang('Reserve: '){{optional($sellCurrencies->sendCurrency)->reserve}} {{optional($sellCurrencies->sendCurrency)->code}}</small></span></span>
                                            </li>


                                            @forelse($sellCurrencies->sender_info as $k => $v)

                                                @if ($v->type == 'text')
                                                    <li class="my-3">
                                                        <span><i class="icon-check mr-2 text-warning"></i>
                                                            {{ trans(@$v->field_level) }} :
                                                             <span
                                                                 class="font-weight-medium text-dark">{{ trans($v->field_value) }}</span>
                                                        </span>
                                                    </li>
                                                @elseif($v->type == 'textarea')
                                                    <div class="input-box">
                                                        <label
                                                            for="exampleFormControlInput1"
                                                            class="form-label">{{ trans(@$v->field_lavel) }}
                                                            @lang(':') <span
                                                                class="text-light">{{ trans($v->field_value) }}</span>
                                                        </label>
                                                    </div>
                                                @elseif($v->type == 'file')
                                                    <div class="form-group">
                                                        <label
                                                            for="exampleFormControlInput1"
                                                            class="form-label">{{ trans(@$v->field_lavel) }}
                                                        </label>
                                                    </div>
                                                @endif
                                            @empty
                                            @endforelse
                                        </ul>
                                    </div>
                                @endif

                                @if(isset($sellCurrencies->receiver_info) && !empty($sellCurrencies->receiver_info))
                                    <div class="col-md-4 ">
                                        <ul class="list-style-none">
                                            <li class="my-2 border-bottom pb-3">
                                            <span class="font-weight-medium text-dark"><i
                                                    class="fa fa-hand-holding-usd mr-2 text-primary"></i> @lang('Receive Currency Information'):
                                                <small
                                                    class="float-right font-weight-bold text-danger">@lang('Reserve: '){{optional($sellCurrencies->receiveCurrency)->reserve}} {{optional($sellCurrencies->receiveCurrency)->code}}</small></span>
                                            </li>

                                            @forelse($sellCurrencies->receiver_info as $k => $v)

                                                @if ($v->type == 'text')
                                                    <li class="my-3">
                                                        <span><i class="icon-check mr-2 text-warning"></i>
                                                           {{ trans(@$v->field_level) }} :
                                                            <span
                                                                class="font-weight-medium text-dark">{{ trans($v->field_value) }}</span>
                                                        </span>
                                                    </li>
                                                @elseif($v->type == 'textarea')
                                                    <div class="input-box">
                                                        <label
                                                            for="exampleFormControlInput1"
                                                            class="form-label">{{ trans(@$v->field_level) }}
                                                            @lang(':') <span
                                                                class="text-light">{{ trans($v->field_value) }}</span>
                                                        </label>
                                                    </div>
                                                @elseif($v->type == 'file')
                                                    <div class="form-group">
                                                        <label
                                                            for="exampleFormControlInput1"
                                                            class="form-label">{{ trans(@$v->field_level) }}
                                                        </label>
                                                    </div>
                                                @endif
                                            @empty
                                            @endforelse
                                        </ul>
                                    </div>
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        @if($sellCurrencies->comments)
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">@lang('Comment :')</h4>
                            <p>@lang($sellCurrencies->comments)</p>
                        </div>
                    </div>
                </div>
            </div>
        @endif
    </div>

    <!-- Change Exchange -->
    <div class="modal fade" id="changeExchange" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header modal-colored-header bg-primary">
                    <h5 class="modal-title"><i class="fa fa-plus-circle"></i> @lang('Exchange Edit')</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">×</button>
                </div>
                <form action="{{route('admin.exchangeCharge.submit')}}" method="post">
                    @csrf
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="price" class="font-weight-bold"> @lang('Amount') </label>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span
                                        class="input-group-text">{{optional($sellCurrencies->sendCurrency)->code}}</span>
                                </div>
                                <input type="text" name="sendAmount" class="form-control sendAmount"
                                       data-resource="{{$sellCurrencies}}"
                                       value="">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="input-group mb-3">
                                        <label>@lang('Receive Amount')</label>
                                        <label class="receiveAmount ml-2"></label>
                                        <input type="hidden" class="receiveAmount" name="receiveAmount" value="">
                                        <input type="hidden" name="id" value="{{$sellCurrencies->id}}">
                                        <div class="input-group-prepend">
                                            <label
                                                class="ml-2">{{optional($sellCurrencies->receiveCurrency)->code}}</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-success"><span>@lang('Submit')</span>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Action Modal -->
    <div class="modal fade" id="action" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header modal-colored-header bg-primary">
                    <h5 class="modal-title"><i class="fa fa-plus-circle"></i> @lang('Action')</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">×</button>
                </div>
                <form action="" method="post" class="form">
                    @csrf
                    <div class="modal-body">
                        <p class="font-weight-medium">@lang('Are you sure to change this?')</p>
                        <div class="form-group">
                            <label for="comments" class="font-weight-bold"> @lang('Comment') </label>
                            <textarea name="comments" rows="4" class="form-control"
                                      required>{{old('comments')}}</textarea>

                            @error('comments')
                            <span class="text-danger">{{ $message }}</span>
                            @enderror
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-light" data-dismiss="modal"><span>@lang('Close')</span>
                            </button>
                            <button type="submit" class="btn btn-primary btnComplete"
                                    data-route="{{ route('admin.exchange.orderComplete',$sellCurrencies->id) }}">
                                <span>@lang('Complete')</span></button>
                            <button type="submit" class="btn btn-danger btnReject"
                                    data-route="{{ route('admin.exchange.orderReject',$sellCurrencies->id) }}">
                                <span>@lang('Reject')</span></button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection
@push('js')
    <script>
        "use strict";

        var receiveCurrencyId = 0, exchangeCharge = 0, inputAmount = 0, getAmount = 0, senderFlag = 0,
            receiverFlag = 0, sendCurrency = {}, receiveCurrency = {}

        $(document).on('click', '.sendExchange', function () {
            var obj = $(this).data('resource');
            $('.sendAmount').val(obj.send_amount);
            inputAmount = obj.send_amount;
            getAmount = obj.receive_amount;
            sendCurrency = obj.send_currency;
            receiveCurrency = obj.receive_currency;
            senderFlag = obj.send_currency.flag;
            receiverFlag = obj.receive_currency.flag;
            receiveCurrencyId = obj.receive_currency.id;

            $.ajax({
                url: "{{route('admin.ajax.exchangeCharge')}}",
                type: 'POST',
                data: {
                    receiveCurrencyId,
                    inputAmount
                },
                success(data) {
                    exchangeCharge = data.echangeCharge;
                    checkCalc(inputAmount, getAmount, sendCurrency, receiveCurrency, senderFlag, receiverFlag, exchangeCharge)
                },
                complete: function () {

                },
                error(err) {
                    var errors = err.responseJSON;
                    for (var obj in errors) {
                        $('.errors').text(`${errors[obj]}`)
                    }

                }
            });
        });

        $('.sendAmount').on('keyup', function () {
            this.value = this.value.replace(/[^0-9\.]/g,'');
            inputAmount = $(this).val()
            var obj = $(this).data('resource');
            getAmount = obj.receive_amount;
            sendCurrency = obj.send_currency;
            receiveCurrency = obj.receive_currency;
            senderFlag = obj.send_currency.flag;
            receiverFlag = obj.receive_currency.flag;
            receiveCurrencyId = obj.receive_currency.id;

            $.ajax({
                url: "{{route('admin.ajax.exchangeCharge')}}",
                type: 'POST',
                data: {
                    receiveCurrencyId,
                    inputAmount
                },
                success(data) {
                    exchangeCharge = data.echangeCharge;
                    checkCalc(inputAmount, getAmount, sendCurrency, receiveCurrency, senderFlag, receiverFlag, exchangeCharge)
                },
                complete: function () {

                },
                error(err) {
                    var errors = err.responseJSON;
                    for (var obj in errors) {
                        $('.errors').text(`${errors[obj]}`)
                    }

                }
            });
        });

        function checkCalc(inputAmount = 0, getAmount = 0, sendCurrency, receiveCurrency, senderFlag, receiverFlag, exchangeCharge) {


            if (senderFlag != receiverFlag) { // fiat-> crypto or Crypto-> Fiat

                if (senderFlag == 0 && receiverFlag == 1) { //fiat-> crypto
                    var getDollarRate = parseFloat(baseCurrency) / sendCurrency.sell_rate; // BASE_CURRENCY_RATE /GBP Rate

                    var amount = getDollarRate * inputAmount; //( getDollarRate * sendAmount)
                    var conversionRate = (1 / receiveCurrency.buy_rate) * getDollarRate;
                    var conversion = (1 / receiveCurrency.buy_rate) * amount;  // 1 /btc_rate * $sss

                    var finalRate = parseFloat(conversion) - parseFloat(exchangeCharge);
                    if(parseFloat(finalRate)<0){
                        finalRate = 0;
                    }
                    $('.receiveAmount').text(finalRate.toFixed(8));
                    $('.receiveAmount').val(finalRate.toFixed(8));


                } else { //crypto => fiat
                    var getDollarRate = sendCurrency.sell_rate / parseFloat(baseCurrency);
                    var amount = getDollarRate * inputAmount;
                    var conversion = receiveCurrency.buy_rate * amount;

                    var finalRate = parseFloat(conversion) - parseFloat(exchangeCharge);
                    if(parseFloat(finalRate)<0){
                        finalRate = 0;
                    }

                    $('.receiveAmount').text(finalRate.toFixed(4));
                    $('.receiveAmount').val(finalRate.toFixed(8));
                }

            } else {
                if (senderFlag == 0 && receiverFlag == 0) { // fiat-> fiat

                    var getDollarRate = receiveCurrency.buy_rate / sendCurrency.sell_rate; // BASE_CURRENCY_RATE /JPY Rate
                    var input = getDollarRate * inputAmount; //( getDollarRate * sendAmount)

                    var finalRate = parseFloat(input) - parseFloat(exchangeCharge);

                    if(parseFloat(finalRate)<0){
                        finalRate = 0;
                    }

                    $('.receiveAmount').text(finalRate.toFixed(4));
                    $('.receiveAmount').val(finalRate.toFixed(8));

                } else { // crypto-> crypto
                    var getDollarRate = sendCurrency.sell_rate / receiveCurrency.buy_rate;
                    var conversion = getDollarRate * inputAmount;

                    var finalRate = parseFloat(conversion) - parseFloat(exchangeCharge);
                    if(parseFloat(finalRate)<0){
                        finalRate = 0;
                    }

                    $('.receiveAmount').text(finalRate.toFixed(4));
                    $('.receiveAmount').val(finalRate.toFixed(8));
                }
            }
        }

        $(document).on('click', '.btnComplete', function () {
            var route = $(this).data('route');
            $('.form').attr('action', route)
        });
        $(document).on('click', '.btnReject', function () {
            var route = $(this).data('route');
            $('.form').attr('action', route)
        });
    </script>
@endpush
