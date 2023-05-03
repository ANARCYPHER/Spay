<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    @include('partials.seo')
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&family=Raleway:wght@400;500;600;700;800&display=swap">
    <link rel="stylesheet" type="text/css" href="{{ asset($themeTrue . 'css/bootstrap.min.css') }}"/>
    @stack('css-lib')
    <link rel="stylesheet" type="text/css" href="{{ asset($themeTrue . 'css/animate.css') }}"/>
    <link rel="stylesheet" type="text/css" href="{{ asset($themeTrue . 'css/owl.carousel.min.css') }}"/>
    <link rel="stylesheet" type="text/css" href="{{ asset($themeTrue . 'css/owl.theme.default.min.css') }}"/>
    <link rel="stylesheet" type="text/css" href="{{ asset($themeTrue . 'css/aos.css') }}"/>
    <link rel="stylesheet" type="text/css" href="{{ asset($themeTrue . 'css/jquery.fancybox.min.css') }}"/>
    <link rel="stylesheet" type="text/css" href="{{ asset($themeTrue . 'css/style.css') }}"/>

    @stack('style')
</head>

<body>
<!-- navbar -->
<nav class="navbar navbar-expand-lg fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="{{route('home')}}">
            <img src="{{getFile(config('location.logoIcon.path').'logo.png')}}" alt="homepage">
        </a>
        <button
            class="navbar-toggler p-0"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarNav"
            aria-controls="navbarNav"
            aria-expanded="false"
            aria-label="Toggle navigation">
            <i class="fal fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mx-lg-auto">
                <li class="nav-item">
                    <a class="nav-link {{menuActive('home')}}" href="{{route('home')}}">@lang('Home')</a>
                </li>

                @auth
                    <li class="nav-item">
                        <a class="nav-link {{menuActive('user.home')}}"
                           href="{{route('user.home')}}">@lang('Dashboard')</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link {{menuActive('user.exchange')}}"
                           href="{{route('user.exchange')}}">@lang('My Exchanges')</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link {{menuActive('user.testimonial')}}"
                           href="{{route('user.testimonial')}}">@lang('Testimonial')</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link {{menuActive('user.transaction')}}"
                           href="{{route('user.transaction')}}">@lang('Transaction')</a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link {{menuActive('user.payout*')}} dropdown-toggle"> @lang('Payout') </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li>
                                <a class="dropdown-item {{menuActive('user.payout.money')}}" href="{{route('user.payout.money')}}"> @lang('Payout Now')</a>
                            </li>
                            <li>
                                <a class="dropdown-item {{menuActive('user.payout.history')}}"
                                   href="{{route('user.payout.history')}}">@lang('Payout Log')</a>
                            </li>
                        </ul>
                    </li>



                    <li class="nav-item dropdown">
                        <a class="nav-link {{menuActive('user.referral*')}} dropdown-toggle"> @lang('Referral') </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li>
                                <a class="dropdown-item" href="{{route('user.referral')}}"> @lang('Referral Member')</a>
                            </li>
                            <li>
                                <a class="dropdown-item"
                                   href="{{route('user.referral.bonus')}}">@lang('Referral Bonus')</a>
                            </li>
                        </ul>
                    </li>
                @endauth
            </ul>
        </div>
        <span class="navbar-text">
            <!-- notification panel -->
               @include($theme.'partials.pushNotify')
        </span>
        <span class="navbar-text">
           <div class="notification-panel">
              <a href="javascript:void(0)" class="profile">
              <img src="{{asset($themeTrue).'/images/owner/creator.jpg'}}" class="img-fluid" alt="..."/>
           </a>
              <ul class="notification-dropdown-custom">
                 <div class="dropdown-box">
                       <li>
                       <a class="dropdown-item" href="{{route('user.home')}}">
                          <i class="fas fa-home"></i>
                          <div class="mt-2">
                             <p>@lang('Dashboard')</p>
                          </div>
                       </a>
                    </li>
                    <li>
                       <a class="dropdown-item" href="{{route('user.profile')}}">
                          <i class="fas fa-user-circle"></i>
                          <div class="mt-2">
                             <p>@lang('My Profile')</p>
                          </div>
                       </a>
                    </li>
                    <li>
                       <a class="dropdown-item" href="{{route('user.twostep.security')}}">
                          <i class="fas fa-key"></i>
                          <div class="mt-2">
                             <p> @lang('2FA Security')</p>
                          </div>
                       </a>
                    </li>
                    <li>
                       <a class="dropdown-item" href="{{route('user.ticket.list')}}">
                          <i class="fas fa-rocket"></i>
                          <div class="mt-2">
                             <p> @lang('Support Ticket')</p>
                          </div>
                       </a>
                    </li>
                    <li>
                       <a class="dropdown-item" href="{{ route('logout') }}"
                          onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                          <i class="fas fa-sign-out-alt"></i>
                          <div class="mt-2">
                             <p>@lang('Sign out')</p>
                          </div>
                       </a>
                        <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                                    @csrf
                        </form>
                    </li>
                 </div>
              </ul>
           </div>
        </span>
    </div>
