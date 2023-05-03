@extends('admin.layouts.app')
@section('title')
    @lang('Edit Fiat Currency')
@endsection
@section('content')

    <div class="card card-primary m-0 m-md-4 my-4 m-md-0 shadow">
        <div class="card-body">
            <div class="media mb-4 justify-content-end">
                <a href="{{route('admin.listFiat')}}" class="btn btn-sm  btn-primary mr-2">
                    <span><i class="fas fa-arrow-left"></i> @lang('Back')</span>
                </a>
            </div>

            <form action="{{route('admin.updateFiat',$fiat->id)}}" class="form-row justify-content-center" method="post"
                  enctype="multipart/form-data">
                @csrf
                <div class="col-md-8">
                    <div class="row ">
                        <div class=" col-md-6">
                            <div class="form-group">
                                <label>@lang('Name')</label>
                                <input type="text" name="name" value="{{$fiat->name}}"
                                       class="form-control" placeholder="@lang('eg. American Dollar, Indian Rupee')">
                                @error('name')
                                <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>

                        <div class=" col-md-6">
                            <div class="form-group">
                                <label>@lang('Code')</label>
                                <input type="text" name="code" value="{{$fiat->code}}"
                                       placeholder="@lang('eg. USD, INR')"
                                       class="form-control">
                                @error('code')
                                <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>


                        <div class=" col-md-6">
                            <div class="form-group">
                                <label>@lang('Symbol')</label>
                                <input type="text" name="symbol" value="{{$fiat->symbol}}"
                                       placeholder="@lang('eg. $, ₹')"
                                       class="form-control">
                                @error('symbol')
                                <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>


                        <div class="form-group col-md-6">
                            <label>@lang('Reserve')</label>
                            <div class="input-group mb-3">
                                <input type="text" name="reserve" value="{{$fiat->reserve}}" class="form-control"
                                       placeholder="0">
                                <div class="input-group-append">
                                    <span class="input-group-text currencyReserveSign">@lang($fiat->code)</span>
                                </div>
                            </div>
                            @error('reserve')
                            <span class="text-danger">{{ $message }}</span>
                            @enderror
                        </div>


                        <div class="form-group col-md-6">
                            <label>@lang('Buy Rate')</label>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span
                                        class="input-group-text">@lang('1 '){{config('basic.currency')}}@lang(' = ')</span>
                                </div>
                                <input type="text" name="buy_rate" value="{{$fiat->buy_rate}}" class="form-control"
                                       placeholder="0">
                                <div class="input-group-append">
                                    <span class="input-group-text currencyReserveSign">@lang($fiat->code)</span>
                                </div>
                            </div>
                            @error('buy_rate')
                            <span class="text-danger">{{ $message }}</span>
                            @enderror
                        </div>

                        <div class="form-group col-md-6">
                            <label>@lang('Sell Rate')</label>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span
                                        class="input-group-text">@lang('1 '){{config('basic.currency')}}@lang(' = ')</span>
                                </div>
                                <input type="text" name="sell_rate" value="{{$fiat->sell_rate}}" class="form-control"
                                       placeholder="0">
                                <div class="input-group-append">
                                    <span class="input-group-text currencyReserveSign">@lang($fiat->code)</span>
                                </div>
                            </div>
                            @error('sell_rate')
                            <span class="text-danger">{{ $message }}</span>
                            @enderror
                        </div>

                        <div class="form-group col-md-4">
                            <label>@lang('Minimun Sell')</label>
                            <div class="input-group mb-3">
                                <input type="text" name="minSell" value="{{$fiat->min_sell+0}}" class="form-control"
                                       placeholder="0">
                                <div class="input-group-append">
                                    <span class="input-group-text"> <span
                                            class="minMaxCurrency">{{$fiat->code}}</span></span>
                                </div>
                            </div>
                            @error('minSell')
                            <span class="text-danger">{{ $message }}</span>
                            @enderror
                        </div>

                        <div class="form-group col-md-4">
                            <label>@lang('Maximum Sell')</label>
                            <div class="input-group mb-3">
                                <input type="text" name="maxSell" value="{{$fiat->max_sell+0}}" class="form-control"
                                       placeholder="0">
                                <div class="input-group-append">
                                    <span class="input-group-text"> <span
                                            class="minMaxCurrency">{{$fiat->code}}</span></span>
                                </div>
                            </div>
                            @error('maxSell')
                            <span class="text-danger">{{ $message }}</span>
                            @enderror
                        </div>

                        <div class="col-md-4">
                            <label for="name"> @lang('Exchange Charge') </label>
                            <div class="input-group">
                                <input type="text" name="commission_rate"
                                       class="form-control"
                                       value="{{ $fiat->commission_rate }}">
                                <div class="input-group-append">
                                    <select class="form-control  mb-3" name="commission_type" aria-label=".form-select-lg example">
                                        <option value="0" @if($fiat->commission_type==0) selected @endif class="minMaxCurrency">@lang($fiat->code)</option>
                                        <option value="1" @if($fiat->commission_type==1) selected @endif>%</option>
                                    </select>
                                </div>
                                @error('commission_rate')
                                <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="card shadow">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between mb-3">

                                        <h5 class="card-title">@lang('Send Currency Form')</h5>
                                        <a href="javascript:void(0)" class="btn btn-dark btn-sm btn-rounded"
                                           id="generate"><i class="fa fa-plus-circle"></i>
                                            {{ trans('Add Field') }}</a>
                                    </div>

                                    <div class=" row addedField">
                                        @if ($fiat->form_field)
                                            @foreach ($fiat->form_field as $k => $v)
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <div class="input-group">

                                                            <input name="field_name[]" class="form-control"
                                                                   type="text" value="{{ $v->field_level }}"
                                                                   required
                                                                   placeholder="{{ trans('Field Name') }}">

                                                            <select name="type[]" class="form-control  ">
                                                                <option value="text"
                                                                        @if ($v->type == 'text') selected @endif>
                                                                    {{ trans('Input Text') }}</option>
                                                                <option value="textarea"
                                                                        @if ($v->type == 'textarea') selected @endif>
                                                                    {{ trans('Textarea') }}</option>
                                                                <option value="file" class="d-none"
                                                                        @if ($v->type == 'file') selected @endif>
                                                                    {{ trans('File upload') }}</option>
                                                            </select>

                                                            <select name="validation[]"
                                                                    class="form-control  ">
                                                                <option value="required"
                                                                        @if ($v->validation == 'required') selected @endif>
                                                                    {{ trans('Required') }}</option>
                                                                <option value="nullable"
                                                                        @if ($v->validation == 'nullable') selected @endif>
                                                                    {{ trans('Optional') }}</option>
                                                            </select>

                                                            <span class="input-group-btn">
                                                                <button class="btn btn-danger  delete_desc"
                                                                        type="button">
                                                                    <i class="fa fa-times"></i>
                                                                </button>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            @endforeach
                                        @endif

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="card shadow">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between mb-3">

                                        <h5 class="card-title">@lang('Receive Currency Form')</h5>
                                        <a href="javascript:void(0)" class="btn btn-dark btn-sm btn-rounded"
                                           id="generate-specification"><i class="fa fa-plus-circle"></i>
                                            {{ trans('Add Field') }}</a>
                                    </div>

                                    <div class=" row addedSpecification">
                                        @if ($fiat->receiver_form)
                                            @foreach ($fiat->receiver_form as $k => $v)
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <div class="input-group">

                                                            <input name="field_specification[]" class="form-control"
                                                                   type="text" value="{{ $v->field_level }}"
                                                                   required
                                                                   placeholder="{{ trans('Field Name') }}">

                                                            <select name="type_specification[]" class="form-control  ">
                                                                <option value="text"
                                                                        @if ($v->type == 'text') selected @endif>
                                                                    {{ trans('Input Text') }}</option>
                                                                <option value="textarea"
                                                                        @if ($v->type == 'textarea') selected @endif>
                                                                    {{ trans('Textarea') }}</option>
                                                                <option value="file" class="d-none"
                                                                        @if ($v->type == 'file') selected @endif>
                                                                    {{ trans('File upload') }}</option>
                                                            </select>

                                                            <select name="validation_specification[]"
                                                                    class="form-control  ">
                                                                <option value="required"
                                                                        @if ($v->validation == 'required') selected @endif>
                                                                    {{ trans('Required') }}</option>
                                                                <option value="nullable"
                                                                        @if ($v->validation == 'nullable') selected @endif>
                                                                    {{ trans('Optional') }}</option>
                                                            </select>

                                                            <span class="input-group-btn">
                                                                <button class="btn btn-danger  delete_desc"
                                                                        type="button">
                                                                    <i class="fa fa-times"></i>
                                                                </button>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            @endforeach
                                        @endif

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-12 col-md-12 my-3">
                            <div class="form-group ">
                                <label for="note"> @lang('Instruction Note For Sending Amount') </label>
                                <textarea class="form-control summernote" name="note" id="summernote" rows="10">
                                 {{$fiat->note}}
                                </textarea>

                                <div class="invalid-feedback">
                                    @error('note')
                                    @lang($message)
                                    @enderror
                                </div>
                                <div class="valid-feedback"></div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="image">@lang('Image')</label>
                                <div class="image-input ">
                                    <label for="image-upload" id="image-label"><i
                                            class="fas fa-upload"></i></label>
                                    <input type="file" name="image" placeholder="@lang('Choose image')"
                                           id="image">
                                    <img id="image_preview_container" class="preview-image"
                                         src="{{ getFile(config('location.currency.path').$fiat->image) }}"
                                         alt="@lang('preview image')">
                                </div>
                                <span
                                    class="text-secondary">@lang('Image size') {{config('location.currency.size')}} @lang('px')</span>
                                @error('image')
                                <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="row">
                                <div class="form-group col-md-12">
                                    <label>@lang('Status')</label>
                                    <input data-toggle="toggle" id="status" data-onstyle="success"
                                           data-offstyle="info" data-on="Active" data-off="Deactive" data-width="100%"
                                           type="checkbox" @if($fiat->status == 1) checked @endif  name="status">
                                    @error('status')
                                    <span class="text-danger">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-12">
                                    <label>@lang('Buy')</label>
                                    <input data-toggle="toggle" id="buyStatus" data-onstyle="success"
                                           data-offstyle="info" data-on="Active" data-off="Deactive" data-width="100%"
                                           type="checkbox" @if($fiat->buy_status == 1) checked @endif name="buyStatus">
                                    @error('buyStatus')
                                    <span class="text-danger">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-12">
                                    <label>@lang('Sell')</label>
                                    <input data-toggle="toggle" id="sellStatus" data-onstyle="success"
                                           data-offstyle="info" data-on="Active" data-off="Deactive" data-width="100%"
                                           type="checkbox" @if($fiat->sell_status == 1) checked
                                           @endif name="sellStatus">
                                    @error('sellStatus')
                                    <span class="text-danger">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <button type="submit"
                        class="btn waves-effect waves-light btn-rounded btn-primary btn-block mt-3"><span><i
                            class="fas fa-save pr-2"></i> @lang('Save')</span></button>

            </form>
        </div>
    </div>
