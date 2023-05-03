<!-- about section -->
@if(isset($templates['about-us'][0]) && $about_us = $templates['about-us'][0])

    <div class="about-section">
        <div class="container">
            @if(!Request::routeIs('about'))
            <div class="row">
                <div class="header-text mb-5 text-center">
                    <h5>@lang(optional($about_us->description)->title)</h5>
                    <h2>@lang(optional($about_us->description)->sub_title)</h2>
                    <p>
                        @lang(optional($about_us->description)->short_description)
                    </p>
                </div>
            </div>
            @endif

            <div class="row gy-5 g-md-5 align-items-center">
                <div class="col-lg-6">
                    <div class="img-box">
                        <img src="{{getFile(config('location.content.path').@$about_us->templateMedia()->image)}}" alt="..." class="img-fluid"/>
                    </div>
                </div>
                <div class="col-lg-6">
                    @if(Request::routeIs('about'))
                    <div class="header-text mb-5 ">
                        <h5>@lang(optional($about_us->description)->title)</h5>
                        <h2>@lang(optional($about_us->description)->sub_title)</h2>
                    </div>
                    @endif
                    <p>
                        @lang(optional($about_us->description)->description)
                    </p>
                    <a href="{{$about_us->templateMedia()->button_link}}">
                        <button class="btn-ico mt-3">@lang(optional($about_us->description)->button_name)</button>
                    </a>
                </div>
            </div>
        </div>
    </div>
@endif
