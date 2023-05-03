<style>
    .banner {
        padding: 141px 0 100px 0;
        background-image: url({{asset($themeTrue).'/images/banner.png'}});
        background-position: center bottom;
    }
</style>

@if(!request()->routeIs('home'))
    <!-- PAGE HEADER -->
    <section class="banner">
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="header-text text-center">
                        <h2>@yield('title')</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endif




