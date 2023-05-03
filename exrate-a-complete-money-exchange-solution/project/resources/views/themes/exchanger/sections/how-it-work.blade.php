<!-- how it works -->
@if(isset($contentDetails['how-it-work']))
    <section class="how-it-works">
        <div class="container">
            @if(isset($templates['how-it-work'][0]) && $how_it_work = $templates['how-it-work'][0])
                <div class="row">
                    <div class="header-text mb-5 text-center">
                        <h5>@lang(optional($how_it_work->description)->title)</h5>
                        <h2>@lang(optional($how_it_work->description)->sub_title)</h2>
                        <p>
                            @lang(optional($how_it_work->description)->short_description)
                        </p>
                    </div>
                </div>
            @endif
            <div class="row g-4">
                @forelse ( $contentDetails['how-it-work'] as $key => $item )
                    <div class="col-md-6 col-lg-4">
                        <div class="box">
                            <div class="icon">
                                <img
                                    class="img-fluid"
                                    src="{{ getFile(config('location.content.path') . optional($item->content)->contentMedia->description->image) }}"
                                    alt="..."
                                />
                            </div>
                            <div class="text">
                                <span>@lang('step 1')</span>
                                <h5> @lang(optional($item->description)->title)</h5>
                                <p>
                                    @lang(optional($item->description)->information)
                                </p>
                            </div>
                        </div>
                    </div>
                @empty
                @endforelse
            </div>
        </div>
    </section>
@endif
