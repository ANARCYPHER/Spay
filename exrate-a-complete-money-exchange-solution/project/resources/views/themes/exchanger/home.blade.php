@extends($theme.'layouts.app')
@section('title',trans('Home'))


@section('content')
    @include($theme . 'partials.calculation')

    <!-- how it works -->
    @include($theme . 'sections.how-it-work')

    <!-- about section -->
    @include($theme . 'sections.about-us')

    <!-- Latest Exchange section -->
    @include($theme . 'sections.latest-exchange')

    <!-- faq section -->
    @include($theme . 'sections.faq')

    <!-- testimonial section -->
    @include($theme . 'sections.testimonial')

    <!-- blog section -->
    @include($theme . 'sections.blog')

    <!-- arrow up -->
    <a href="#" class="scroll-up">
        <i class="fal fa-chevron-double-up"></i>
    </a>
@endsection
