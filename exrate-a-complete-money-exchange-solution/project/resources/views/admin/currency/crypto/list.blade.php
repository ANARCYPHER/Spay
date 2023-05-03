@extends('admin.layouts.app')
@section('title')
    @lang('Crypto Currency List')
@endsection

@section('content')


    <div class="card card-primary m-0 m-md-4 my-4 m-md-0 shadow">
        <div class="card-body">
            <h4 class="card-title">@lang('Set Your API to Get Update Rate')</h4>
            <form method="post" action="{{route('admin.cryptoControl.action')}}" novalidate="novalidate"
                  class="needs-validation base-form ">
                @csrf
                <div class="row justify-content-center align-items-center">
                    <div class="form-group col-lg-6 col-md-6">
                        <label class="d-block">@lang('Crypto Currency Api')</label>
                        <div class="input-group">
                            <input type='text' value='{{old('crypto_currency_api',$control->crypto_currency_api)}}' name='crypto_currency_api' class="form-control" placeholder="@lang('Get your rate API key from min-api.cryptocompare.com')">
                            <div class="input-group-append">
                                <span class="input-group-text">
                                   <a href="javascript:void(0)"   data-toggle="modal" data-target="#myModal" title="{{trans('See Instruction')}}"> <i class="fa fa-info-circle"></i></a>
                                </span>
                            </div>
                        </div>
                    </div>

                    <div class="form-group col-lg-3 col-md-3">
                        <label class="d-block">@lang('Rate Update')</label>

                        <div class="custom-switch-btn">
                            <input type='hidden' value='1' name='crypto_currency_status'>
                            <input type="checkbox" name="crypto_currency_status" class="custom-switch-checkbox"
                                   id="crypto_currency_status"
                                   value="0" <?php if ($control->crypto_currency_status == 0):echo 'checked'; endif ?> >
                            <label class="custom-switch-checkbox-label" for="crypto_currency_status">
                                <span class="custom-switch-checkbox-inner"></span>
                                <span class="custom-switch-checkbox-switch"></span>
                            </label>
                        </div>
                    </div>
                    <div class="form-group col-lg-3 col-md-3">

                        <button type="submit"
                                class="btn waves-effect waves-light btn-rounded btn-primary btn-block mt-4">
                            <span>@lang('Save Changes')</span></button>
                    </div>

                </div>


            </form>
        </div>
    </div>


    <div class="card card-primary m-0 m-md-4 my-4 m-md-0 shadow">
        <div class="card-body">
            <div class="media justify-content-between mb-4">
                <a href="{{route('admin.createCrypto')}}" class="btn btn-sm btn-primary mr-2">
                    <span><i class="fa fa-plus-circle"></i> @lang('Add New')</span>
                </a>
            </div>

            <div class="dropdown mb-2 text-right">
                <button class="btn btn-sm  btn-dark dropdown-toggle" type="button" id="dropdownMenuButton"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span><i class="fas fa-bars pr-2"></i> @lang('Action')</span>
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <button class="dropdown-item" type="button" data-toggle="modal"
                            data-target="#all_active">@lang('Active')</button>
                    <button class="dropdown-item" type="button" data-toggle="modal"
                            data-target="#all_inactive">@lang('DeActive')</button>
                    <button class="dropdown-item" type="button" data-toggle="modal"
                            data-target="#rate_update">@lang('Rate Update')</button>
                </div>
            </div>


            <div class="table-responsive">
                <table class="categories-show-table table table-hover table-striped table-bordered" id="zero_config">
                    <thead class="thead-dark">
                    <tr>
                        <th scope="col" class="text-center">
                            <input type="checkbox" class="form-check-input check-all tic-check" name="check-all"
                                   id="check-all">
                            <label for="check-all"></label>
                        </th>

                        <th scope="col">@lang('SL No.')</th>
                        <th scope="col">@lang('Name')</th>
                        <th scope="col">@lang('Reserve')</th>
                        <th scope="col">@lang('Buy Rate') <small></small></th>
                        <th scope="col">@lang('Sell Rate') <small></small></th>
                        <th scope="col" class="text-center">@lang('Status')</th>
                        <th scope="col" class="text-center">@lang('Action')</th>
                    </tr>
                    </thead>
                    <tbody>
                    @forelse($currency as  $item)
                        <tr>
                            <td class="text-center">
                                <input type="checkbox" id="chk-{{ $item->id }}"
                                       class="form-check-input row-tic tic-check" name="check" value="{{$item->id}}"
                                       data-id="{{ $item->id }}">
                                <label for="chk-{{ $item->id }}"></label>
                            </td>

                            <td data-label="@lang('SL No.')">{{ $loop->index + 1 }}</td>
                            <td data-label="@lang('Name')">
                                <div class="d-flex no-block align-items-center">
                                    <div class="mr-3"><img src="{{ getFile(config('location.currency.path') . $item->image) }}" alt="user" class="rounded-circle" width="35" height="35"></div>
                                    <div class="mr-3">
                                        <h5 class="text-dark mb-0 font-16 font-weight-medium">@lang($item->name)</h5>
                                    </div>
                                </div>
                            </td>
                            <td data-label="@lang('Reserve')" class=" font-weight-bold">
                                {{ number_format($item->reserve,2) }} {{ $item->code }}
                            </td>
                            <td data-label="@lang('Buy Rate')" class="w-15">
                                <span class=" font-weight-bold"> 1 {{$item->code}} =  {{number_format($item->buy_rate+0)}} @lang('USD')
                            </td>
                            <td data-label="@lang('Sell Rate')" class="w-15">
                                <span class="font-weight-bold"> 1 {{$item->code}} =  {{number_format($item->sell_rate+0)}} @lang('USD')
                            </td>
                            <td data-label="@lang('Status')" >
                                <?php echo $item->statusMessage; ?>
                            </td>

                            <td data-label="@lang('Action')">

                                <div class="dropdown show dropup">
                                    <a class="dropdown-toggle p-3" href="#" id="dropdownMenuLink" data-toggle="dropdown"
                                       aria-haspopup="true" aria-expanded="false">
                                        <i class="fa fa-ellipsis-v" aria-hidden="true"></i>
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                        <a class="dropdown-item" href="{{route('admin.editCrypto',$item->id)}}">
                                            <i class="fa fa-edit text-warning pr-2"
                                               aria-hidden="true"></i> @lang('Edit')
                                        </a>

                                        <a class="dropdown-item notiflix-confirm" href="javascript:void(0)"
                                           data-target="#delete-modal"
                                           data-route="{{route('admin.deleteCrypto',$item->id)}}"
                                           data-toggle="modal">
                                            <i class="fa fa-trash-alt text-danger pr-2"
                                               aria-hidden="true"></i> @lang('Delete')
                                        </a>
                                    </div>
                                </div>

                            </td>
                        </tr>





                    @empty
                        <tr class="text-center">
                            <td colspan="8">@lang('No Data Found')</td>
                        </tr>
                    @endforelse
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- All Active Modal -->
    <div class="modal fade" id="all_active" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header modal-colored-header bg-primary">
                    <h5 class="modal-title">@lang('Active Confirmation')</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">×</button>
                </div>
                <div class="modal-body">
                    <p>@lang("Are you really want to active the currencies")</p>
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

    <!-- All Inactive Modal -->
    <div class="modal fade" id="all_inactive" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header modal-colored-header bg-primary">
                    <h5 class="modal-title">@lang('DeActive Confirmation')</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">×</button>
                </div>
                <div class="modal-body">
                    <p>@lang("Are you really want to Deactive the Currencies")</p>
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

    <!-- Rate Update Modal -->
    <div class="modal fade" id="rate_update" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header modal-colored-header bg-primary">
                    <h5 class="modal-title">@lang('Rate Update Confirmation')</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">×</button>
                </div>
                <div class="modal-body">
                    <p>@lang("Are you really want to Update Rate")</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-dismiss="modal"><span>@lang('No')</span></button>
                    <form action="" method="post">
                        @csrf
                        <a href="" class="btn btn-primary rate-update"><span>@lang('Yes')</span></a>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Delete Modal -->
    <div id="delete-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="primary-header-modalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header modal-colored-header bg-primary">
                    <h4 class="modal-title" id="primary-header-modalLabel">@lang('Delete Confirmation')
                    </h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                    </button>
                </div>
                <div class="modal-body">
                    <p>@lang('Are you sure to delete this?')</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-dismiss="modal">@lang('Close')</button>
                    <form action="" method="post" class="deleteRoute">
                        @csrf
                        @method('delete')
                        <button type="submit" class="btn btn-primary">@lang('Yes')</button>
                    </form>
                </div>
            </div>
        </div>
    </div>


    <!-- Modal for Edit button -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content ">
                <div class="modal-header modal-colored-header bg-primary">
                    <h4 class="modal-title" id="myModalLabel">@lang('Currencylayer rate API')</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <p class="">{{trans('Get your rate API key from')}} <a href="https://min-api.cryptocompare.com">{{trans('min-api.cryptocompare.com')}}</a></p>

                    <p class="text-dark"> {{trans('Set up this Cron job command on your server to get update rate')}}  <br>
                        <code> {{trans('curl -s')}} {{route('cron')}}</code></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">@lang('Close')</button>
                </div>
            </div>
        </div>
    </div>
