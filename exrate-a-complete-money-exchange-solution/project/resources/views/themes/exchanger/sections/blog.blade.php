<!-- blog section -->
@if(isset($contentDetails['blog']))
    <div class="blog-section">
        <div class="container">
            <div class="row">
                @if(isset($templates['blog'][0]) && $blog = $templates['blog'][0])
                    <div class="col">
                        <div class="header-text mb-5 text-center">
                            <h5>@lang(optional($blog->description)->title)</h5>
                            <h2>@lang(optional($blog->description)->sub_title)</h2>
                            <p>
                                @lang(optional($blog->description)->short_description)
                            </p>
                        </div>
                    </div>
                @endif
            </div>
            <div class="row g-4">
                @forelse ( $contentDetails['blog']->take(3) as $key => $item )
                    <div class="col-lg-4 col-md-6 mx-auto">
                        <div class="box">
                            <div class="img-box">
                                <img
                                    src="{{ getFile(config('location.content.path') . optional($item->content)->contentMedia->description->image) }}"
                                    class="img-fluid"
                                    alt="..."
                                />
                            </div>
                            <div class="text-box">
                                <a href="{{ route('blogDetails', [slug(optional($item->description)->title), $item->content_id]) }}"
                                   class="title">
                                    @lang(optional($item->description)->title)
                                </a>
                                <div class="date-author">
                           <span class="author">
                              <i class="fas fa-dot-circle"></i>@lang('Admin')
                           </span>
                                    <span class="float-end">@lang(dateTime($item->created_at))</span>
                                </div>
                            </div>
                        </div>
                    </div>
                @empty
                @endforelse
            </div>
        </div>
    </div>
@endif
