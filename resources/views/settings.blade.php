@extends('layouts.app')

@section('pagetitle')
    Create News
@endsection

@section('pagecss')
    <link href="{{ asset('lib/bselect/dist/css/bootstrap-select.css') }}" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
    <style>
        .theme-image {
            max-width: 75vh;
            display: block;
            margin: 0 auto;
            border: 1px solid black;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
@endsection


@section('content')

<div class="container pd-x-0">
    <div class="d-sm-flex align-items-center justify-content-between mg-b-20 mg-lg-b-25 mg-xl-b-30">
        <div>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb breadcrumb-style1 mg-b-10">
                    <li class="breadcrumb-item" aria-current="page"><a href="{{route('website.index')}}">Sitemaker</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Settings</li>
                </ol>
            </nav>
            <h4 class="mg-b-0 tx-spacing--1">Settings</h4>
        </div>
    </div>
    <form method="post" action="{{ route('settings.update', ['setting' => 1]) }}" enctype="multipart/form-data">
        <div class="row row-sm">
            <div class="col-lg-6">
                @csrf
                @method('PUT')
                <div class="form-group">
                    <label class="d-block">Max Site *</label>
                    <input type="text" class="form-control @error('max_site') is-invalid @enderror" name="max_site" id="max_site" value="{{ $settings->max_site }}" required>
                    @error('max_site')
                        <span class="text-danger">{{ $message }}</span>
                    @enderror
                </div>
                <div class="form-group">
                    <label class="d-block">Destination Directory (e.g. E:/wsi-sites) *</label>
                    <input type="text" onkeyup="validatePath(this.value)" class="form-control @error('destination_directory') is-invalid @enderror" name="destination_directory" id="destination_directory" value="{{ $settings->destination_directory }}" required >
                    <span class="text-danger small" id="path_remarks"></span>
                    @error('destination_directory')
                        <span class="text-danger">{{ $message }}</span>
                    @enderror
                </div>

            </div>
            <div class="col-lg-12 mg-t-30">
                <button id="save_button" class="btn btn-primary btn-sm btn-uppercase" type="submit">Save</button>
                <a href="{{ route('website.index') }}" class="btn btn-outline-secondary btn-sm btn-uppercase">Cancel</a>
            </div>
        </div>
    </form>    
</div>
@endsection

@section('pagejs')
    <script src="{{ asset('lib/bselect/dist/js/bootstrap-select.js') }}"></script>
    <script src="{{ asset('lib/bselect/dist/js/i18n/defaults-en_US.js') }}"></script>
    <script src="{{ asset('lib/owl.carousel/owl.carousel.js') }}"></script>

@endsection

@section('customjs')
    <script>
        $(document).ready(function(){
            validatePath($("#destination_directory").val());
        });

        function validatePath(selectedPath){
            $("#path_remarks").html("");
            $("#save_button").prop('disabled', false);

            var regex = /^[A-Za-z]:\/[\\a-zA-Z0-9_.-]+(\/[\\a-zA-Z0-9_.-]+)*$/;

            var isValidPath = regex.test(selectedPath);

            if (!isValidPath) {
                $("#path_remarks").html('Not a valid path.');
                $("#save_button").prop('disabled', true);
            }
        }
    </script>
@endsection
