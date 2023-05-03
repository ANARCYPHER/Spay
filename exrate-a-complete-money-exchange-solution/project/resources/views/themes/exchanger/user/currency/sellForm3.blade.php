@extends($theme.'layouts.user')
@section('title')
    @lang('Information')
@endsection
@section('content')
    <section class="login-section ">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <form action="{{route('user.sellCurrency.step3Submit',$sellCurrencies->uuid)}}" method="post">
                        @csrf



                        <h4 class="text-white mb-3">@lang('Transaction Confirmation')</h4>

                        @if($basic->payment_notice)
                        <div class="bd-callout bd-callout-warning">
                            {{$basic->payment_notice}}
                        </div>
                        @endif

                        <div class=" mb-4 currency-img">
                            <h5 class="currency"><img
                                    src="{{getFile(config('location.currency.path').optional($sellCurrencies->sendCurrency)->image)}}"
                                    alt="...">
                                {{optional($sellCurrencies->sendCurrency)->name}} <span
                                    class="fa fa-exchange-alt mx-2"></span><img
                                    src="{{getFile(config('location.currency.path').optional($sellCurrencies->receiveCurrency)->image)}}"
                                    alt="...">{{optional($sellCurrencies->receiveCurrency)->name}}</h5>
                        </div>


                        <ul class="list-group">
                            <li class="list-group-item bg-transparent text-white d-flex justify-content-between align-items-center">@lang('Exchange Id')
                                <span>{{$sellCurrencies->exchange_id}}</span>
                            </li>
                            <li class="list-group-item bg-transparent text-white d-flex justify-content-between align-items-center">@lang('Send Amount')
                                <span>
                                    <span class="text-success"> {{number_format($sellCurrencies->send_amount, (optional($sellCurrencies->sendCurrency)->flag == 0)? 2 : 8)}}</span> {{optional($sellCurrencies->sendCurrency)->code}}
                                </span>
                            </li>

                            <li class="list-group-item bg-transparent text-white d-flex justify-content-between align-items-center">@lang('Receive Amount')
                                <span>
                                    <span class="text-success">{{number_format($sellCurrencies->receive_amount, (optional($sellCurrencies->receiveCurrency)->flag == 0)? 2 : 8) }}</span> {{optional($sellCurrencies->receiveCurrency)->code}}
                                </span>
                            </li>

                            <li class="list-group-item bg-transparent text-white d-flex justify-content-between align-items-center">@lang('Exchange Charge')
                                <span>
                                   <span class="text-danger">{{exchangeCharge($sellCurrencies)}} {{optional($sellCurrencies->receiveCurrency)->code}}</span>
                                </span>
                            </li>


                            <li class="list-group-item bg-transparent text-white d-flex justify-content-between align-items-center">@lang('Rate')
                                <span>
                                  1 {{optional($sellCurrencies->sendCurrency)->code}}
                                    = {{number_format($sellCurrencies->rate, (optional($sellCurrencies->receiveCurrency)->flag == 0)? 2 : 8)}} {{optional($sellCurrencies->receiveCurrency)->code}}
                                </span>
                            </li>



                            @if(isset($sellCurrencies->receiver_info) && !empty($sellCurrencies->receiver_info))
                                <li class="list-group-item bg-transparent text-white d-flex justify-content-between align-items-center">
                                <h5 class="my-2 text-base">@lang('Recipient Information')</h5>
                                </li>
                                @forelse($sellCurrencies->receiver_info as $k => $v)
                                    @if ($v->type == 'text')
                                        <li class="list-group-item bg-transparent text-white d-flex justify-content-between align-items-center">
                                            {{ trans($v->field_level) }}
                                            <span>{{$v->field_value}}</span>
                                        </li>

                                    @elseif($v->type == 'textarea')
                                        <li class="list-group-item bg-transparent text-white d-flex justify-content-between align-items-center">
                                            {{ trans($v->field_level) }}
                                            <span>{{$v->field_value}}</span>
                                        </li>

                                    @elseif($v->type == 'file')
                                        <li class="list-group-item bg-transparent text-white d-flex justify-content-between align-items-center">
                                            {{ trans($v->field_level) }}
                                            <span>{{$v->field_value}}</span>
                                        </li>
                                    @endif
                                @empty
                                @endforelse
                            @endif



                            @if(isset($sellCurrencies->sender_info) && !empty($sellCurrencies->sender_info))

                                <li class="list-group-item bg-transparent text-white d-flex justify-content-between align-items-center">
                                    <h5 class="my-2 text-base">@lang('Sender Information')</h5>
                                </li>

                                @forelse($sellCurrencies->sender_info as $k => $v)

                                    @if ($v->type == 'text')
                                        <li class="list-group-item bg-transparent text-white d-flex justify-content-between align-items-center">
                                            {{ trans($v->field_level) }}
                                            <span>{{$v->field_value}}</span>
                                        </li>
                                    @elseif($v->type == 'textarea')
                                        <li class="list-group-item bg-transparent text-white d-flex justify-content-between align-items-center">
                                            {{ trans($v->field_level) }}
                                            <span>{{$v->field_value}}</span>
                                        </li>
                                    @elseif($v->type == 'file')
                                        <li class="list-group-item bg-transparent text-white d-flex justify-content-between align-items-center">
                                            {{ trans($v->field_level) }}
                                            <span>{{$v->field_value}}</span>
                                        </li>
                                    @endif
                                @empty
                                @endforelse
                            @endif


                        </ul>




                        <button type="submit" class="btn-ico mt-3">@lang('Confirm Transaction')</button>
                    </form>
                </div>
            </div>
        </div>
    </section>

@endsection
