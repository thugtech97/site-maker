<aside class="aside aside-fixed">
    <div class="aside-header">
        <a href="" class="aside-logo">Admin <span>Portal</span></a>
        <a href="" class="aside-menu-link">
            <i data-feather="menu"></i>
            <i data-feather="x"></i>
        </a>
    </div>
    <div class="aside-body">
        <div class="aside-loggedin">
            <div class="d-flex justify-content-center">
                <a href="" class="avatar wd-100"><img src="{{ asset('images/user.png') }}" class="rounded-circle" alt=""></a>
            </div>
            <div class="aside-loggedin-user tx-center">
                <h6 class="tx-semibold mg-b-0"></h6>
                <p class="tx-color-03 tx-11 mg-b-0 tx-uppercase"></p>
            </div>
        </div>
        <!-- aside-loggedin -->
        @include('layouts.sidebar-menu')
    </div>
</aside>