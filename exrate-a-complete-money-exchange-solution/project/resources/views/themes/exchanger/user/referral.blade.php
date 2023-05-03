@extends($theme.'layouts.user')
@section('title',trans($title))
@section('content')

    <!-- My Referral -->
    <section class="latest-exchanges">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-md-12 ">
                    <div class="card custom--card">
                        <div class="card--header gradient-bg text-center p-3 py-sm-4 px-sm-4">
                            <h4 class="title text-start m-0">@lang('Referral link')</h4>
                        </div>
                        <div class="card-body">
                            <p>
                                @lang('Automatically top up your account balance by sharing your referral link, Earn a percentage of whatever plan your referred user buys.')</p>
                            <div>
                                <div class="form-group input-box">
                                    <div class="input-group mb-50">
                                        <input type="text"
                                               value="{{route('register.sponsor',[Auth::user()->username])}}"
                                               class="form-control" id="sponsorURL" readonly="">
                                        <div class="input-group-append">
                                            <span class="input-group-text form--control copytext" id="copyBoard"
                                                  onclick="copyFunction()">
                                                    <i class="fa fa-copy"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="col-md-12 mt-4">

                    @if(0 < count($referrals))
                        <div class="card custom--card mt-4">
                            <div class="card--header gradient-bg text-center p-3 py-sm-4 px-sm-4">
                                <h4 class="title text-start m-0">@lang('Referral Members')</h4>
                            </div>
                            <div class="card-body">
                                <div class="d-flex justify-content-start " id="ref-label">
                                    <div class="nav flex-column nav-pills mx-2" id="v-pills-tab" role="tablist"
                                         aria-orientation="vertical">
                                        @foreach($referrals as $key => $referral)
                                            <a class=" nav-link @if($key == '1')   active  @endif "
                                               id="v-pills-{{$key}}-tab" href="javascript:void(0)" data-bs-toggle="pill"
                                               data-bs-target="#v-pills-{{$key}}" role="tab"
                                               aria-controls="v-pills-{{$key}}"
                                               aria-selected="true">@lang('Level') {{$key}}</a>
                                        @endforeach
                                    </div>
                                    <div class="tab-content w-90" id="v-pills-tabContent">
                                        @foreach($referrals as $key => $referral)
                                            <div class="tab-pane fade @if($key == '1') show active  @endif "
                                                 id="v-pills-{{$key}}" role="tabpanel"
                                                 aria-labelledby="v-pills-{{$key}}-tab">
                                                @if( 0 < count($referral))
                                                    <div class="table-parent table-responsive">
                                                        <table class="table table-striped">
                                                            <thead>
                                                            <tr>
                                                                <th scope="col">@lang('Username')</th>
                                                                <th scope="col">@lang('Email')</th>
                                                                <th scope="col">@lang('Phone Number')</th>
                                                                <th scope="col">@lang('Joined At')</th>
                                                            </tr>
                                                            </thead>
                                                            <tbody>
                                                            @foreach($referral as $user)
                                                                <tr>

                                                                    <td data-label="@lang('Username')">
                                                                        @lang($user->username)
                                                                    </td>
                                                                    <td data-label="@lang('Email')"
                                                                        class="">{{$user->email}}</td>
                                                                    <td data-label="@lang('Phone Number')">
                                                                        {{$user->mobile}}
                                                                    </td>
                                                                    <td data-label="@lang('Joined At')">
                                                                        {{dateTime($user->created_at)}}
                                                                    </td>
                                                                </tr>
                                                            @endforeach
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                @endif
                                            </div>
                                        @endforeach

                                    </div>

                                </div>
                            </div>
                        </div>
                    @endif

                </div>
            </div>


        </div>
    </section>

@endsection

@push('script')

    <script>
        "use strict";

        function copyFunction() {
            var copyText = document.getElementById("sponsorURL");
            copyText.select();
            copyText.setSelectionRange(0, 99999);
            /*For mobile devices*/
            document.execCommand("copy");
            Notiflix.Notify.Success(`Copied: ${copyText.value}`);
        }
    </script>

@endpush