@endsection

@push('style-lib')
    <link rel="stylesheet" href="{{ asset('assets/admin/css/summernote.min.css') }}">
@endpush
@push('js-lib')
    <script src="{{ asset('assets/admin/js/summernote.min.js') }}"></script>
@endpush

@push('js')
    <script>
        "use strict";

        $(document).on('keyup', 'input[name=code]', function (e) {
            $('.currencySign').text("1 " + $(this).val());
            $('.currencyReserveSign').text($(this).val());
            $('.minMaxCurrency').text($(this).val());
        })
        $(document).ready(function (e) {

            $("#generate").on('click', function () {
                var form = `<div class="col-md-12">
                <div class="form-group">
                    <div class="input-group">
                        <input name="field_name[]" class="form-control " type="text" value="" required placeholder="{{ trans('Field Name') }}">

                        <select name="type[]"  class="form-control">
                            <option value="text">{{ trans('Input Text') }}</option>
                            <option value="textarea">{{ trans('Textarea') }}</option>
                            <option value="file" class="d-none">{{ trans('File upload') }}</option>
                        </select>

                        <select name="validation[]"  class="form-control  ">
                            <option value="required">{{ trans('Required') }}</option>
                            <option value="nullable">{{ trans('Optional') }}</option>
                        </select>

                        <span class="input-group-btn">
                            <button class="btn btn-danger delete_desc" type="button">
                                <i class="fa fa-times"></i>
                            </button>
                        </span>
                    </div>
                </div>
            </div> `;

                $('.addedField').append(form)
            });

            $(document).on('click', '.delete_desc', function () {
                $(this).closest('.input-group').parent().remove();
            });

            $("#generate-specification").on('click', function () {
                var form = `<div class="col-md-12">
                <div class="form-group">
                    <div class="input-group">
                        <input name="field_specification[]" class="form-control " type="text" value="" required placeholder="{{ trans('Field Name') }}">

                        <select name="type_specification[]"  class="form-control">
                            <option value="text">{{ trans('Input Text') }}</option>
                            <option value="textarea">{{ trans('Textarea') }}</option>
                        </select>

                        <select name="validation_specification[]"  class="form-control  ">
                            <option value="required">{{ trans('Required') }}</option>
                            <option value="nullable">{{ trans('Optional') }}</option>
                        </select>

                        <span class="input-group-btn">
                            <button class="btn btn-danger delete_desc" type="button">
                                <i class="fa fa-times"></i>
                            </button>
                        </span>
                    </div>
                </div>
            </div> `;

                $('.addedSpecification').append(form)
            });


            $(document).on('click', '.delete_desc', function () {
                $(this).closest('.input-group').parent().remove();
            });

        });

        $('#image').change(function () {
            let reader = new FileReader();
            reader.onload = (e) => {
                $('#image_preview_container').attr('src', e.target.result);
            }
            reader.readAsDataURL(this.files[0]);
        });

        $('.summernote').summernote({
            height: 250,
            callbacks: {
                onBlurCodeview: function () {
                    let codeviewHtml = $(this).siblings('div.note-editor').find('.note-codable')
                        .val();
                    $(this).val(codeviewHtml);
                }
            }
        });

    </script>

    @if ($errors->any())
        @php
            $collection = collect($errors->all());
            $errors = $collection->unique();
        @endphp
        <script>
            "use strict";
            @foreach ($errors as $error)
            Notiflix.Notify.Failure("{{trans($error)}}");
            @endforeach
        </script>
    @endif
@endpush
