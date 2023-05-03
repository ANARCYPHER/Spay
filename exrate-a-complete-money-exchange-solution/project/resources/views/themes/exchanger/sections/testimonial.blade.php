<!-- testimonial section -->
@if(isset($userTestimonial))
    <section class="testimonial-section">
        <div class="container">
            @if(isset($templates['testimonial'][0]) && $testimonial = $templates['testimonial'][0])
                <div class="row">
                    <div class="header-text mb-5 text-center">
                        <h5>@lang(optional($testimonial->description)->title)</h5>
                        <h2>@lang(optional($testimonial->description)->sub_title)</h2>
                        <p>
                            @lang(optional($testimonial->description)->short_description)
                        </p>
                    </div>
                </div>
            @endif
            <div class="row">
                <div class="col-12">
                    <div class="owl-carousel testimonials">
                        @forelse ($userTestimonial as $key => $item )
                            <div class="review-box">
                                <div class="rating">
                                    @if($item->rate)
                                        @for($i=0; $i<$item->rate; $i++)
                                            <i class="fas fa-star"></i>
                                        @endfor
                                    @endif
                                </div>
                                <p>
                                    {{$item->comments}}
                                </p>
                                <div class="d-flex align-items-end justify-content-between">
                                    <div>
                                        <h5>{{optional($item->user)->fullname}}</h5>
                                        <span class="title">@lang('Customer')</span>
                                    </div>
                                    <div>
                                        <img
                                            class="img-fluid"
                                            src="{{getFile(config('location.user.path').optional(@$item->user)->image) }}"
                                            alt="..."/>
                                    </div>
                                </div>
                            </div>
                        @empty
                        @endforelse
                    </div>
                </div>
            </div>
        </div>
    </section>
@endif

