@extends($theme.'layouts.app')
@section('title',trans($title))

@section('content')
    <!-- contact section -->
    @if(isset($contact))
        <section class="contact-section">
            <div class="container">
                <div class="row gy-5 g-md-5 align-items-center justify-content-around">
                    <div class="col-lg-6">
                        <div class="mb-5">
                            <h2>@lang(@$contact->heading)</h2>
                            <p>
                                @lang(@$contact->sub_heading)
                            </p>
                        </div>
                        <form action="{{route('contact.send')}}" method="post">
                            @csrf
                            <div class="row g-4">
                                <div class="input-box col-md-6">
                                    <input class="form-control" type="text" name="name" value="{{old('name')}}"
                                           placeholder="@lang('Full name')"/>
                                    @error('name')
                                    <span class="text-danger">{{$message}}</span>
                                    @enderror
                                </div>
                                <div class="input-box col-md-6">
                                    <input class="form-control" type="email" name="email" value="{{old('email')}}"
                                           placeholder="@lang('Email address')"/>
                                    @error('email')
                                    <span class="text-danger">{{$message}}</span>
                                    @enderror
                                </div>
                                <div class="input-box col-md-12">
                                    <input class="form-control" type="text" name="subject"
                                           value="{{old('subject')}}" placeholder="@lang('Subject')"/>
                                    @error('subject')
                                    <span class="text-danger">{{$message}}</span>
                                    @enderror
                                </div>
                                <div class="input-box col-12">
                                    <textarea class="form-control" name="message" cols="30" rows="3"
                                              placeholder="@lang('Your message')">{{old('message')}}</textarea>
                                    @error('message')
                                    <span class="text-danger">{{$message}}</span>
                                    @enderror
                                </div>
                                <div class="input-box col-12">
                                    <button class="wallet btn-ico">
                                        <i class="fas fa-paper-plane" aria-hidden="true"></i> <span>@lang('Send')</span>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-lg-4 ">
                        <div class="contact-box ">
                            <div class="icon-box">
                                <i class="fal fa-map-marker-alt"></i>
                            </div>
                            <div class="text-box">
                                <h5>@lang('Address')</h5>
                                <p>
                                    @lang($contact->address)
                                </p>
                            </div>
                        </div>

                        <div class="contact-box">
                            <div class="icon-box">
                                <i class="fal fa-envelope"></i>
                            </div>
                            <div class="text-box">
                                <h5>@lang('Email us')</h5>
                                <p>@lang($contact->email)</p>
                            </div>
                        </div>

                        <div class="contact-box">
                            <div class="icon-box">
                                <i class="fal fa-phone-alt"></i>
                            </div>
                            <div class="text-box">
                                <h5>@lang('Call Now')</h5>
                                <p>@lang($contact->phone)</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    @endif
@endsection
