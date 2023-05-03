@extends($theme.'layouts.user')
@section('title',trans('Dashboard'))
@section('content')
    <div class="dashboard-section my-5">
        <div class="container">
            <div class="row justify-content-center g-4">
                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-10">
                    <div class="dashboard__card dashboard__card-BTC">
                        <div class="dashboard__card-content">
                            <h2 class="price"><sup>{{config('basic.currency_symbol')}}</sup>{{Auth()->user()->balance}}
                            </h2>
                            <p class="info">@lang('Balance')</p>
                        </div>
                        <div class="dashboard__card-icon">
                            <img src="{{asset($themeTrue.'images/crypto/wallet.png')}}" alt="...">
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-10">
                    <div class="dashboard__card dashboard__card-LTC">
                        <div class="dashboard__card-content">
                            <h2 class="price">{{$currencySell['complete']}}</h2>
                            <p class="info">@lang('Complete Exchange')</p>
                        </div>
                        <div class="dashboard__card-icon dashboard__card-icon-LTC">
                            <img src="{{asset($themeTrue.'images/crypto/checked.png')}}" alt="...">
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-10">
                    <div class="dashboard__card dashboard__card-XMR">
                        <div class="dashboard__card-content">
                            <h2 class="price">{{$currencySell['pending']}}</h2>
                            <p class="info">@lang('Pending Exchange')</p>
                        </div>
                        <div class="dashboard__card-icon dashboard__card-icon-XMR">
                            <img src="{{asset($themeTrue.'images/crypto/circular-clock.png')}}" alt="...">
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-10">
                    <div class="dashboard__card dashboard__card-CT">
                        <div class="dashboard__card-content">
                            <h2 class="price">{{$currencySell['cancel']}}</h2>
                            <p class="info">@lang('Cancel Exchange')</p>
                        </div>
                        <div class="dashboard__card-icon dashboard__card-icon-ETH">
                            <img src="{{asset($themeTrue.'images/crypto/cancelled.png')}}" alt="...">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row login-section">
                <div class="col-xl-7">
                    <div class="card custom--card">
                        <div class="card--header gradient-bg text-center p-3 py-sm-4 px-sm-4">
                            <h4 class="title text-start m-0">@lang('Referral Joined')</h4>
                        </div>
                        <div class="card-body">
                            <div id="container" class="apexcharts-canvas"></div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-5">
                    <div class="card custom--card">
                        <div class="card--header gradient-bg text-center p-3 py-sm-4 px-sm-4">
                            <h4 class="title text-start m-0">@lang('Referral link')</h4>
                        </div>
                        <div class="card-body p-0">
                            <div class="deposit-preview-body p-4">
                                <p>
                                    @lang('Automatically top up your account balance by sharing your referral link, Earn a percentage of whatever plan your referred user buys.')</p>
                                <div>
                                    <div class="form-group">
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
                </div>
            </div>
        </div>
    </div>
@endsection

@push('script')
    <script src="{{asset($themeTrue.'js/apexcharts.js')}}"></script>
    <script>

        var options = {
            theme: {
                mode: 'dark',
            },
            series: [
                {
                    name: "{{trans('Referral Member')}}",
                    color: '{{config('basic.base_color')}}',
                    data: {!! $monthly['affiliate']->flatten() !!}
                },

            ],
            chart: {
                type: 'bar',
                // height: ini,
                background: '#191b2a',
                toolbar: {
                    show: false
                }

            },
            plotOptions: {
                bar: {
                    horizontal: false,
                    columnWidth: '55%',
                    endingShape: 'rounded'
                },
            },
            dataLabels: {
                enabled: false
            },
            stroke: {
                show: true,
                width: 2,
                colors: ['transparent']
            },
            xaxis: {
                categories: {!! $monthly['affiliate']->keys() !!},

            },
            yaxis: {
                title: {
                    text: ""
                }
            },
            fill: {
                opacity: 1
            },
            tooltip: {
                colors: ['#000'],
                y: {
                    formatter: function (val) {
                        return val + " Person"
                    }
                }
            }
        };
        var chart = new ApexCharts(document.querySelector("#container"), options);
        chart.render();

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
