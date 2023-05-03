@extends($theme.'layouts.user')
@section('title',trans('My Exchanges'))

@section('content')
    <section class="latest-exchanges">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="card custom--card">
                        <div class="card-body">
                            <div class="table-parent table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th scope="col" >@lang('Exchange ID')</th>
                                        <th scope="col">@lang('Exchange')</th>
                                        <th scope="col">@lang('Send')</th>
                                        <th scope="col">@lang('Receive')</th>
                                        <th scope="col">@lang('Rate')</th>
                                        <th scope="col">@lang('Status')</th>
                                        <th scope="col">@lang('Time')</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @forelse($currencySells as $key => $item)
                                        <tr>
                                            <td data-label="@lang('Exchange ID')">{{$item->exchange_id}}</td>
                                            <td data-label="@lang('Exchange')">
                                     <span class="currency">
                                        <img
                                            src="{{getFile(config('location.currency.path').optional($item->sendCurrency)->image)}}"
                                            alt="..."/>
                                        @lang(optional($item->sendCurrency)->name) <i
                                             class="fad fa-exchange-alt me-2 ms-2"></i>
                                         <img
                                             src="{{getFile(config('location.currency.path').optional($item->receiveCurrency)->image)}}"
                                             alt="..."/>
                                          @lang(optional($item->receiveCurrency)->name)
                                     </span>
                                            </td>
                                            <td data-label="@lang('Send')">
                                                {{round($item->send_amount, (optional($item->sendCurrency)->flag == 0)? 2 : 8)}}
                                                {{optional($item->sendCurrency)->code}}</td>
                                            <td data-label="@lang('Receive')">
                                                {{number_format($item->receive_amount, (optional($item->receiveCurrency)->flag == 0)? 2 : 8)}} {{optional($item->receiveCurrency)->code}}</td>


                                            <td data-label="@lang('Rate')">@lang('1') {{optional($item->sendCurrency)->code}} =
                                                {{round($item->rate, (optional($item->receiveCurrency)->flag == 0)? 2 : 8)}} {{optional($item->receiveCurrency)->code}}</td>
                                            <td data-label="@lang('Status')">
                                                @if($item->status == 0)
                                                    <span class="badge bg-warning">@lang('Pending')</span>
                                                @elseif($item->status == 1)
                                                    <span class="badge bg-success">@lang('Completed')</span>
                                                @elseif($item->status == 2)
                                                    <span class="badge bg-danger">@lang('Rejected')</span>
                                                @endif
                                            </td>
                                            <td data-label="@lang('Time')">
                                               {{$item->created_at->format('d/m/Y H:i')}}
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

                <div class="col-12">

                    {{ $currencySells->appends($_GET)->links($theme.'partials.pagination') }}
                </div>

            </div>
        </div>
    </section>

    <!--Details Modal -->
    <div id="detailsModal" class="modal fade" role="dialog">
        <div class="modal-dialog  modal-lg modal-dialog-centered">

            <!-- Modal content-->
            <div class="modal-content form-block">
                <div class="modal-header-custom bg-custom">
                    <h5 class="modal-title">@lang('Information')</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <form>
                    <div class="modal-body">
                       <div class="row">
                           <div class="col-md-6">
                               <h5>@lang('Send Currency')</h5>
                               <div class="sender-details mt-4">

                               </div>
                           </div>
                           <div class="col-md-6">
                               <h5>@lang('Receive Currency')</h5>
                               <div class="receiver-details mt-4">

                               </div>
                           </div>
                       </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">@lang('Close')</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
@endsection
@push('script')
    <script>
        "use strict";
        $(document).ready(function() {
            $(document).on("click", '.view_details', function(e) {
                 var senderInfo = Object.entries($(this).data('sender_info'));
                var receiverInfo = Object.entries($(this).data('receiver_info'));

                var list = [];
                senderInfo.map(function(item, i) {
                    list[i] = `<div class="input-group mb-3 ">
                                       <div class="input-group-prepend">
                                           <button class="btn btn-custom-info" type="button">${item[1].field_name}</button>
                                       </div>
                                       <input type="text" id="" class="form-control" value=${item[1].field_value} readonly />
                                   </div>`
                });

                $('.sender-details').html(list);

                var receive = [];
                receiverInfo.map(function(item, i) {
                    receive[i] = `<div class="input-group mb-3 ">
                                       <div class="input-group-prepend">
                                           <button class="btn btn-custom-info" type="button">${item[1].field_name}</button>
                                       </div>
                                       <input type="text" id="" class="form-control" value=${item[1].field_value} readonly />
                                   </div>`
                });

                $('.receiver-details').html(receive);
            });
        });
    </script>
@endpush