</nav>

@include($theme . 'partials.banner')
@yield('content')

@include($theme . 'partials.footer')

@stack('loadModal')

<script src="{{ asset($themeTrue . 'js/bootstrap.bundle.min.js') }}"></script>
<script src="{{ asset($themeTrue . 'js/jquery-3.6.0.min.js') }}"></script>
@stack('extra-js')

<script src="{{ asset($themeTrue . 'js/fontawesomepro.js') }}"></script>
<script src="{{ asset($themeTrue . 'js/masonry.pkgd.min.js') }}"></script>
<script src="{{ asset($themeTrue . 'js/owl.carousel.min.js') }}"></script>
<script src="{{ asset($themeTrue . 'js/jquery.waypoints.min.js') }}"></script>
<script src="{{ asset($themeTrue . 'js/jquery.counterup.min.js') }}"></script>
<script src="{{ asset($themeTrue . 'js/aos.js') }}"></script>
<script src="{{ asset($themeTrue . 'js/jquery.fancybox.min.js') }}"></script>
<script src="{{ asset($themeTrue . 'js/script.js') }}"></script>


<script src="{{ asset('assets/global/js/notiflix-aio-2.7.0.min.js') }}"></script>
<script src="{{ asset('assets/global/js/pusher.min.js') }}"></script>
<script src="{{ asset('assets/global/js/vue.min.js') }}"></script>
<script src="{{ asset('assets/global/js/axios.min.js') }}"></script>

@include('plugins')

@if(config('basic.push_notification'))
    @auth
        <script>
            'use strict';
            let pushNotificationArea = new Vue({
                el: "#pushNotificationArea",
                data: {
                    items: [],
                },
                mounted() {
                    this.getNotifications();
                    this.pushNewItem();
                },
                methods: {
                    getNotifications() {
                        let app = this;
                        axios.get("{{ route('user.push.notification.show') }}")
                            .then(function (res) {
                                app.items = res.data;
                            })
                    },
                    readAt(id, link) {
                        let app = this;
                        let url = "{{ route('user.push.notification.readAt', 0) }}";
                        url = url.replace(/.$/, id);
                        axios.get(url)
                            .then(function (res) {
                                if (res.status) {
                                    app.getNotifications();
                                    if (link != '#') {
                                        window.location.href = link
                                    }
                                }
                            })
                    },
                    readAll() {
                        let app = this;
                        let url = "{{ route('user.push.notification.readAll') }}";
                        axios.get(url)
                            .then(function (res) {
                                if (res.status) {
                                    app.items = [];
                                }
                            })
                    },
                    pushNewItem() {
                        let app = this;
                        // Pusher.logToConsole = true;
                        let pusher = new Pusher("{{ env('PUSHER_APP_KEY') }}", {
                            encrypted: true,
                            cluster: "{{ env('PUSHER_APP_CLUSTER') }}"
                        });
                        let channel = pusher.subscribe('user-notification.' + "{{ Auth::id() }}");
                        channel.bind('App\\Events\\UserNotification', function (data) {
                            app.items.unshift(data.message);
                        });
                        channel.bind('App\\Events\\UpdateUserNotification', function (data) {
                            app.getNotifications();
                        });
                    }
                }
            });
        </script>
    @endauth
@endif
@stack('script')

@include($theme . 'partials.notification')

@stack('extra-js')


</body>
</html>
