
<!-- footer section -->
<footer class="footer-section" id="subscribe">
    <div class="container">
        <div class="row gy-5 g-md-5">
            <div class="col-lg-3 col-md-6">
                <div class="box box1">
                    <a>
                        <img class="img-fluid" src="{{ getFile(config('location.logoIcon.path') . 'logo.png') }}"
                             alt="..."/>
                    </a>

                    <p class="mt-3">
                        @if(isset($contactUs['contact-us'][0]) && $contact = $contactUs['contact-us'][0])
                            @lang(strip_tags(@$contact->description->footer_short_details))
                        @endif
                    </p>
                    @if(isset($contentDetails['social']))
                        <div class="social-links">
                            @foreach($contentDetails['social'] as $data)
                                <a class="social-icon facebook"
                                   href="{{@$data->content->contentMedia->description->link}}">
                                    <i class="{{@$data->content->contentMedia->description->icon}}"></i>
                                </a>
                            @endforeach
                        </div>
                    @endif
                </div>
            </div>
            <div class="col-lg-3 col-md-6 ps-lg-5">
                <div class="box">
                    <h5>@lang('useful links')</h5>
                    <ul class="links">
                        <li>
                            <a href="{{ route('home') }}">@lang('Home')</a>
                        </li>
                        <li>
                            <a href="{{ route('about') }}">@lang('About')</a>
                        </li>
                        <li>
                            <a href="{{ route('blog') }}">@lang('Blog')</a>
                        </li>
                        <li>
                            <a href="{{ route('contact') }}">@lang('Contact')</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                @isset($contentDetails['support'])
                    <div class="box">
                        <h5>@lang('Support')</h5>
                        <ul class="links">
                            <li>
                                <a href="{{ route('faq') }}">@lang('FAQ')</a>
                            </li>

                            @foreach($contentDetails['support'] as $data)
                                <li>
                                    <a href="{{route('getLink', [slug($data->description->title), $data->content_id])}}"><i
                                            class="icofont-thin-right"></i> @lang($data->description->title)</a>
                                </li>
                            @endforeach
                        </ul>
                    </div>
                @endisset
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="box">
                    <h5>@lang('subscribe newsletter')</h5>
                    <form action="{{ route('subscribe') }}" method="post">
                        @csrf
                        <div class="input-group">
                            <input
                                type="email"
                                name="email"
                                class="form-control"
                                placeholder="@lang('Enter email')"/>
                            <button type="submit"><i class="fal fa-paper-plane"></i></button>
                        </div>
                        @error('email')
                        <span class="text-danger">{{ $message }}</span>
                        @enderror
                    </form>
                </div>
            </div>
        </div>
        <div class="d-flex flex-wrap copyright justify-content-between text-start">
            <div>
                  <span>
                     @lang('Copyright') &copy; {{date('Y')}} @lang($basic->site_title) @lang('All Rights Reserved')
                  </span>
            </div>
            <div>
                @forelse($languages as $item)
                <a href="{{route('language',$item->short_name)}}" class="language">@lang($item->name)</a>
                @empty
                @endforelse
            </div>
        </div>
    </div>
</footer>

<script>
    "use strict";
    var root = document.querySelector(':root');
    root.style.setProperty('--neonGreen', '{{config('basic.base_color')}}');

</script>
