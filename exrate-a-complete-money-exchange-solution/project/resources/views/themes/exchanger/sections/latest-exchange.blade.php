@if(0 <count($exchange))
<!-- latest exchanges -->
<section class="latest-exchanges">
    <div class="container">
        <div class="row">
            @if(isset($templates['latest-exchange'][0]) && $latest_exchange = $templates['latest-exchange'][0])
                <div class="col">
                    <div class="header-text mb-5 text-center">
                        <h2>@lang(optional($latest_exchange->description)->title)</h2>
                    </div>
                </div>
            @endif
        </div>
        <div class="row">
            <div class="col-12">
                <div class="table-parent table-responsive">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th scope="col">@lang('SL No.')</th>
                            <th scope="col">@lang('Send')</th>
                            <th scope="col">@lang('Receive')</th>
                            <th scope="col">@lang('Amount')</th>
                            <th scope="col">@lang('Exchange ID')</th>
                            <th scope="col">@lang('Status')</th>
                        </tr>
                        </thead>
                        <tbody>
                        @forelse($exchange as $key=> $item)
                            <tr>
                                <td data-label="@lang('SL No.')">{{++$key}} </td>
                                <td data-label="@lang('Send')">
                                 <span class="currency">
                                    <img
                                        src="{{getFile(config('location.currency.path').optional($item->sendCurrency)->image)}}"
                                        alt="..."/>
                                   @lang(optional($item->sendCurrency)->name)
                                 </span>
                                </td>
                                <td data-label="@lang('Receive')">
                                 <span class="currency">
                                    <img
                                        src="{{getFile(config('location.currency.path').optional($item->receiveCurrency)->image)}}"
                                        alt="..."/>
                                    @lang(optional($item->receiveCurrency)->name)
                                 </span>
                                </td>
                                <td data-label="@lang('Amount')">{{getAmount($item->send_amount)}} {{optional($item->sendCurrency)->code}}</td>
                                <td data-label="@lang('Exchange ID')">{!!  secretTrx($item->exchange_id)!!}</td>
                                <td data-label="@lang('Status')">
                                    @if($item->status == 0)
                                        <span class="badge bg-warning">@lang('Pending')</span>
                                    @elseif($item->status == 1)
                                        <span class="badge bg-success">@lang('Processed')</span>
                                    @elseif($item->status == 2)
                                        <span class="badge bg-danger">@lang('Timeout')</span>
                                    @endif
                                </td>
                            </tr>
                        @empty
                        @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>
    @endif

