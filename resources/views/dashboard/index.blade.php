@extends('dashboard.layouts.main')
@section('page-heading', 'Dashboard')

@section('content')
    {{-- @foreach ($kategoriBarangs as $kategoriBarang) --}}
    <div class="col-xl-3 col-lg-6 col-md-12 col-12 mt-6">
        <!-- card -->
        <div class="card ">
            <!-- card body -->
            <div class="card-body">
                <!-- heading -->
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <div>
                        <h5 class="mb-0 fw-bold">Users</h5>
                    </div>
                    <div class="icon-shape icon-md bg-light-primary text-primary rounded-2">
                        <i class="fa-regular fa-users fs-4"></i>
                    </div>
                </div>

                <!-- project number -->
                <div>
                    <h5>Total Users</h5>
                    <h5>{{ $user }} User</h5>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-lg-6 col-md-12 col-12 mt-6">
        <!-- card -->
        <div class="card ">
            <!-- card body -->
            <div class="card-body">
                <!-- heading -->
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <div>
                        <h5 class="mb-0 fw-bold">Dataset</h5>
                    </div>
                    <div class="icon-shape icon-md bg-light-primary text-primary rounded-2">
                        <i class="fa-regular fa-database fs-4"></i>
                    </div>
                </div>

                <!-- project number -->
                <div>
                    <h5>Total Data</h5>
                    <h5>{{ $data }} Data</h5>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-lg-6 col-md-12 col-12 mt-6">
        <!-- card -->
        <div class="card ">
            <!-- card body -->
            <div class="card-body">
                <!-- heading -->
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <div>
                        <h5 class="mb-0 fw-bold">Klasifikasi Berprestasi Akademik</h5>
                    </div>
                    <div class="icon-shape icon-md bg-light-primary text-primary rounded-2">
                        <i class="fa-regular fa-check fs-4"></i>
                    </div>
                </div>

                <!-- project number -->
                <div>
                    <h5>Total</h5>
                    <h5>{{ $totalAkademik }} Data</h5>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-lg-6 col-md-12 col-12 mt-6">
        <!-- card -->
        <div class="card ">
            <!-- card body -->
            <div class="card-body">
                <!-- heading -->
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <div>
                        <h5 class="mb-0 fw-bold">Klasifikasi Berprestasi Non-Akademik</h5>
                    </div>
                    <div class="icon-shape icon-md bg-light-primary text-primary rounded-2">
                        <i class="fa-regular fa-x fs-4"></i>
                    </div>
                </div>

                <!-- project number -->
                <div>
                    <h5>Total</h5>
                    <h5>{{ $totalNon }} Data</h5>
                </div>
            </div>
        </div>
    </div>
    {{-- @endforeach --}}
@endsection
