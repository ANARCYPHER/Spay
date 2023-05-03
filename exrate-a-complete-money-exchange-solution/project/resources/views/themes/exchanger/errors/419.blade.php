@extends($theme.'layouts.app')
@section('title','419')


@section('content')
    <section class="blog-details">
        <div class="container">
            <div class="row gy-5 g-lg-5">
                <div class="col-lg-12 text-center">
                    <span class="display-1 d-block">@lang('419')</span>
                    <div class="mb-4 lead">@lang("Sorry, your session has expired")</div>
                    <a class="btn-icon-custom" href="{{url('/')}}" >@lang('Back To Home')</a>
                </div>
            </div>
        </div>
    </section>
@endsection
