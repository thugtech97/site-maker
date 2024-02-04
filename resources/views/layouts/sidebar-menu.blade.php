<ul class="nav nav-aside">
    <li class="nav-item">
        <a href="" target="_blank" class="nav-link">
            <i data-feather="external-link"></i>
            <span>View Website</span>
        </a>
    </li>

    <li class="nav-item with-sub @if (request()->routeIs('website*')) active show @endif">
        <a href="" class="nav-link"><i data-feather="layers"></i> <span>Websites</span></a>
        <ul>
            <li @if (\Route::current()->getName() == 'website.index') class="active" @endif><a href="{{ route('website.index') }}">List</a></li>
            <li @if (\Route::current()->getName() == 'website.create') class="active" @endif><a href="{{ route('website.create') }}">Create a site</a></li>
        </ul>
    </li>

    <li class="nav-item @if (request()->routeIs('settings*')) active show @endif">
        <a href="{{ route('settings.index') }}" class="nav-link"><i data-feather="settings"></i> <span>Settings</span></a>
    </li>


</ul>
