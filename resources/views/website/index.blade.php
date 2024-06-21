@extends('layouts.app')

@section('pagecss')
    <link href="{{ asset('lib/bselect/dist/css/bootstrap-select.css') }}" rel="stylesheet">
    <link href="{{ asset('lib/bootstrap-tagsinput/bootstrap-tagsinput.css') }}" rel="stylesheet">
    <link href="{{ asset('lib/ion-rangeslider/css/ion.rangeSlider.min.css') }}" rel="stylesheet">

    <style>
        .table td {
            padding: 10px;
            font-size: 13px;
        }
        .loader-container {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 9999; 
        }
        .loader {
            border: 16px solid #f3f3f3;
            border-top: 16px solid #3498db;
            border-radius: 50%;
            width: 120px;
            height: 120px;
            animation: spin 2s linear infinite;
            position: fixed;
            top: 50%;
            left: 50%;
            margin-top: -60px; 
            margin-left: -60px; 
            z-index: 9999; 
        }
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
        .hide-loader {
            display: none;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
    <link href="{{ asset('lib/filter-multiselect/filter-multiselect.css') }}" rel="stylesheet">
@endsection

@section('content')
    <div class="loader-container" id="loader-container">
        <!-- Loader -->
        <div class="loader" id="loader"></div>
    </div>


    <div class="container pd-x-0">
        <div class="d-sm-flex align-items-center justify-content-between mg-b-20 mg-lg-b-25 mg-xl-b-30">
            <div>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb breadcrumb-style1 mg-b-5" style="background-color:white;">
                        <li class="breadcrumb-item" aria-current="page">Sitemaker</li>
                        <li class="breadcrumb-item active" aria-current="page">Sites</li>
                    </ol>
                </nav>
                <h4 class="mg-b-0 tx-spacing--1">Website List</h4>
            </div>
        </div>

        <div class="row row-sm">

            <!-- Start Filters -->
            <div class="col-md-12">
                <div class="filter-buttons">
                    <div class="d-md-flex bd-highlight">
                        <div class="bd-highlight mg-r-10 mg-t-10" style="display:none;">
                            <div class="dropdown d-inline mg-r-5">
                                <button class="btn btn-secondary btn-sm dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                </button>
                                <div class="dropdown-menu">
                                    <form id="filterForm" class="pd-20">
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" id="showDeleted" name="showDeleted" class="custom-control-input">
                                                <label class="custom-control-label" for="showDeleted"></label>
                                            </div>
                                        </div>
                                        <button id="filter" type="button" class="btn btn-sm btn-primary" style="dispaly:none;"></button>
                                    </form>
                                </div>
                            </div>

                        </div>

                        <div class="bd-highlight mg-t-10 mg-r-5">
                            <form class="form-inline" id="searchForm" style="font-size:12px;">
                                <div class="mg-b-10 mg-r-5">
                                    <input name="search" type="search" id="search" class="form-control" style="font-size:12px;width: 150px;"  placeholder="Search Website Name">
                                </div>
                                <div class="mg-b-10">
                                    <button class="btn btn-sm btn-info" type="button" id="btnSearch">Search</button>
                                    <a class="btn btn-sm btn-success" href="">Reset</a>
                                </div>
                            </form>
                        </div>
                        <div class="ml-auto bd-highlight mg-t-10 mg-r-10">
                            <span class="text-success" style="border-radius: 10px;">{{ $availableSite }} out of {{ $maxSite }} sites created</span>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Filters -->

            <!-- Start Pages -->
            <div class="col-md-12">
                <div class="table-list mg-b-10">
                    <table class="table mg-b-0 table-light table-hover" id="table_sales">
                        <thead>
                        <tr>
                            <th></th>
                            <th style="width: 15%;">Company</th>
                            <th style="width: 15%;">Website Name</th>
                            <th class="d-none" style="width: 10%;">Project Type</th>
                            <th class="d-none" style="width: 25%;">Modules</th>
                            <th style="width: 15%;">Contact Person</th>
                            <th style="width: 10%;">Status</th>
                            <th style="width: 15%;">URL</th>
                            <th style="width: 15%;">Last Date Modified</th>
                            <th style="width: 15%;" class="exclude_export">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                            @forelse($websites as $website)
                                @php
                                    $modules = implode(', ', array_column(json_decode($website->modules, true), 'name'));
                                @endphp
                                <tr class="pd-20">
                                    <td><img height="100" width="100" src="{{ asset('storage/'.$website->logo) }}" onerror="this.src='{{ asset('img/No_Image_Available.jpg') }}'"></td>
                                    <td>{{ $website->company }}</td>
                                    <td>{{ $website->website_name }}</td>
                                    <td class="d-none">{{ $website->project_type }}</td>
                                    <td class="d-none">{{ $modules }}</td>
                                    <td>{{ $website->contact_person }}</td>
                                    <td>
                                        @if($website->status == "")
                                            <span class="text-warning text-uppercase"><i>new site</i></span>
                                        @else
                                            <span class="text-success text-uppercase"><i>{{ $website->status }}</i></span>
                                        @endif
                                    </td>
                                    <td>
                                        {!! $website->status != "" 
                                            ? '<a href="http://localhost:8081/wsi-sites/created-sites/' . Str::slug($website->website_name) . '/public" target="_blank">' 
                                            . Str::slug($website->website_name) . '/public</a>' 
                                            : '' 
                                        !!}
                                    </td>
                                    <td>{{ Setting::date_for_listing($website->created_at) }}</td>
                                    <td>
                                        <nav class="nav table-options">
                                            <a class="nav-link" href="{{ route('website.show', $website->id) }}" title="View"><i data-feather="eye"></i></a>
                                            <a class="nav-link @php echo ($website->status != "") ? 'd-none' : ''; @endphp" href="{{ route('website.edit', $website->id) }}" title="Edit"><i data-feather="edit"></i></a>
                                            <a class="nav-link" href="javascript:void(0)" onclick="delete_website({{$website->id}})" title="Delete"><i data-feather="trash-2"></i></a>
                                            <a class="nav-link @php echo ($website->status != "") ? 'd-none' : ''; @endphp" href="javascript:void(0)" onclick="build_site({{$website->id}})" title="Build site"><i data-feather="layers"></i></a>
                                            <a class="nav-link @php echo ($website->status != "Built") ? 'd-none' : ''; @endphp" href="javascript:void(0)" onclick="run_site({{$website->id}})" title="Run"><i data-feather="play"></i></a>
                                        </nav>
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <th colspan="8" style="text-align: center;"> <p class="text-danger">No websites created.</p></th>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
             <!-- End Pages -->
             <div class="col-md-6">
                <div class="mg-t-5">
                    @if ($websites->firstItem() == null)
                        <p class="tx-gray-400 tx-12 d-inline"></p>
                    @else
                        <p class="tx-gray-400 tx-12 d-inline">Showing {{ $websites->firstItem() }} to {{ $websites->lastItem() }} of {{ $websites->total() }} items</p>
                    @endif
                </div>
            </div>
            <div class="col-md-6">
                <div class="text-md-right float-md-right mg-t-5">
                    <div>
                        {{ $websites->links() }}
                    </div>
                </div>
            </div>
            
        </div>
    </div>
    <div class="modal effect-scale" id="prompt-delete" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalCenterTitle">{{__('common.delete_confirmation_title')}}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>{{__('common.delete_confirmation')}}</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm btn-danger" id="btnDelete">Yes, Delete</button>
                    <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <form action="" id="posting_form" style="display:none;" method="post">
        @csrf
        <input type="text" id="website" name="website">
        <input type="text" id="status" name="status">
    </form>

@endsection

@section('pagejs')
    <script src="{{ asset('lib/bselect/dist/js/bootstrap-select.js') }}"></script>
    <script src="{{ asset('lib/bselect/dist/js/i18n/defaults-en_US.js') }}"></script>
    <script src="{{ asset('lib/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('lib/ion-rangeslider/js/ion.rangeSlider.min.js') }}"></script>
    <script src="{{ asset('lib/filter-multiselect/filter-multiselect-bundle.min.js') }}"></script>

    <script src="{{ asset('js/listing.js') }}"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
@endsection
@section('customjs')
    <script>
        $(document).ready(function() {
            $('#loader-container').addClass("hide-loader");
        });

        function post_form(url,status,website){
            $('#posting_form').attr('action',url);
            $('#website').val(website);
            $('#status').val(status);
            $('#posting_form').submit();
        }

        function delete_website(id){
            $('#prompt-delete').modal('show');
            $('#btnDelete').on('click', function() {
                post_form("{{route('website.delete')}}",'',id);
            });
        }

        function build_site(id){
            $('#loader-container').removeClass("hide-loader");

            post_form("{{route('website.build')}}",'',id)
            .then(response => {
                $('#loader-container').addClass("hide-loader");
            })
            .catch(error => {
                $('#loader-container').addClass("hide-loader");
            });
        }

        function run_site(id){
            $('#loader-container').removeClass("hide-loader");
            const csrfToken = $('meta[name="csrf-token"]').attr('content');
            $.ajax({
                type: 'POST',
                url: "{{ route('website.run') }}",
                data: { website: id },
                headers: {
                    'X-CSRF-TOKEN': csrfToken
                },
                success: function(data){
                    if(data.success){
                        console.log('Request successful:', data);
                        window.open(data.url, '_blank');
                    }
                    $('#loader-container').addClass("hide-loader");
                },
                error: (jqXHR, textStatus, errorThrown) => {
                    console.error('Request failed:', textStatus, errorThrown);
                    $('#loader-container').addClass("hide-loader");
                }
            })
        }

    </script>
@endsection

