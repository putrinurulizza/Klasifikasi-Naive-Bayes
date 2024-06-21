<nav class="navbar-vertical navbar">
    <div class="nav-scroller">
        <!-- Brand logo -->
        <a class="navbar-brand text-center" href="{{ route('dashboard.index') }}">
            <img class="logo-brand" src="{{ asset('images/logos/main-logo.jpg') }}" alt="naive bayes"
                style="
          width:80%" />
        </a>

        <!-- Navbar nav -->
        <ul class="navbar-nav flex-column" id="sideNavbar">

            <li class="nav-item">
                <a class="nav-link has-arrow {{ Request::is('dashboard/home') ? 'active' : '' }}"
                    href="{{ route('dashboard.index') }}">
                    <i class="fa-regular nav-icon fa-house me-2 fa-fw"></i>
                    Dashboard
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link has-arrow {{ Request::is('dashboard/klasifikasi') ? 'active' : '' }}"
                    href="/dashboard/klasifikasi">
                    <i class="fa-solid fa-calendar-week me-2 fa-fw"></i>
                    Klasifikasi
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link has-arrow {{ Request::is('dashboard/dataset') ? 'active' : '' }}"
                    href="/dashboard/dataset">
                    <i class="fa-solid fa-box-open me-2 fa-fw"></i>
                    Dataset
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link has-arrow {{ Request::is('dashboard/user') ? 'active' : '' }}"
                    href="/dashboard/user">
                    <i class="fa-solid fa-users me-2 fa-fw"></i>
                    User
                </a>
            </li>

        </ul>
    </div>
</nav>
