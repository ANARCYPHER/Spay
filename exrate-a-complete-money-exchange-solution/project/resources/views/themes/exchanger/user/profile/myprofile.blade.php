@extends($theme.'layouts.user')
@section('title',trans('Profile Settings'))

@section('content')
    <div class="login-section">
        <div class="container">
            <div class="row gy-5">
                <div class="col-lg-4 mb-5">
                        <div class="user-content">
                            <form method="post" action="{{ route('user.updateProfile') }}"
                                  enctype="multipart/form-data">
                                <div class="form-group">
                                    @csrf
                                    <div class="image-input ">
                                        <label for="image-upload" id="image-label"><i
                                                class="fas fa-upload"></i></label>
                                        <input type="file" name="image" placeholder="Choose image" id="image">
                                        <img id="image_preview_container" class="preview-image"
                                             style="max-width: 200px"
                                             src="{{getFile(config('location.user.path').$user->image)}}"
                                             alt="preview image">
                                    </div>
                                    @error('image')
                                    <span class="text-danger">{{$message}}</span>
                                    @enderror
                                </div>
                                <h3>@lang(ucfirst($user->name))</h3>
                                <p>@lang('Joined At') @lang($user->created_at->format('d M, Y g:i A'))</p>
                                <div class="submit-btn-wrapper text-center text-md-left">
                                    <button type="submit" class="btn-ico">
                                        <span>@lang('Image Update')</span></button>
                                </div>
                            </form>
                        </div>

                </div>

                <div class="col-lg-8">
                    <div class="custom-card card-lg">
                        <div class="card-body">
                            <ul class="nav nav-custom" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link-custom {{ $errors->has('profile') ? 'active' : (($errors->has('password') || $errors->has('identity') || $errors->has('addressVerification')) ? '' : ' active') }}"
                                       data-bs-toggle="tab" href="#home">@lang('Profile Information')</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link-custom {{ $errors->has('password') ? 'active' : '' }}"
                                       data-bs-toggle="tab"
                                       href="#menu1">@lang('Password Setting')</a>
                                </li>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div id="home"
                                     class="container mt-4 tab-pane  {{ $errors->has('profile') ? ' active' : (($errors->has('password') || $errors->has('identity') || $errors->has('addressVerification')) ? '' :  ' active') }}">
                                    <form action="{{ route('user.updateInformation')}}" method="post">
                                        @method('put')
                                        @csrf

                                        <div class="row ">
                                            <div class="col-md-6">
                                                <div class="input-box mb-4">
                                                    <label class="form-label">@lang('First Name')</label>
                                                    <input class="form-control" type="text" name="firstname"
                                                           value="{{old('firstname')?: $user->firstname }}">
                                                    @if($errors->has('firstname'))
                                                        <div
                                                            class="error text-danger">@lang($errors->first('firstname')) </div>
                                                    @endif
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="input-box mb-4">
                                                    <label class="form-label">@lang('Last Name')</label>
                                                    <input class="form-control" type="text" name="lastname"
                                                           value="{{old('lastname')?: $user->lastname }}">
                                                    @if($errors->has('lastname'))
                                                        <div
                                                            class="error text-danger">@lang($errors->first('lastname')) </div>
                                                    @endif
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="input-box mb-4">
                                                    <label class="form-label">@lang('Username')</label>
                                                    <input class="form-control" type="text" name="username"
                                                           value="{{old('username')?: $user->username }}">
                                                    @if($errors->has('username'))
                                                        <div class="error text-danger">@lang($errors->first('username')) </div>
                                                    @endif
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="input-box mb-4">
                                                    <label class="form-label">@lang('Email Address')</label>
                                                    <input class="form-control" type="email"
                                                           value="{{ $user->email }}" readonly>
                                                    @if($errors->has('email'))
                                                        <div
                                                            class="error text-danger">@lang($errors->first('email')) </div>
                                                    @endif
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="input-box mb-4">
                                                    <label class="form-label">@lang('Phone Number')</label>
                                                    <input class="form-control" type="text" readonly
                                                           value="{{$user->phone}}">

                                                    @if($errors->has('phone'))
                                                        <div
                                                            class="error text-danger">@lang($errors->first('phone')) </div>
                                                    @endif
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="input-box mb-4">
                                                    <label class="form-label">@lang('Preferred language')</label>

                                                    <select name="language_id" id="language_id"
                                                            class="form-control">
                                                        <option value="" disabled>@lang('Select Language')</option>
                                                        @foreach($languages as $la)
                                                            <option value="{{$la->id}}"

                                                                {{ old('language_id', $user->language_id) == $la->id ? 'selected' : '' }}>@lang($la->name)</option>
                                                        @endforeach
                                                    </select>

                                                    @if($errors->has('language_id'))
                                                        <div class="error text-danger">@lang($errors->first('language_id')) </div>
                                                    @endif
                                                </div>
                                            </div>
                                        </div>

                                        <div class="input-box">
                                            <label>@lang('Address')</label>
                                            <textarea class="form-control" name="address"
                                                      rows="5">@lang($user->address)</textarea>

                                            @if($errors->has('address'))
                                                <div
                                                    class="error text-danger">@lang($errors->first('address')) </div>
                                            @endif
                                        </div>

                                        <div class="submit-btn-wrapper text-center text-md-left mt-4">
                                            <button type="submit"
                                                    class="btn-ico">
                                                <span>@lang('Update User')</span></button>
                                        </div>
                                    </form>
                                </div>


                                <div id="menu1"
                                     class="container mt-4 tab-pane {{ $errors->has('password') ? 'active' : '' }}">
                                    <form method="post" action="{{ route('user.updatePassword') }}">
                                        @csrf
                                        <div class="input-box mb-4">
                                            <label class="form-label">@lang('Current Password')</label>
                                            <input id="password" type="password" class="form-control"
                                                   name="current_password" autocomplete="off">
                                            @if($errors->has('current_password'))
                                                <div
                                                    class="error text-danger">@lang($errors->first('current_password')) </div>
                                            @endif
                                        </div>
                                        <div class="input-box mb-4">
                                            <label class="form-label">@lang('New Password')</label>
                                            <input id="password" type="password" class="form-control"
                                                   name="password" autocomplete="off">
                                            @if($errors->has('password'))
                                                <div
                                                    class="error text-danger">@lang($errors->first('password')) </div>
                                            @endif
                                        </div>

                                        <div class="input-box mb-4">
                                            <label class="form-label">@lang('Confirm Password')</label>
                                            <input id="password_confirmation" type="password"
                                                   name="password_confirmation" autocomplete="off"
                                                   class="form-control">
                                            @if($errors->has('password_confirmation'))
                                                <div
                                                    class="error text-danger">@lang($errors->first('password_confirmation')) </div>
                                            @endif
                                        </div>

                                        <div class="submit-btn-wrapper text-center mt-4">
                                            <button type="submit"
                                                    class="btn-ico">
                                                <span>@lang('Update Password')</span></button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection

@push('css-lib')
    <link rel="stylesheet" href="{{asset($themeTrue.'css/bootstrap-fileinput.css')}}">
@endpush

@push('extra-js')
    <script src="{{asset($themeTrue.'js/bootstrap-fileinput.js')}}"></script>
@endpush

@push('script')
    <script>
        "use strict";

        $(document).on('click', '#image-label', function () {
            $('#image').trigger('click');
        });
        $(document).on('change', '#image', function () {
            var _this = $(this);
            var newimage = new FileReader();
            newimage.readAsDataURL(this.files[0]);
            newimage.onload = function (e) {
                $('#image_preview_container').attr('src', e.target.result);
            }
        });
    </script>
@endpush
