@extends('admin.layouts.master')
@section('page_title',__('Escrow List'))

@section('content')
<div class="main-content">
	<section class="section">
		<div class="section-header">
			<h1>@lang('Escrow List')</h1>
			<div class="section-header-breadcrumb">
				<div class="breadcrumb-item active">
					<a href="{{ route('admin.home') }}">@lang('Dashboard')</a>
				</div>
				<div class="breadcrumb-item">@lang('Escrow List')</div>
			</div>
		</div>

		<div class="row mb-3">
			<div class="container-fluid" id="container-wrapper">
				<div class="row">
					<div class="col-lg-12">
						<div class="card mb-4 card-primary shadow-sm">
							<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
								<h6 class="m-0 font-weight-bold text-primary">@lang('Search')</h6>
							</div>
							<div class="card-body">
								@if(isset($userId))
									<form action="{{ route('admin.user.escrow.search',$userId) }}" method="get">
										@include('admin.escrow.searchForm')
									</form>
								@else
									<form action="{{ route('admin.escrow.search') }}" method="get">
										@include('admin.escrow.searchForm')
									</form>
								@endif
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="card mb-4 card-primary shadow">
							<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
								<h6 class="m-0 font-weight-bold text-primary">@lang('Escrow List')</h6>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-striped table-hover align-items-center table-borderless">
										<thead class="thead-light">
										<tr>
											<th>@lang('SL')</th>
											<th>@lang('Sender')</th>
											<th>@lang('Amount')</th>
											<th>@lang('Receiver')</th>
											<th>@lang('Receiver E-Mail')</th>
											<th>@lang('Transaction ID')</th>
											<th>@lang('Status')</th>
											<th>@lang('Created At')</th>
										</tr>
										</thead>
										<tbody>
										@forelse($escrows as $key => $escrow)
											<tr>
												<td data-label="@lang('SL')">{{ loopIndex($escrows) + $key }}</td>

												<td data-label="@lang('Sender')">
													<a href="{{ route('user.edit', $escrow->sender_id)}}"
													   class="text-decoration-none">
														<div class="d-lg-flex d-block align-items-center ">
															<div class="mr-3"><img
																	src="{{ optional($escrow->sender)->profilePicture()??asset('assets/upload/boy.png') }}"
																	alt="user"
																	class="rounded-circle" width="35"
																	data-toggle="tooltip" title=""
																	data-original-title="{{optional($escrow->sender)->name?? __('N/A')}}">
															</div>
															<div
																class="d-inline-flex d-lg-block align-items-center">
																<p class="text-dark mb-0 font-16 font-weight-medium">{{Str::limit(optional($escrow->sender)->name?? __('N/A'),20)}}</p>
																<span
																	class="text-muted font-14 ml-1">{{ '@'.optional($escrow->sender)->username?? __('N/A')}}</span>
															</div>
														</div>
													</a>

												</td>


												<td data-label="@lang('Amount')">{{ getAmount($escrow->amount).' '.__(optional($escrow->currency)->code) }}</td>

												<td data-label="@lang('Receiver')">
													<a href="{{ route('user.edit', $escrow->receiver_id)}}"
													   class="text-decoration-none">
														<div class="d-lg-flex d-block align-items-center ">
															<div class="mr-3"><img
																	src="{{ optional($escrow->receiver)->profilePicture() ??asset('assets/upload/boy.png')}}"
																	alt="user"
																	class="rounded-circle" width="35"
																	data-toggle="tooltip" title=""
																	data-original-title="{{optional($escrow->receiver)->name?? __('N/A')}}">
															</div>
															<div
																class="d-inline-flex d-lg-block align-items-center">
																<p class="text-dark mb-0 font-16 font-weight-medium">{{Str::limit(optional($escrow->receiver)->name?? __('N/A'),20)}}</p>
																<span
																	class="text-muted font-14 ml-1">{{ '@'.optional($escrow->receiver)->username?? __('N/A')}}</span>
															</div>
														</div>
													</a>
												</td>
												<td data-label="@lang('Receiver E-Mail')">{{ __($escrow->email) }}</td>
												<td data-label="@lang('Transaction ID')">{{ __($escrow->utr) }}</td>
												<td data-label="@lang('Status')">
													@if($escrow->status == 1)
														<span class="badge badge-info">@lang('Generated')</span>
													@elseif($escrow->status == 2)
														<span class="badge badge-success">@lang('Payment done')</span>
													@elseif($escrow->status == 3)
														<span class="badge badge-success">@lang('Sender request to payment disburse')</span>
													@elseif($escrow->status == 4)
														<span class="badge badge-success">@lang('Payment disbursed')</span>
													@elseif($escrow->status == 5)
														<span class="badge badge-success">@lang('Canceled')</span>
													@elseif($escrow->status == 0)
														<span class="badge badge-warning">@lang('Pending')</span>
													@elseif($escrow->status == 6)
														<span class="badge badge-warning">@lang('Dispute')</span>
														@if(optional($escrow->disputable)->status == 1)
															<span class="badge badge-info">@lang('Refunded')</span>
														@elseif(optional($escrow->disputable)->status == 2)
															<span class="badge badge-info">@lang('Payment Disbursed')</span>
														@endif
													@else
														<span class="badge badge-warning">@lang('N/A')</span>
													@endif
												</td>
												<td data-label="@lang('Created At')"> {{ __(date('Y-m-d h:i a',strtotime($escrow->created_at))) }} </td>
											</tr>
										@empty
											<tr>
												<th colspan="100%" class="text-center">@lang('No data found')</th>
											</tr>
										@endforelse
										</tbody>
									</table>
								</div>
								<div class="card-footer">
									{{ $escrows->links() }}
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</section>
</div>
@endsection
