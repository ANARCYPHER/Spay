@extends($theme.'layouts.app')
@section('title')
    @lang('Exchange Rate')
@endsection
@section('content')
    <!-- latest exchanges -->
    <section class="latest-exchanges">
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="table-parent table-responsive">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th scope="col">@lang('SL No.')</th>
                                <th scope="col">@lang('Currency')</th>
                                <th scope="col">@lang('Sell Rate')</th>
                                <th scope="col">@lang('Buy Rate')</th>
                            </tr>
                            </thead>
                            <tbody>
                            @forelse($currencies as $key => $item)
                                <tr>
                                    <td data-label="@lang('SL No.')">{{++$key}}</td>
                                    <td data-label="@lang('Currency')">
                                         <span class="currency">
                                            <img src="{{getFile(config('location.currency.path').$item->image)}}"
                                                 alt="{{$item->name}}"/>
                                            @lang($item->name)
                                         </span>
                                    </td>
                                    @if($item->flag == 1)
                                        @php
                                            $rate=$item->sell_rate/config('basic.base_currency_rate')
                                        @endphp
                                        <td data-label="@lang('Sell Rate')">{{number_format($rate,config('basic.fraction_number'))}} {{config('basic.currency_symbol')}}</td>
                                    @else
                                        @php
                                            $rate = 1/$item->sell_rate
                                        @endphp
                                        <td data-label="@lang('Sell Rate')">{{number_format($rate,config('basic.fraction_number'))}} {{config('basic.currency_symbol')}}</td>
                                    @endif

                                    @if($item->flag == 1)
                                        @php
                                            $rate=$item->buy_rate/config('basic.base_currency_rate')
                                        @endphp
                                        <td data-label="@lang('Buy Rate')">{{number_format($rate,config('basic.fraction_number'))}} {{config('basic.currency_symbol')}}</td>
                                    @else
                                        @php
                                            $rate = 1/$item->buy_rate
                                        @endphp
                                        <td data-label="@lang('Buy Rate')">{{number_format($rate,config('basic.fraction_number'))}} {{config('basic.currency_symbol')}}</td>
                                    @endif
                                </tr>
                            @empty
                            @endforelse
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row mt-5">
                <div class="col">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-center">
                            {{ $currencies->appends($_GET)->links($theme.'partials.pagination') }}
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </section>
@endsection
