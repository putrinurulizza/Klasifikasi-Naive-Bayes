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
                                        <th>PKH</th>
                                        <th>JUMLAH TANGGUNGAN</th>
                                        <th>KEPALA RUMAH TANGGA</th>
                                        <th>KONDISI RUMAH</th>
                                        <th>JUMLAH PENGHASILAN</th>
                                        <th>STATUS RUMAH</th>
                                        <th>LABEL</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($klasifikasis as $klasifikasi)
                                        <tr>
                                            <td>{{ $loop->iteration }}</td>
                                            <td>
                                                @if ($klasifikasi->hasil_klasifikasi == 'Layak')
                                                    <span class="badge badge-danger bg-success fw-bold fs-5">Layak</span>
                                                @else
                                                    <span class="badge badge-warning bg-danger fw-bold fs-5">Tidak
                                                        Layak</span>
                                                @endif
                                            </td>
                                            <td>{{ $klasifikasi->dataset->nama }}</td>
                                            <td>{{ $klasifikasi->dataset->pkh }}</td>
                                            <td>{{ $klasifikasi->dataset->jml_tanggungan }}</td>
                                            <td>{{ $klasifikasi->dataset->kepala_rt }}</td>
                                            <td>{{ $klasifikasi->dataset->kondisi_rumah }}</td>
                                            <td>{{ $klasifikasi->dataset->jml_penghasilan }}</td>
                                            <td>{{ $klasifikasi->dataset->status_rumah }}</td>
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
