@extends($theme.'layouts.user')
@section('title')
    @lang('Information')
@endsection
@section('content')
    <section class="login-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-4">
                    <div class="card ">
                        <div class="card-body">
                            <div class=" mb-4 currency-img">
                                <h5 class="currency"><img
                                        src="{{getFile(config('location.currency.path').optional($sellCurrencies->sendCurrency)->image)}}"
                                        alt="...">
                                    {{optional($sellCurrencies->sendCurrency)->name}} <span
                                        class="fa fa-exchange-alt mx-2"></span><img
                                        src="{{getFile(config('location.currency.path').optional($sellCurrencies->receiveCurrency)->image)}}"
                                        alt="...">{{optional($sellCurrencies->receiveCurrency)->name}}</h5>
                            </div>


                            <h6 class="text-white"> @lang('Send Amount')
                                <span class="text-success"> {{number_format($sellCurrencies->send_amount, (optional($sellCurrencies->sendCurrency)->flag == 0)? 2 : 8)}}</span> {{optional($sellCurrencies->sendCurrency)->code}}

                            </h6>
                            <h6 class="text-white">
                                @lang('Receive Amount')
                                <span class="text-success">{{number_format($sellCurrencies->receive_amount, (optional($sellCurrencies->receiveCurrency)->flag == 0)? 2 : 8) }}</span> {{optional($sellCurrencies->receiveCurrency)->code}}
                            </h6>


                            <div class="input-box">
                                <label class="form-label">@lang('Exchange Charge')
                                    : <span class="text-danger">{{exchangeCharge($sellCurrencies)}} {{optional($sellCurrencies->receiveCurrency)->code}}</span></label>
                            </div>
                            <div class="input-box">
                                <label class="form-label">@lang('Rate')
                                    : @lang('1') {{optional($sellCurrencies->sendCurrency)->code}}
                                    = {{number_format($sellCurrencies->rate, (optional($sellCurrencies->receiveCurrency)->flag == 0)? 2 : 8)}} {{optional($sellCurrencies->receiveCurrency)->code}}</label>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="col-md-7">
                    <form action="{{route('user.sellCurrency.step1Submit',$sellCurrencies->uuid)}}" method="post"
                          enctype="multipart/form-data" class="form-bg">
                        @csrf
                        <div class="row g-4">
                            <div class="col-12">
                                <h4 class="text-white">@lang('Recipient information')</h4>
                            </div>
                            @if(isset($sellCurrencies->receiveCurrency) && !empty(optional($sellCurrencies->receiveCurrency)->receiver_form))
                                @forelse(optional($sellCurrencies->receiveCurrency)->receiver_form as $k => $v)
                                    <div class="col-md-12">
                                        @if ($v->type == 'text')
                                            <div class="input-box">
                                                <label
                                                    for="exampleFormControlInput1"
                                                    class="form-label">{{ trans($v->field_level) }}
                                                    @if ($v->validation == 'required')
                                                        <span class="text-danger">*</span>
                                                    @endif
                                                </label>
                                                <input name="{{ $k }}" type="text" class="form-control"
                                                       value="{{old($k)}}"
                                                       placeholder="{{ trans($v->field_level) }}"
                                                @if ($v->validation == 'required')  @endif />

                                                @error($k)
                                                <span
                                                    class="text-danger">{{ $message  }}</span>
                                                @enderror
                                            </div>
                                        @elseif($v->type == 'textarea')
                                            <div class="input-box form-group">
                                                <label
                                                    for="exampleFormControlInput1"
                                                    class="form-label">{{ trans($v->field_level) }}

                                                    @if ($v->validation == 'required')
                                                        <span class="text-danger">*</span>
                                                    @endif
                                                </label>

                                                <textarea name="{{ $k }}" class="form-control"
                                                                    @if ($v->validation == 'required')  @endif>{{old($k)}}</textarea>
                                                @if ($errors->has($k))
                                                    <span
                                                        class="text-danger">{{ trans($errors->first($k)) }}</span>
                                                @endif
                                            </div>
                                        @elseif($v->type == 'file')
                                            <div class="input-box form-group">
                                                <label
                                                    for="exampleFormControlInput1"
                                                    class="form-label">{{ trans($v->field_level) }}

                                                    @if ($v->validation == 'required')
                                                        <span class="text-danger">*</span>
                                                    @endif
                                                </label>

                                                <input name="{{ $k }}" type="file" class="form-control"
                                                       placeholder="{{ trans($v->field_level) }}"
                                                @if ($v->validation == 'required')   @endif />

                                                @if ($errors->has($k))
                                                    <span
                                                        class="text-danger">{{ trans($errors->first($k)) }}</span>
                                                @endif
                                            </div>
                                        @endif
                                    </div>
                                @empty
                                @endforelse
                            @endif
                            <button type="submit" class="btn-ico">@lang('Process Exchange')</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
@endsection
@push('style')
    <style>
        @media (max-width: 480px) {
            .login-section form {
                padding: 20px;
                max-width: 100%;
            }
        }
    </style>
@endpush
