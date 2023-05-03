@extends($theme.'layouts.user')
@section('title')
    @lang('Information')
@endsection
@section('content')
    <section class="login-section senderInfo">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-7">
                    <div class="card ">
                        <div class="card-body">
                            <h4 class="text-center mb-3">@lang('Please Follow the instruction below')</h4>
                            <h6 class="text-white text-center mb-3"> @lang('Send Amount')
                                <span class="text-success"> {{number_format($sellCurrencies->send_amount, (optional($sellCurrencies->sendCurrency)->flag == 0)? 2 : 8)}}</span> {{optional($sellCurrencies->sendCurrency)->code}}

                                @lang('Receive Amount')
                                <span class="text-success">{{number_format($sellCurrencies->receive_amount, (optional($sellCurrencies->receiveCurrency)->flag == 0)? 2 : 8) }}</span> {{optional($sellCurrencies->receiveCurrency)->code}}
                            </h6>

                            @if(optional($sellCurrencies->sendCurrency)->note)
                                <div class="bd-callout bd-callout-warning mx-2">
                                    @lang(optional($sellCurrencies->sendCurrency)->note)
                                </div>
                            @endif
                        </div>
                    </div>

                    <form action="{{route('user.sellCurrency.step2Submit',$sellCurrencies->uuid)}}" method="post"
                          enctype="multipart/form-data" class="form-bg  border-0">
                        @csrf
                        <div class="row g-4">
                            <div class="col-12">
                                <h4 class="text-white">@lang('Sender Information')</h4>
                            </div>
                            @if(isset($sellCurrencies->sendCurrency) && !empty(optional($sellCurrencies->sendCurrency)->form_field))
                                @forelse(optional($sellCurrencies->sendCurrency)->form_field as $k => $v)
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
                                                    <span class="text-danger">{{ trans($errors->first($k)) }}</span>
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
                                                    <span class="text-danger">{{ trans($errors->first($k)) }}</span>
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
