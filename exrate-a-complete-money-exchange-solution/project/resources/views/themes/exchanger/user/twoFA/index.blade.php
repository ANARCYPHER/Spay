@extends($theme.'layouts.user')
@section('title',__('2FA Security'))

@section('content')
    <section class="login-section">
        <div class="container pb-50">
            <div class="row feature-wrapper top-0">
                @if(auth()->user()->two_fa)
                    <div class="col-lg-6 col-md-6 mb-3">
                        <div class="card custom-card">
                            <div class="card--header gradient-bg text-center p-3 py-sm-4 px-sm-4">
                                <h5 class="title text-start m-0">@lang('Two Factor Authenticator')</h5>
                            </div>
                            <div class="card-body">
                                <div class="form-group mb-3 form-block">
                                    <div class="input-group">
                                        <input type="text" value="{{$previousCode}}"
                                               class="form-control" id="referralURL"
                                               readonly>
                                        <div class="input-group-append">
                                            <span class="input-group-text copytext" id="copyBoard"
                                                  onclick="copyFunction()">
                                                <i class="fa fa-copy"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group mx-auto text-center">
                                    <img class="mx-auto" src="{{$previousQR}}">
                                </div>

                                <div class="form-group mx-auto text-center">
                                    <a href="javascript:void(0)" class="btn btn-block btn-md btn-danger mt-3"
                                       data-bs-toggle="modal" data-bs-target="#disableModal">@lang('Disable Two Factor Authenticator')</a>
                                </div>
                            </div>
                        </div>
                    </div>
                @else
                    <div class="col-lg-6 col-md-6 mb-3">
                        <div class="card custom-card">
                            <div class="card--header gradient-bg text-center p-3 py-sm-4 px-sm-4">
                                <h5 class="title text-start m-0">@lang('Two Factor Authenticator')</h5>
                            </div>
                            <div class="card-body">
                                <div class="form-group mb-3">
                                    <div class="input-group input-box">
                                        <input type="text" value="{{$secret}}"
                                               class="form-control" id="referralURL"
                                               readonly>
                                        <div class="input-group-append">
                                                <span class="input-group-text copytext" id="copyBoard"
                                                      onclick="copyFunction()">
                                                    <i class="fa fa-copy"></i>
                                                </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group mx-auto text-center">
                                    <img class="mx-auto" src="{{$qrCodeUrl}}">
                                </div>

                                <div class="form-group mx-auto text-center ">
                                    <a href="javascript:void(0)" class="btn btn-block btn-md btn-custom-success mt-3"
                                       data-bs-toggle="modal"
                                       data-bs-target="#enableModal">@lang('Enable Two Factor Authenticator')</a>
                                </div>
                            </div>

                        </div>
                    </div>
                @endif

                <div class="col-lg-6 col-md-6 mb-3">
                    <div class="card  custom-card">
                        <div class="card--header gradient-bg text-center p-3 py-sm-4 px-sm-4">
                            <h5 class="title text-start m-0">@lang('Google Authenticator')</h5>
                        </div>
                        <div class="card-body">
                            <h6 class="text-uppercase my-3">@lang('Use Google Authenticator to Scan the QR code  or use the code')</h6>
                            <p>@lang('Google Authenticator is a multifactor app for mobile devices. It generates timed codes used during the 2-step verification process. To use Google Authenticator, install the Google Authenticator application on your mobile device.')</p>
                            <a class="btn btn-custom-success btn-sm mt-2"
                               href="https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2&hl=en"
                               target="_blank">@lang('DOWNLOAD APP')</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>





    <!--Enable Modal -->
    <div id="enableModal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-dialog-centered">

            <!-- Modal content-->
            <div class="modal-content form-block">
                <div class="modal-header-custom bg-custom">
                    <h5 class="modal-title">@lang('Verify Your OTP')</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <form action="{{route('user.twoStepEnable')}}" method="POST">
                    @csrf
                    <div class="modal-body">

                        <div class="form-group  input-box">
                            <input type="hidden" name="key" value="{{$secret}}">
                            <input type="text" class="form-control bg-transparent" name="code" placeholder="@lang('Enter Google Authenticator Code')">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">@lang('Close')</button>
                        <button type="submit" class="btn btn-custom-success">@lang('Verify')</button>
                    </div>

                </form>
            </div>
        </div>
    </div>

    <!--Disable Modal -->
    <div id="disableModal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-dialog-centered">
            <!-- Modal content-->
            <div class="modal-content form-block">
                <div class="modal-header-custom bg-custom">
                    <h5 class="modal-title">@lang('Verify Your OTP to Disable')</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <form action="{{route('user.twoStepDisable')}}" method="POST">
                    @csrf
                    <div class="modal-body">
                        <div class="form-group input-box">
                            <input type="text" class="form-control bg-transparent" name="code" placeholder="@lang('Enter Google Authenticator Code')">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">@lang('Close')</button>
                        <button type="submit" class="btn btn-custom-success">@lang('Verify')</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
@endsection
@push('script')
    <script>
        function copyFunction() {
            var copyText = document.getElementById("referralURL");
            copyText.select();
            copyText.setSelectionRange(0, 99999);
            /*For mobile devices*/
            document.execCommand("copy");
            Notiflix.Notify.Success(`Copied: ${copyText.value}`);
        }
    </script>
@endpush

