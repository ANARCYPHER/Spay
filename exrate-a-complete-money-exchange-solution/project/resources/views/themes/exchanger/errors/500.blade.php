@extends($theme.'layouts.app')
@section('title','500')


@section('content')
    <section class="blog-details">
        <div class="container">
            <div class="row gy-5 g-lg-5">
                <div class="col-lg-12 text-center">
                    <span class="display-1 d-block">@lang('Internal Server Error')</span>
                    <div class="mb-4 lead">@lang("The server encountered an internal error misconfiguration and was unable to complate your request. Please contact the server administrator.")</div>
                    <a class="btn-icon-custom" href="{{url('/')}}" >@lang('Back To Home')</a>
                </div>
            </div>
        </div>
    </section>
@endsection
