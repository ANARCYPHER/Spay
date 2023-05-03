@extends($theme.'layouts.user')
@section('title')
    @lang('Testimonial')
@endsection
@section('content')
    <section class="latest-exchanges">
        <div class="container">

            <div class="row">
                <div class="col-md-12">
                    <div class="card custom--card">
                        <div class="card--header gradient-bg justify-content-end align-items-center p-3 py-sm-4 px-sm-4">
                            <button type="button" data-bs-toggle="modal" data-bs-target="#addModal"
                                    class="btn btn-sm btn-custom-success"><i class="fa fa-plus-circle"></i> @lang('Add New')
                            </button>
                        </div>

                        <div class="card-body">
                            <div class="table-parent table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th scope="col">@lang('SL No.')</th>
                                        <th scope="col">@lang('Rate')</th>
                                        <th scope="col">@lang('Status')</th>
                                        <th scope="col">@lang('More')</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @forelse($testimonials as $key => $item)
                                        <tr>
                                            <td>{{++$key}}</td>
                                            <td>
                                                <div class="rating">
                                                    @if($item->rate)
                                                        @for($i=0; $i<$item->rate; $i++)
                                                            <i class="fas fa-star"></i>
                                                        @endfor
                                                    @endif
                                                </div>
                                            </td>
                                            <td>
                                                @if($item->status == 0)
                                                    <span class="badge bg-warning">@lang('Pending')</span>
                                                @else
                                                    <span class="badge bg-success">@lang('Processed')</span>
                                                @endif
                                            </td>
                                            <td>
                                                <button type="button" data-bs-toggle="modal" data-bs-target="#detailsModal"
                                                        data-resource="{{$item->comments}}"
                                                        class="btn btn-sm btn-custom-success view_details">
                                                    <i class="fa fa-eye" aria-hidden="true"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    @empty
                                        <tr class="text-center">
                                            <td colspan="3">@lang('still no have testimonial')</td>
                                        </tr>
                                    @endforelse
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!--Add Modal -->
    <div id="addModal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-dialog-centered">

            <!-- Modal content-->
            <div class="modal-content form-block">
                <div class="modal-header-custom bg-custom">
                    <h5 class="modal-title">@lang('Add New')</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <form action="{{route('user.testimonialStore')}}" method="post">
                    @csrf
                    <div class="modal-body">
                        <div class="form-group input-box">

                            <label>@lang('Select a transaction')</label>
                            <select name="currency_sell_id" id="currency_sell_id" class="form-control">
                                <option value="" selected disabled>@lang('Select One')</option>
                                @foreach($currency_sells as $obj)
                                    <option value="{{$obj->id}}" @if($obj->id == old('currency_sell_id')) selected @endif>{{$obj->exchange_id}} - {{$obj->sendCurrency->code}} 	&raquo; {{$obj->receiveCurrency->code}} ({{trans('Amount')}} : {{$obj->send_amount+0}} {{$obj->sendCurrency->code}} )</option>
                                @endforeach
                            </select>

                            @error('currency_sell_id')<span class="text-danger  mt-1">{{ $message }}</span>@enderror
                        </div>

                        <div class="form-group">
                            <div class="input-box">
                                <label>@lang('Comment')</label>
                                <textarea class="form-control" name="comments" cols="10" rows="2"
                                          placeholder="@lang('Your message')">{{old('comments')}}</textarea>
                                @error('comments')<span class="text-danger  mt-1">{{ $message }}</span>@enderror
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-box">
                                <label>@lang('Rate')</label>
                                <input type="number" class="form-control" name="rate" min="1" max="5"
                                       placeholder="@lang('5')" value="{{old('rate')}}">
                                @error('rate')<span class="text-danger  mt-1">{{ $message }}</span>@enderror
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">@lang('Close')</button>
                        <button type="submit" class="btn btn-custom-success">@lang('Submit')</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!--Details Modal -->
    <div id="detailsModal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-dialog-centered">

            <!-- Modal content-->
            <div class="modal-content form-block">
                <div class="modal-header-custom bg-custom">
                    <h5 class="modal-title">@lang('Testimonial')</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <p class="comments"></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">@lang('Close')</button>
                </div>
            </div>
        </div>
    </div>
@endsection
@push('script')
    <script>
        "use strict";
        $(document).on("click", '.view_details', function (e) {
            var details = $(this).data('resource');
            $('.comments').html(details);

        });
    </script>

    @if(count($errors) > 0 )
        @foreach($errors->all() as $key => $error)
            <script>
                Notiflix.Notify.Failure("@lang($error)");
            </script>
        @endforeach
    @endif
@endpush
