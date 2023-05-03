@extends($theme.'layouts.app')
@section('title',$page_title)

@section('content')
    <section class="login-section">
        <div class="container">
            <div class="row">
                <div class="col">
                    <form action="{{route('user.smsVerify')}}" method="post">
                        @csrf
                        <div class="row g-4 mb-4">
                            <div class="col-12">
                                <h4>@lang('Sms Verification')</h4>
                            </div>
                            <div class="input-box col-12">
                                <label for="">@lang('Sms Verification Code')</label>
                                <input type="text"  name="code" value="{{old('code')}}" class="form-control" placeholder=""/>
                                @error('code')<span class="text-danger  mt-1">{{ $message }}</span>@enderror
                                @error('error')<span class="text-danger  mt-1">{{ $message }}</span>@enderror
                            </div>
                        </div>

                        <button type="submit" class="btn-ico">@lang('Submit')</button>
                        <div class="bottom">
                            @lang("Didn't get Code? Click to") <br />
                            <a href="{{route('user.resendCode')}}?type=mobile">@lang('Resend Code')</a>
                            @error('resend')
                            <p class="text-danger  mt-1">{{ $message }}</p>
                            @enderror
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
