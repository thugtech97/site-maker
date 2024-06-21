@extends('layouts.app')

@section('pagetitle')
    Create News
@endsection

@section('pagecss')
    <link href="{{ asset('lib/bselect/dist/css/bootstrap-select.css') }}" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
    <style lang="scss">
        .theme-image {
            max-width: 65vh;
            display: block;
            margin: 0 auto;
            border: 1px solid black;
            border-radius: 5px;
            cursor: pointer;
        }

        .selected-theme {
            box-shadow: 10px 10px 10px rgba(0, 123, 255, 0.5);
            transition: border-color 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
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
                    <li class="breadcrumb-item active" aria-current="page">Sites</li>
                </ol>
            </nav>
            <h4 class="mg-b-0 tx-spacing--1">Create a site</h4>
        </div>
    </div>
    <form method="post" action="{{ route('website.store') }}" enctype="multipart/form-data">
        <div class="row row-sm">
            <div class="col-lg-6">
                @csrf
                <div class="form-group">
                    <label class="d-block">Company Name *</label>
                    <input type="text" class="form-control @error('company') is-invalid @enderror" name="company" id="company" value="{{ old('company') }}" required>
                    @error('company')
                        <span class="text-danger">{{ $message }}</span>
                    @enderror
                    <label class="d-block">Logo *</label>
                    <input type="file" class="form-control-file" name="logo" id="companylogo" accept="image/*" required>
                    <img id="previewLogo" style="display: none; max-width: 20%; margin-top: 10px;" alt="Preview Logo">
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
                            <option value="{{ $module->id }}" {{ in_array($module->id, [1, 2, 3, 4, 5, 6, 7, 8]) ? 'selected' : '' }}>
                                {{strtoupper($module->name)}}
                            </option>
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
                    <label class="d-block">Email *</label>
                    <input type="email" class="form-control @error('url') is-invalid @enderror" name="url" id="url" value="{{ old('url') }}" required>
                    @error('url')
                        <span class="text-danger">{{ $message }}</span>
                    @enderror
                </div>
                <div class="form-group">
                    <label class="d-block">Themes *</label>
<!--
                    <div class="themes-container d-flex flex-column flex-md-row flex-lg-row mt-4">
                        <div class="form-check form-check-inline">
                            <input type="radio" name="theme" id="theme1" class="form-check-input theme-selector d-none" value="theme1" data-theme="Theme 1" required>
                            <label for="theme1" class="form-check-label">
                                <img src="{{ asset('img/themes/theme1.png') }}" onerror="this.src='{{ asset('img/No_Image_Available.jpg') }}'" alt="Theme 1" class="theme-image">
                                <p class="text-center mt-2">Theme 1</p>
                            </label>
                        </div>&nbsp;&nbsp;&nbsp;
                        <div class="form-check form-check-inline">
                            <input type="radio" name="theme" id="theme2" class="form-check-input theme-selector d-none" value="theme2" data-theme="Theme 2" required>
                            <label for="theme2" class="form-check-label">
                                <img src="{{ asset('img/themes/theme2.png') }}" onerror="this.src='{{ asset('img/No_Image_Available.jpg') }}'" alt="Theme 2" class="theme-image">
                                <p class="text-center mt-2">Theme 2</p>
                            </label>
                        </div>
                    </div>
!-->
                    <div class="themes-container d-flex flex-column flex-md-row flex-lg-row mt-4">
                        <div class="form-check form-check-inline">
                            <input type="radio" name="theme" id="law_theme" class="form-check-input theme-selector d-none" value="law_theme" required>
                            <label for="law_theme" class="form-check-label">
                                <img src="{{ asset('img/themes/law-theme.png') }}" onerror="this.src='{{ asset('img/No_Image_Available.jpg') }}'" alt="Law Firm" class="theme-image">
                                <p class="text-center mt-2">Law Firm</p>
                            </label>
                        </div>&nbsp;&nbsp;&nbsp;
                        <div class="form-check form-check-inline">
                            <input type="radio" name="theme" id="drone-theme" class="form-check-input theme-selector d-none" value="drone-theme" required>
                            <label for="drone-theme" class="form-check-label">
                                <img src="{{ asset('img/themes/drone-theme.png') }}" onerror="this.src='{{ asset('img/No_Image_Available.jpg') }}'" alt="burger_theme" class="theme-image">
                                <p class="text-center mt-2">Drone Theme</p>
                            </label>
                        </div>
                    </div>

                    <div class="themes-container d-flex flex-column flex-md-row flex-lg-row mt-4">
                        <div class="form-check form-check-inline">
                            <input type="radio" name="theme" id="travel-theme" class="form-check-input theme-selector d-none" value="travel-theme" required>
                            <label for="travel-theme" class="form-check-label">
                                <img src="{{ asset('img/themes/travel-theme.png') }}" onerror="this.src='{{ asset('img/No_Image_Available.jpg') }}'" alt="" class="theme-image">
                                <p class="text-center mt-2">Travel Theme</p>
                            </label>
                        </div>&nbsp;&nbsp;&nbsp;
                        <div class="form-check form-check-inline">
                            <input type="radio" name="theme" id="kindergarten" class="form-check-input theme-selector d-none" value="kindergarten" required>
                            <label for="kindergarten" class="form-check-label">
                                <img src="{{ asset('img/themes/kindergarten.png') }}" onerror="this.src='{{ asset('img/No_Image_Available.jpg') }}'" alt="" class="theme-image">
                                <p class="text-center mt-2">Kindergarten</p>
                            </label>
                        </div>
                    </div>

                    <div class="themes-container d-flex flex-column flex-md-row flex-lg-row mt-4">
                        <div class="form-check form-check-inline">
                            <input type="radio" name="theme" id="gym-theme" class="form-check-input theme-selector d-none" value="gym-theme" required>
                            <label for="gym-theme" class="form-check-label">
                                <img src="{{ asset('img/themes/gym-theme.png') }}" onerror="this.src='{{ asset('img/No_Image_Available.jpg') }}'" alt="" class="theme-image">
                                <p class="text-center mt-2">Gym Theme</p>
                            </label>
                        </div>&nbsp;&nbsp;&nbsp;
                        <div class="form-check form-check-inline">
                            <input type="radio" name="theme" id="pet-theme" class="form-check-input theme-selector d-none" value="pet-theme" required>
                            <label for="pet-theme" class="form-check-label">
                                <img src="{{ asset('img/themes/pet-theme.png') }}" onerror="this.src='{{ asset('img/No_Image_Available.jpg') }}'" alt="" class="theme-image">
                                <p class="text-center mt-2">Pet Theme</p>
                            </label>
                        </div>
                    </div>

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
    <script src="{{ asset('lib/bselect/dist/js/bootstrap-select.js') }}"></script>
    <script src="{{ asset('lib/bselect/dist/js/i18n/defaults-en_US.js') }}"></script>
    <script src="{{ asset('lib/owl.carousel/owl.carousel.js') }}"></script>

@endsection

@section('customjs')
    <script>
        $(document).ready(function () {
        
        $('.theme-selector').on('click', function () {
            $('.theme-selector').each(function () {
                $(this).parent().removeClass('selected-theme');
            });
            $(this).parent().addClass('selected-theme');
        });

        $('#companylogo').change(function () {
            var input = this;
            var logoPreview = $('#previewLogo');

            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    logoPreview.attr('src', e.target.result);
                    logoPreview.css('display', 'block');
                };

                reader.readAsDataURL(input.files[0]);
            }
        });
    });
    </script>
@endsection
