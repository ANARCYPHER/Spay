@extends($theme.'layouts.app')
@section('title', trans($title))

@section('content')
    <!-- blog -->
    @if(isset($contentDetails['blog']))
        <div class="blog-section">
            <div class="container">
                <div class="row g-4">

                    @forelse($contentDetails['blog'] as $key => $item )
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
                                        <span class="float-end">{{dateTime($item->created_at,'d M, Y')}}</span>
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
@endsection
