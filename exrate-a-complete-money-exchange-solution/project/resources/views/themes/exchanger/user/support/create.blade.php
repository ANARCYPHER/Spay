@extends($theme.'layouts.user')
@section('title',__($page_title))

@section('content')
    <section class="login-section">
        <div class="container add-fund pb-50">
            <div class="row">
                <div class="col-sm-12">
                    <div class="card custom--card">
                        <div
                            class="card--header gradient-bg text-center p-3 py-sm-4 px-sm-4 d-flex justify-content-between align-items-center">
                            <h5 class="card-title mb-3">@lang($page_title)</h5>
                            <a href="{{route('user.ticket.list')}}" class="btn btn-sm btn-custom-success"> <i
                                    class="fa fa-list-alt"></i> @lang('Support Ticket')</a>
                        </div>

                        <div class="card-body">
                            <form class="form-row" action="{{route('user.ticket.store')}}" method="post"
                                  enctype="multipart/form-data">
                                @csrf

                                <div class="col-md-12">
                                    <div class="input-box">
                                        <label>@lang('Subject')</label>
                                        <input class="form-control" type="text" name="subject"
                                               value="{{old('subject')}}" placeholder="@lang('Enter Subject')">
                                        @error('subject')
                                        <div class="error text-danger">@lang($message) </div>
                                        @enderror
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="input-box mb-3">
                                        <label>@lang('Message')</label>
                                        <textarea class="form-control ticket-box" name="message" rows="5"
                                                  id="textarea1"
                                                  placeholder="@lang('Enter Message')">{{old('message')}}</textarea>
                                        @error('message')
                                        <div class="error text-danger">@lang($message) </div>
                                        @enderror
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="input-box">
                                        <input type="file" name="attachments[]"
                                               class="form-control "
                                               multiple
                                               placeholder="@lang('Upload File')">

                                        @error('attachments')
                                        <span class="text-danger">{{trans($message)}}</span>
                                        @enderror
                                    </div>
                                </div>

                                <div class="col-md-12 mt-5">
                                    <div class="form-group mt-3">
                                        <button type="submit"
                                                class=" btn btn-rounded btn-ico btn-block">
                                            <span>@lang('Submit')</span></button>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

@push('style')
    <style>
        .login-section form {
            padding: 20;
            max-width: 100%;
        }
    </style>
@endpush
