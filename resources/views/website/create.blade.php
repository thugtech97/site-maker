@extends('layouts.app')

@section('pagetitle')
    Create News
@endsection

@section('pagecss')
    <link href="{{ asset('lib/bselect/dist/css/bootstrap-select.css') }}" rel="stylesheet">
    {{-- <script src="{{ asset('lib/ckeditor/ckeditor.js') }}"></script> --}}

    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
            rel="stylesheet"
        />
    {{-- <link rel="stylesheet" href="{{ asset('lib/grapesjs/toastr.min.css') }}" /> --}}
    <link rel="stylesheet" href="{{ asset('lib/custom-grapesjs/grapesjs/dist/css/grapes.min.css') }}" />
    {{-- <link rel="stylesheet" href="{{ asset('lib/custom-grapesjs/assets/css/bamburgh.css') }}" /> --}}
    <link rel="stylesheet" href="{{ asset('lib/custom-grapesjs/assets/css/custom-grapesjs.css') }}" />
    <link rel="stylesheet" href="{{ asset('lib/custom-grapesjs/linearicon/css/linearicons.min.css') }}" />
    {{-- <link rel="stylesheet" href="{{ asset('lib/grapesjs/grapick.min.css') }}" /> --}}
    {{-- <link rel="stylesheet" href="{{ asset('lib/grapesjs/grapesjs-preset-webpage.min.css') }}" /> --}}
    <link rel="stylesheet" href="{{ asset('lib/grapesjs/tooltip.css') }}" />
    <link rel="stylesheet" href="{{ asset('lib/grapesjs/grapesjs-plugin-filestack.css') }}" />
    <link rel="stylesheet" href="{{ asset('lib/grapesjs/tui-color-picker.min.css') }}" />
    <link rel="stylesheet" href="{{ asset('lib/grapesjs/tui-image-editor.min.css') }}" />
@endsection

@section('content')

<div class="container pd-x-0">
    <div class="d-sm-flex align-items-center justify-content-between mg-b-20 mg-lg-b-25 mg-xl-b-30">
        <div>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb breadcrumb-style1 mg-b-10">
                    <li class="breadcrumb-item" aria-current="page"><a href="{{route('website.index')}}">Sitemaker</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Sites</li>
                </ol>
            </nav>
            <h4 class="mg-b-0 tx-spacing--1">Create a site</h4>
        </div>
    </div>
    <form method="post" action="{{ route('website.store') }}">
        <div class="row row-sm">
            <div class="col-lg-6">
                @csrf
                <div class="form-group">
                    <label class="d-block">Company Name *</label>
                    <input type="text" class="form-control @error('company') is-invalid @enderror" name="company" id="company" value="{{ old('company') }}" required>
                    @error('company')
                        <span class="text-danger">{{ $message }}</span>
                    @enderror
                </div>
                <div class="form-group">
                    <label class="d-block">Website Name *</label>
                    <input type="text" class="form-control @error('website_name') is-invalid @enderror" name="website_name" id="website_name" value="{{ old('website_name') }}" required>
                    @error('website_name')
                        <span class="text-danger">{{ $message }}</span>
                    @enderror
                </div>
                <div class="form-group">
                    <label class="d-block">Project Type *</label>
                    <input type="text" class="form-control @error('project_type') is-invalid @enderror" name="project_type" id="project_type" value="{{ old('project_type') }}" required>
                    @error('project_type')
                        <span class="text-danger">{{ $message }}</span>
                    @enderror
                </div>
                <div class="form-group">
                    <label class="d-block">Modules *</label>
                    <select id="module_id" class="selectpicker mg-b-5" name="module_id[]" multiple data-style="btn btn-outline-light btn-md btn-block tx-left" data-width="100%" required>
                        @forelse($modules as $module)
                            <option value="{{$module->id}}">{{strtoupper($module->name)}}</option>
                        @empty
                        @endforelse
                    </select>
                    @error('module_id')
                        <span class="text-danger">{{ $message }}</span>
                    @enderror
                </div>
                <div class="form-group">
                    <label class="d-block">Contact Person *</label>
                    <input type="text" class="form-control @error('contact_person') is-invalid @enderror" name="contact_person" id="contact_person" value="{{ old('contact_person') }}" required>
                    @error('contact_person')
                        <span class="text-danger">{{ $message }}</span>
                    @enderror
                </div>
                <div class="form-group">
                    <label class="d-block">Contact Number *</label>
                    <input type="text" class="form-control @error('contact_number') is-invalid @enderror" name="contact_number" id="contact_number" value="{{ old('contact_number') }}" required>
                    @error('contact_number')
                        <span class="text-danger">{{ $message }}</span>
                    @enderror
                </div>
                <div class="form-group">
                    <label class="d-block">Site URL *</label>
                    <input type="text" class="form-control @error('url') is-invalid @enderror" name="url" id="url" value="{{ old('url') }}" required>
                    @error('url')
                        <span class="text-danger">{{ $message }}</span>
                    @enderror
                </div>
            </div>
            <div class="col-lg-12 mg-t-30">
                <button class="btn btn-primary btn-sm btn-uppercase" type="submit">Save</button>
                <a href="{{ route('website.index') }}" class="btn btn-outline-secondary btn-sm btn-uppercase">Cancel</a>
            </div>
        </div>
    </form>
</div>
@endsection

@section('pagejs')
    <script>
       
    </script>
    <script src="{{ asset('lib/custom-grapesjs/assets/js/popper.min.js') }}"></script>
    <script src="{{ asset('lib/bselect/dist/js/bootstrap-select.js') }}"></script>
    <script src="{{ asset('lib/bselect/dist/js/i18n/defaults-en_US.js') }}"></script>
    <script src="{{ asset('lib/owl.carousel/owl.carousel.js') }}"></script>
    <script src="{{ asset('js/file-upload-validation.js') }}"></script>
    <script src="{{ asset('vendor/laravel-filemanager/js/stand-alone-button-2.js') }}"></script>

@endsection

@section('customjs')
    <script>

    </script>
@endsection
