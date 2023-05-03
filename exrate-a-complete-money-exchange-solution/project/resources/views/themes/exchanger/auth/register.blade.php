@extends($theme.'layouts.app')
@section('title')
    @lang('Create An Account')
@endsection
@section('content')
    <!-- login section -->
    <section class="login-section">
        <div class="container">
            <div class="row">
                <div class="col">
                    <form action="{{ route('register') }}" method="post">
                        @csrf
                        <div class="row g-4">
                            <div class="col-12">
                                <h4>@lang('Sign up here')</h4>
                            </div>
                            @if(session()->get('sponsor') != null)
                                <div class="col-md-12">
                                    <div class="input-box mb-30">
                                        <label>@lang('Sponsor Name')</label>
                                        <input type="text" name="sponsor" class="form-control" id="sponsor"
                                               placeholder="{{trans('Sponsor By') }}"
                                               value="{{session()->get('sponsor')}}" readonly>
                                    </div>
                                </div>
                            @endif
                            <div class="row mt-4">
                                <div class="input-box col-sm-12 col-md-6">
                                    <label for="">@lang('First Name')</label>
                                    <input type="text" name="firstname"
                                           value="{{old('firstname')}}" class="form-control" placeholder=""/>
                                    @error('firstname')<span class="text-danger  mt-1">{{ $message }}</span>@enderror
                                </div>
                                <div class="input-box col-sm-12 col-md-6">
                                    <label for="">@lang('Last Name')</label>
                                    <input type="text" name="lastname"
                                           value="{{old('lastname')}}" class="form-control" placeholder=""/>
                                    @error('lastname')<span class="text-danger  mt-1">{{ $message }}</span>@enderror
                                </div>
                            </div>
                            <div class="row mt-4">
                                <div class="input-box col-sm-12 col-md-6">
                                    <label for="">@lang('Username')</label>
                                    <input type="text" name="username"
                                           value="{{old('username')}}" class="form-control" placeholder=""/>
                                    @error('username')<span class="text-danger  mt-1">{{ $message }}</span>@enderror
                                </div>
                                <div class="input-box col-sm-12 col-md-6">
                                    <label for="">@lang('Email Address')</label>
                                    <input type="email" name="email"
                                           value="{{old('email')}}" class="form-control" placeholder=""/>
                                    @error('email')<span class="text-danger  mt-1">{{ $message }}</span>@enderror
                                </div>
                            </div>
                            <div class="row mt-4">
                                <div class="input-box col-12">
                                    <label for="">@lang('Phone Number')</label>
                                    @php
                                        $country_code = (string) @getIpInfo()['code'] ?: null;
                                        $myCollection = collect(config('country'))->map(function($row) {
                                            return collect($row);
                                        });
                                        $countries = $myCollection->sortBy('code');
                                    @endphp
                                    <div class="input-group mb-3">
                                        <select class="form-select country_code dialCode-change" name="phone_code"
                                                id="basic-addon1">
                                            <option selected="" disabled>@lang('Select Code')</option>
                                            @foreach(config('country') as $value)
                                                <option value="{{$value['phone_code']}}"
                                                        data-name="{{$value['name']}}"
                                                        data-code="{{$value['code']}}"
                                                    {{$country_code == $value['code'] ? 'selected' : ''}}> {{$value['name']}}
                                                    ({{$value['phone_code']}})
                                                </option>
                                            @endforeach
                                        </select>
                                        <input type="text" name="phone" value="{{old('phone')}}"
                                               class="form-control dialcode-set"
                                               placeholder=""/>
                                    </div>
                                    @error('phone')
                                    <span class="text-danger mt-1">{{ $message }}</span>
                                    @enderror
                                </div>
                                <input type="hidden" name="country_code" value="{{old('country_code')}}"
                                       class="text-dark">
                            </div>
                            <div class="row mt-4 @if(basicControl()->reCaptcha_status_registration) @else mb-5 @endif">
                                <div class="input-box col-sm-12 col-md-6">
                                    <label for="">@lang('Password')</label>
                                    <input type="password" name="password" class="form-control" placeholder=""/>
                                    @error('password')
                                    <span class="text-danger mt-1">{{ $message }}</span>
                                    @enderror
                                </div>
                                <div class="input-box col-sm-12 col-md-6">
                                    <label for="">@lang('Confirm Password')</label>
                                    <input type="password" name="password_confirmation" class="form-control"
                                           placeholder=""/>
                                </div>
                            </div>
                            @if(basicControl()->reCaptcha_status_registration)
                                <div class="col-md-6 box mb-5 form-group">
                                    {!! NoCaptcha::renderJs(session()->get('trans')) !!}
                                    {!! NoCaptcha::display(['data-theme' => 'dark']) !!}
                                    @error('g-recaptcha-response')
                                    <span class="text-danger mt-1">@lang($message)</span>
                                    @enderror
                                </div>
                            @endif
                        </div>

                        <button type="submit" class="btn-ico">@lang('sign Up')</button>
                        <div class="bottom">
                            @lang('Already have an account?') <br/>

                            <a href="{{ route('login') }}">@lang('Sign In')</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
@endsection
@push('script')
    <script>
        "use strict";
        $(document).ready(function () {
            setDialCode();
            $(document).on('change', '.dialCode-change', function () {
                setDialCode();
            });

            function setDialCode() {
                let currency = $('.dialCode-change').val();
                $('.dialcode-set').val(currency);
            }

        });
    </script>
@endpush
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
