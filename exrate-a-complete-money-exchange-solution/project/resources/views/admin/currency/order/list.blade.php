@extends('admin.layouts.app')
@section('title')
    @lang('Exchange List')
@endsection

@section('content')
    <div class="page-header card card-primary m-0 m-md-4 my-4 m-md-0 p-5 shadow">
        <div class="row justify-content-between">
            <div class="col-md-12">
                <form action="{{ route('admin.exchange.orderLis.search') }}" method="get">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="form-group">
                                <input type="text" name="search" value="{{@request()->search}}" class="form-control"
                                       placeholder="@lang('Email/Username')">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <select name="status" class="form-control">
                                    <option value="">@lang('All History')</option>
                                    <option value="0"
                                            @if(@request()->status == '0') selected @endif>@lang('Pending History')</option>
                                    <option value="1"
                                            @if(@request()->status == '1') selected @endif>@lang('Complete History')</option>
                                    <option value="2"
                                            @if(@request()->status == '2') selected @endif>@lang('Reject History')</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="form-group">
                                <input type="date" class="form-control" name="date_time" id="datepicker"/>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="form-group">
                                <button type="submit" class="btn w-100 w-md-auto btn-primary"><i
                                        class="fas fa-search"></i> @lang('Search')</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="card card-primary m-0 m-md-4 my-4 m-md-0 shadow">
        <div class="card-body">
            <div class="table-responsive">
                <table class="categories-show-table table table-hover table-striped table-bordered">
                    <thead class="thead-dark">
                    <tr>
                        <th scope="col">@lang('No.')</th>
                        <th scope="col">@lang('User')</th>
                        <th scope="col">@lang('Exchange ID')</th>
                        <th scope="col">@lang('Rate')</th>
                        <th scope="col">@lang('Send Amount')</th>
                        <th scope="col">@lang('Receive Amount')</th>
                        <th scope="col">@lang('Status')</th>
                        <th scope="col">@lang('Action')</th>
                    </tr>
                    </thead>
                    <tbody>
                    @forelse($sellCurrencies as $key => $sellCurrency)
                        <tr>
                            <td data-label="@lang('No.')">{{++$key}}</td>
                            <td data-label="@lang('User')">
                                <a href="{{route('admin.user-edit',$sellCurrency->user_id)}}">
                                    <div class="d-flex no-block align-items-center">
                                        <div class="mr-3"><img
                                                src="{{getFile(config('location.user.path').optional(@$sellCurrency->user)->image) }}"
                                                alt="user" class="rounded-circle" width="45" height="45"></div>
                                        <div class="">
                                            <h5 class="text-dark mb-0 font-16 font-weight-medium">@lang(optional(@$sellCurrency->user)->username)</h5>
                                            <span
                                                class="text-muted font-14">{{optional(@$sellCurrency->user)->email}}</span>
                                        </div>
                                    </div>
                                </a>
                            </td>
                            <td data-label="@lang('Exchange ID')">@lang($sellCurrency->exchange_id)</td>
                            <td data-label="@lang('Rate')">@lang('1') {{optional($sellCurrency->sendCurrency)->code}} <i
                                    class="fa fa-exchange-alt"></i> @lang($sellCurrency->rate) {{optional($sellCurrency->receiveCurrency)->code}}</td>
                            <td data-label="@lang('Send Amount')">{{getAmount($sellCurrency->send_amount)}} {{optional($sellCurrency->sendCurrency)->code}}</td>
                            <td data-label="@lang('Receive Amount')">{{getAmount($sellCurrency->receive_amount)}} {{optional($sellCurrency->receiveCurrency)->code}}</td>
                            <td data-label="Status">
                                    @if($sellCurrency->status ==0 )
                                        <span class="badge badge-light"><i
                                                class="fa fa-circle text-warning pending font-12"></i> @lang('Awaiting')</span>
                                    @elseif($sellCurrency->status ==1 )
                                        <span class="badge badge-light"><i
                                                class="fa fa-circle text-success success font-12"></i> @lang('Completed')</span>
                                    @elseif($sellCurrency->status == 2)
                                        <span class="badge badge-light"><i
                                                class="fa fa-circle text-danger danger font-12"></i> @lang('Rejected')</span>
                                    @endif

                            </td>
                            <td data-label="@lang('Action')">
                                <a href="{{route('admin.exchange.orderListDetails',$sellCurrency->id)}}" class="btn btn-outline-primary btn-icon">
                                    <i class="fa fa-eye"></i>
                                </a>
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td class="text-center text-danger" colspan="10">@lang('No Data Found')</td>
                        </tr>
                    @endforelse
                    </tbody>
                </table>
                {{$sellCurrencies->appends(@$search)->links('partials.pagination')}}

            </div>
        </div>
    </div>

    <!-- All Complete Modal -->
    <div class="modal fade" id="all_complete" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header modal-colored-header bg-primary">
                    <h5 class="modal-title">@lang('Complete Confirmation')</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">×</button>
                </div>
                <div class="modal-body">
                    <p>@lang("Are you really want to complete the Exchanges")</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-dismiss="modal"><span>@lang('No')</span></button>
                    <form action="" method="post">
                        @csrf
                        <a href="" class="btn btn-primary active-yes"><span>@lang('Yes')</span></a>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- All Reject Modal -->
    <div class="modal fade" id="all_reject" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header modal-colored-header bg-primary">
                    <h5 class="modal-title">@lang('Reject Confirmation')</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">×</button>
                </div>
                <div class="modal-body">
                    <p>@lang("Are you really want to Reject the Exchanges")</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-dismiss="modal"><span>@lang('No')</span></button>
                    <form action="" method="post">
                        @csrf
                        <a href="" class="btn btn-primary inactive-yes"><span>@lang('Yes')</span></a>
                    </form>
                </div>
            </div>
        </div>
    </div>

@endsection
@push('js')
    <script>
        "use strict";
        $(document).ready(function () {
            $('select').select2({
                selectOnClose: true
            });
        });

        $(document).on('click', '#check-all', function () {
            $('input:checkbox').not(this).prop('checked', this.checked);
        });

        $(document).on('change', ".row-tic", function () {
            let length = $(".row-tic").length;
            let checkedLength = $(".row-tic:checked").length;
            if (length == checkedLength) {
                $('#check-all').prop('checked', true);
            } else {
                $('#check-all').prop('checked', false);
            }
        });


        //multiple active
        $(document).on('click', '.active-yes', function (e) {
            e.preventDefault();
            var allVals = [];
            $(".row-tic:checked").each(function () {
                allVals.push($(this).attr('data-id'));
            });

            var strIds = allVals;

            $.ajax({
                headers: {'X-CSRF-TOKEN': $('meta[name="csrf_token"]').attr('content')},
                url: "{{ route('admin.order.complete') }}",
                data: {strIds: strIds},
                datatType: 'json',
                type: "post",
                success: function (data) {
                     location.reload();
                },
            });
        });

        //multiple deactive
        $(document).on('click', '.inactive-yes', function (e) {
            e.preventDefault();
            var allVals = [];
            $(".row-tic:checked").each(function () {
                allVals.push($(this).attr('data-id'));
            });

            var strIds = allVals;
            $.ajax({
                headers: {'X-CSRF-TOKEN': $('meta[name="csrf_token"]').attr('content')},
                url: "{{ route('admin.order.reject') }}",
                data: {strIds: strIds},
                datatType: 'json',
                type: "post",
                success: function (data) {
                    location.reload();

                }
            });
        });
    </script>
@endpush

