@extends($theme.'layouts.app')
@section('title',trans('Blog Details'))

@section('content')

    <!-- blog details -->
    <section class="blog-details">
        <div class="container">
            <div class="row gy-5 g-lg-5">
                <div class="col-lg-8">
                    <div class="blog-box">
                        <div class="img-box">
                            <img
                                src="{{ $singleItem['image'] }}"
                                class="img-fluid"
                                alt="{{ $singleItem['title'] }}"
                            />
                        </div>
                        <div class="text-box">
                            <a href="javascript:void(0)" class="title cursor-text">
                                @lang($singleItem['title'])
                            </a>
                            <div class="date-author">
                               <span class="author">
                                  <i class="fa fa-user"></i>@lang('Admin')
                               </span>
                                <span class="float-end"> <i class="fa fa-calendar-alt"></i> @lang($singleItem['date'])</span>
                            </div>
                            <p>
                                @lang($singleItem['description'])
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4">


                    @if (isset($popularContentDetails['blog']))
                        @foreach ($popularContentDetails['blog']->sortDesc() as $data)
                            <div class="blog-box recent-post">
                                <div class="row">
                                    <div class="img-box mb-0 col-md-5">
                                        <img
                                            src="{{ getFile(config('location.content.path') . @$data->content->contentMedia->description->image) }}"
                                            class="img-fluid"
                                            alt=""
                                        />
                                    </div>
                                    <div class="text-box col-md-7 ps-md-0 mt-0">
                                        <a href="{{ route('blogDetails', [slug(optional($data->description)->title), $data->content_id]) }}" class="title">
                                            @lang($data->description->title)
                                        </a>
                                        <div class="date-author mb-0">
                                              <span class="author">
                                                 <i class="fas fa-user"></i>@lang('Admin')
                                              </span>
                                            <span class="float-end">{{dateTime($data->created_at,'d M,Y')}}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    @endif




                </div>

            </div>
        </div>
    </section>

@endsection
