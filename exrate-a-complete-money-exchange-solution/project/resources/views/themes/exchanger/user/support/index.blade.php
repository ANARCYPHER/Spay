@extends($theme.'layouts.user')
@section('title',__($page_title))

@section('content')
    <section class="latest-exchanges">
        <div class="container add-fund pb-50">
            <div class="row justify-content-center">
                <div class="col-sm-12">
                    <div class="card custom--card">
                        <div class="card--header gradient-bg text-center p-3 py-sm-4 px-sm-4 d-flex justify-content-between align-items-center">
                            <h5 class="card-title mb-3">@lang($page_title)</h5>
                            <a href="{{route('user.ticket.create')}}" class="btn btn-sm btn-custom-success"> <i class="fa fa-plus-circle"></i> @lang('Create Ticket')</a>
                        </div>
                        <div class="card-body">

                            <div class="table-responsive">
                                <table class="table table-hover  table-striped  ">
                                    <thead class="thead-dark">
                                    <tr>
                                        <th scope="col">@lang('Subject')</th>
                                        <th scope="col">@lang('Status')</th>
                                        <th scope="col">@lang('Last Reply')</th>
                                        <th scope="col">@lang('Action')</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @forelse($tickets as $key => $ticket)
                                        <tr>
                                            <td data-label="@lang('Subject')">
                                                    <span
                                                        class="font-weight-bold"> [{{ trans('Ticket#').$ticket->ticket }}
                                                        ] {{ $ticket->subject }} </span>
                                            </td>
                                            <td data-label="@lang('Status')">
                                                @if($ticket->status == 0)
                                                    <span
                                                        class="badge bg-success">@lang('Open')</span>
                                                @elseif($ticket->status == 1)
                                                    <span
                                                        class="badge bg-primary">@lang('Answered')</span>
                                                @elseif($ticket->status == 2)
                                                    <span
                                                        class="badge bg-warning">@lang('Replied')</span>
                                                @elseif($ticket->status == 3)
                                                    <span class="badge bg-secondary">@lang('Closed')</span>
                                                @endif
                                            </td>

                                            <td data-label="@lang('Last Reply')">
                                                {{diffForHumans($ticket->last_reply) }}
                                            </td>

                                            <td data-label="@lang('Action')">
                                                <a href="{{ route('user.ticket.view', $ticket->ticket) }}"
                                                   class="btn btn-sm btn-custom-success"
                                                   data-toggle="tooltip" title="" data-original-title="Details">
                                                    <i class="fa fa-eye"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    @empty
                                        <tr class="text-center">
                                            <td colspan="100%">{{__('No Data Found!')}}</td>
                                        </tr>

                                    @endforelse
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-12">

                    {{ $tickets->appends($_GET)->links($theme.'partials.pagination') }}
                </div>
            </div>
        </div>
    </section>
@endsection
