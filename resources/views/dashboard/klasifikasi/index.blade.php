@extends('dashboard.layouts.main')

@section('content')
    <div class="container">
        <h2 class="main-title mt-2 fw-semibold fs-3">Klasifikasi Naive Bayes</h2>

        <div class="row">
            <div class="col-sm-6 col-md">
                @if (session()->has('success'))
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        {{ session('success') }}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                @elseif (session()->has('failed'))
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        {{ session('failed') }}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                @endif
            </div>
        </div>
        <form action="{{ route('klasifikasi.klasifikasiProcess') }}" method="POST">
            @csrf
            <button type="submit" class="btn btn-primary fs-5 fw-normal mt-2">
                <i class="fa-solid fa-loader fs-5 me-2"></i>Klasifikasi
            </button>
        </form>
        <div class="row mt-3">
            <div class="col">
                <div class="card mt-2">
                    <div class="card-body">

                        {{-- Tabel Data Barang --}}
                        <div class="table-responsive">
                            <table id="myTable" class="table table-bordered nowrap table-striped align-middle"
                                style="width:100%">
                                <thead>
                                    <tr>
                                        <th>NO</th>
                                        <th>HASIL KLASIFIKASI</th>
                                        <th>NAMA</th>
                                        <th>IPK</th>
                                        <th>EKSTRAKURIKULER</th>
                                        <th>KEPEMIMPINAN</th>
                                        <th>SERTIFIKAT</th>
                                        <th>LABEL</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($klasifikasis as $klasifikasi)
                                        <tr>
                                            <td>{{ $loop->iteration }}</td>
                                            <td>
                                                @if ($klasifikasi->hasil_klasifikasi == 'Berprestasi Akademik')
                                                    <span class="badge badge-danger bg-success fw-bold fs-5">Berprestasi
                                                        Akademik</span>
                                                @else
                                                    <span class="badge badge-warning bg-warning fw-bold fs-5">Berprestasi
                                                        Non-Akademik</span>
                                                @endif
                                            </td>
                                            <td>{{ $klasifikasi->dataset->nama }}</td>
                                            <td>{{ $klasifikasi->dataset->ipk }}</td>
                                            <td>{{ $klasifikasi->dataset->ekstrakurikuler }}</td>
                                            <td>{{ $klasifikasi->dataset->kepemimpinan }}</td>
                                            <td>{{ $klasifikasi->dataset->sertifikat }}</td>
                                            <td>{{ $klasifikasi->dataset->label }}</td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>

                        {{-- / Tabel Data  --}}
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