@endsection
@push('style-lib')
    <link href="{{ asset('assets/admin/css/dataTables.bootstrap4.css') }}" rel="stylesheet">
@endpush
@push('js')
    <script src="{{ asset('assets/admin/js/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('assets/admin/js/datatable-basic.init.js') }}"></script>


    @if ($errors->any())
        @php
            $collection = collect($errors->all());
            $errors = $collection->unique();
        @endphp
        <script>
            "use strict";
            @foreach ($errors as $error)
            Notiflix.Notify.Failure("{{ trans($error) }}");
            @endforeach
        </script>
    @endif

    <script>
        'use strict'
        $(document).ready(function() {
            $('.notiflix-confirm').on('click', function() {
                var route = $(this).data('route');
                $('.deleteRoute').attr('action', route)
            })
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

        //dropdown menu is not working
        $(document).on('click', '.dropdown-menu', function (e) {
            e.stopPropagation();
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
                url: "{{ route('admin.crypto-active') }}",
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
                url: "{{ route('admin.crypto-deactive') }}",
                data: {strIds: strIds},
                datatType: 'json',
                type: "post",
                success: function (data) {
                    location.reload();

                }
            });
        });

        //update rate
        $(document).on('click', '.rate-update', function (e) {
            e.preventDefault();
            var allVals = [];
            $(".row-tic:checked").each(function () {
                allVals.push($(this).attr('data-id'));
            });

            var strIds = allVals;

            $.ajax({
                headers: {'X-CSRF-TOKEN': $('meta[name="csrf_token"]').attr('content')},
                url: "{{ route('cryptoRate') }}",
                data: {strIds: strIds},
                datatType: 'json',
                type: "post",
                success: function (data) {
                    location.reload();
                },
            });
        });
    </script>
@endpush
