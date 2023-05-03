@extends($theme.'layouts.app')
@section('title')
    @lang('Login')
@endsection
@section('content')
    <!-- login section -->
    <section class="login-section login">
        <div class="container">
            <div class="row">
                <div class="col">
                    <form action="{{ route('login') }}" method="post">
                        @csrf
                        <div class="row g-4">
                            <div class="col-12">
                                <h4>@lang('Login here')</h4>
                            </div>
                            <div class="input-box col-12">
                                <label for="">@lang('Email Or Username')</label>
                                <input type="text" name="username" class="form-control" placeholder=""/>
                                @error('username')<span class="text-danger  mt-1">{{ $message }}</span>@enderror
                                @error('email')<span class="text-danger  mt-1">{{ $message }}</span>@enderror
                            </div>
                            <div class="input-box col-12">
                                <label for="">@lang('Password')</label>
                                <input type="password" name="password" class="form-control" placeholder=""/>
                                @error('password')
                                <span class="text-danger mt-1">{{ $message }}</span>
                                @enderror
                            </div>
                            @if(basicControl()->reCaptcha_status_login)
                                <div class="box mb-4 form-group">
                                    {!! NoCaptcha::renderJs(session()->get('trans')) !!}
                                    {!! NoCaptcha::display(['data-theme' => 'dark']) !!}
                                    @error('g-recaptcha-response')
                                    <span class="text-danger mt-1">@lang($message)</span>
                                    @enderror
                                </div>
                            @endif
                            <div class="col-12">
                                <div class="links">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"
                                               name="remember" {{ old('remember') ? 'checked' : '' }}/>
                                        <label class="form-check-label" for="flexCheckDefault">
                                            @lang('Remember me')
                                        </label>
                                    </div>
                                    <a href="{{ route('password.request') }}">@lang('Forgot password?')</a>
                                </div>
                            </div>
                        </div>

                        <button type="submit" class="btn-ico">@lang('sign in')</button>
                        <div class="bottom">
                            @lang("Don't have an account?") <br/>
                            <a href="{{ route('register') }}">@lang('Create account')</a>
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
