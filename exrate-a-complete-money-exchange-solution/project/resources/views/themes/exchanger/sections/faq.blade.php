<!-- faq section -->
@if(isset($contentDetails['faq']))
    <div class="faq-section">
        <div class="container">
            @if(!Request::routeIs('faq'))
                @if(isset($templates['faq'][0]) && $faq = $templates['faq'][0])
                    <div class="row">
                        <div class="header-text mb-5 text-center">
                            <h5>@lang(optional($faq->description)->title)</h5>
                            <h2>@lang(optional($faq->description)->sub_title)</h2>
                            <p>
                                @lang(optional($faq->description)->short_description)
                            </p>
                        </div>
                    </div>
                @endif
            @endif

            <div class="row gy-5 g-md-5 ">
                @if(isset($templates['faq'][0]) && $faq = $templates['faq'][0])
                    <div class="col-lg-5">
                        <div class="img-box">
                            <img src="{{getFile(config('location.content.path').@$faq->templateMedia()->image)}}"
                                 alt="..."
                                 class="img-fluid"/>
                        </div>
                    </div>
                @endif
                <div class="col-lg-7">
                    @if(Request::routeIs('faq'))
                        @if(isset($templates['faq'][0]) && $faq = $templates['faq'][0])
                            <div class="header-text mb-5">
                                <h2 class="text-center">@lang(optional($faq->description)->sub_title)</h2>
                                <p class="text-start">
                                    @lang(optional($faq->description)->short_description)
                                </p>
                            </div>
                        @endif
                    @endif


                    <div class="accordion" id="accordionExample">
                        @forelse ( $contentDetails['faq'] as $key => $item )
                            <div class="accordion-item">
                                <h5 class="accordion-header" id="heading{{$key}}">
                                    <button
                                        class="accordion-button"
                                        type="button"
                                        data-bs-toggle="collapse"
                                        data-bs-target="#collapse{{$key}}"
                                        aria-expanded="true"
                                        aria-controls="collapse{{$key}}">
                                        @lang(@$item->description->title)
                                    </button>
                                </h5>
                                <div
                                    id="collapse{{$key}}"
                                    class="accordion-collapse collapse @if ($key==0)
                                        show"
                                    @endif
                                    aria-labelledby="heading{{$key}}"
                                    data-bs-parent="#accordionExample">
                                    <div class="accordion-body">
                                        @lang(optional($item->description)->description)
                                    </div>
                                </div>
                            </div>
                        @empty
                        @endforelse

                    </div>
                </div>
            </div>
        </div>
    </div>
@endif
