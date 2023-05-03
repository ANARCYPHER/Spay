@extends($theme.'layouts.app')
@section('title','403 Forbidden')


@section('content')
    <section class="blog-details">
        <div class="container">
            <div class="row gy-5 g-lg-5">
                <div class="col-lg-12 text-center">
                    <span class="display-1 d-block">{{trans('Forbidden')}}</span>
                    <div class="mb-4 lead">{{trans("You don't have permission to access ‘/’ on this server")}}</div>
                    <a class="btn-icon-custom" href="{{url('/')}}" >@lang('Back To Home')</a>
                </div>
            </div>
        </div>
    </section>
    <!-- /ERROR -->
@endsection
