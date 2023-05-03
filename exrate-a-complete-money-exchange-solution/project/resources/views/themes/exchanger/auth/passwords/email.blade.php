@extends($theme.'layouts.app')
@section('title')
    @lang('Reset Password')
@endsection
@section('content')
    <section class="login-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="text-center">
                        @if (session('status'))
                            <div class="alert alert-success alert-dismissible fade show w-100" role="alert">
                                {{ trans(session('status')) }}
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true"></span>
                                </button>
                            </div>
                        @endif
                    </div>
                    <form action="{{ route('password.email') }}" method="post">
                        @csrf
                        <div class="row g-4 mb-4">
                            <div class="col-12">
                                <h4>@lang('Reset Password')</h4>
                            </div>
                            <div class="input-box col-12">
                                <label for="">@lang('Reset Password')</label>
                                <input type="text" name="email" value="{{old('email')}}" class="form-control"
                                       placeholder=""/>
                                @error('email')<span class="text-danger  mt-1">{{ trans($message) }}</span>@enderror
                            </div>
                        </div>

                        <button type="submit" class="btn-ico">@lang('Send Password Reset Link')</button>
                        <div class="bottom">
                            @lang("Don't have an account?") <br/>
                            <a href="{{ route('register') }}">@lang("Sign Up")</a>
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
