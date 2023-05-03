@extends($theme.'layouts.app')
@section('title','405')


@section('content')
    <section class="blog-details">
        <div class="container">
            <div class="row gy-5 g-lg-5">
                <div class="col-lg-12 text-center">
                    <span class="display-1 d-block">{{trans('405')}}</span>
                    <div class="mb-4 lead">{{trans("Method Not Allowed")}}</div>
                    <a class="btn-icon-custom" href="{{url('/')}}" >@lang('Back To Home')</a>
                </div>
            </div>
        </div>
    </section>
@endsection
