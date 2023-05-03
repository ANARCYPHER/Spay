@extends($theme.'layouts.app')
@section('title')
    @lang('Reset Password')
@endsection
@section('content')
    <section class="login-section">
        <div class="container">
            <div class="row">
                <div class="col">
                    @if (session('status'))
                        <div class="alert alert-success alert-dismissible fade show w-100" role="alert">
                            {{ trans(session('status')) }}
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                    @endif
                    <form action="{{route('password.update')}}"   method="post">
                        @csrf
                        @error('token')
                        <div class="alert alert-danger alert-dismissible fade show w-100" role="alert">
                            {{ trans($message) }}
                            <button type="button" class="close" data-bs-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        @enderror

                        <div class="row g-4">
                            <div class="col-12">
                                <h4>@lang('Reset Password')</h4>
                            </div>
                            <input type="hidden" name="token" value="{{ $token }}">
                            <input type="hidden" name="email" value="{{ $email }}">

                            <div class="input-box col-12">
                                <label for="">@lang('New Password')</label>
                                <input type="password" name="password" class="form-control" placeholder=""/>
                                @error('password')
                                <span class="text-danger mt-1">{{ $message }}</span>
                                @enderror
                            </div>
                            <div class="input-box col-12">
                                <label for="">@lang('Confirm Password')</label>
                                <input type="password" name="password_confirmation" class="form-control" placeholder=""/>
                                @error('password')
                                <span class="text-danger mt-1">{{ $message }}</span>
                                @enderror
                            </div>
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

                        <button type="submit" class="btn-ico">@lang('Send Password Reset Link')</button>
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
