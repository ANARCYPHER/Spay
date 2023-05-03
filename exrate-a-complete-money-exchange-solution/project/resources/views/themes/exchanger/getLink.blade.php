@extends($theme.'layouts.app')
@section('title')
    @lang($title)
@endsection

@section('content')

    <!-- blog details -->
    <section class="blog-details">
        <div class="container">
            <div class="row gy-5 g-lg-5">
                <div class="col-lg-12">
                    <div class="blog-box">

                        <div class="text-box">
                            <a href="javascript:void(0)" class="title cursor-text">
                                @lang(@$title)
                            </a>

                            <p>
                                @lang(@$description)
                            </p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>

@endsection
