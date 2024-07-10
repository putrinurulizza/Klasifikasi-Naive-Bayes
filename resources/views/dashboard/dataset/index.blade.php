@extends('dashboard.layouts.main')

@section('content')
    <div class="container">
        <h2 class="main-title mt-2 fw-semibold fs-3">Tabel Dataset</h2>

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
        <button class="btn btn-primary fs-5 fw-normal mt-2" data-bs-toggle="modal" data-bs-target="#addDataset"><i
                class="fa-solid fa-square-plus fs-5 me-2"></i>Tambah</button>

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
                                        <th>NAMA</th>
                                        <th>IPK</th>
                                        <th>EKSTRAKURIKULER</th>
                                        <th>KEPEMIMPINAN</th>
                                        <th>SERTIFIKAT</th>
                                        <th>LABEL</th>
                                        <th>ACTION</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($datasets as $dataset)
                                        <tr>
                                            <td>{{ $loop->iteration }}</td>
                                            <td>{{ $dataset->nama }}</td>
                                            <td>{{ $dataset->ipk }}</td>
                                            <td>{{ $dataset->ekstrakurikuler }}</td>
                                            <td>{{ $dataset->kepemimpinan }}</td>
                                            <td>{{ $dataset->sertifikat }}</td>
                                            <td>{{ $dataset->label }}</td>
                                            <td>
                                                <button type="button" class="btn btn-sm btn-warning me-2"
                                                    data-bs-toggle="modal"
                                                    data-bs-target="#editDataset{{ $loop->iteration }}">
                                                    <i class="fa-solid fa-pen-to-square"></i>
                                                </button>
                                                <button type="button" class="btn btn-sm btn-danger" data-bs-toggle="modal"
                                                    data-bs-target="#hapusDataset{{ $loop->iteration }}">
                                                    <i class="fa-solid fa-trash"></i>
                                                </button>
                                            </td>
                                        </tr>

                                        {{-- Modal Edit  --}}
                                        <x-form_modal>
                                            @slot('id', "editDataset$loop->iteration")
                                            @slot('title', 'Edit Dataset')
                                            @slot('overflow', 'overflow-auto')
                                            @slot('route', route('dataset.update', $dataset->id))
                                            @slot('method') @method('put') @endslot
                                            @slot('btnPrimaryTitle', 'Perbarui')

                                            @csrf
                                            <div class="row">
                                                <div class="mb-3">
                                                    <label for="nama" class="form-label">Nama</label>
                                                    <input type="text"
                                                        class="form-control @error('nama') is-invalid @enderror"
                                                        name="nama" id="nama"
                                                        value="{{ old('nama', $dataset->nama) }}" autofocus required>
                                                    @error('nama')
                                                        <div class="invalid-feedback">
                                                            {{ $message }}
                                                        </div>
                                                    @enderror
                                                </div>

                                                <div class="mb-3">
                                                    <label for="ipk" class="form-label">IPK</label>
                                                    <input type="number" step="0.01"
                                                        class="form-control @error('ipk') is-invalid @enderror"
                                                        name="ipk" id="ipk"
                                                        value="{{ old('ipk', $dataset->ipk) }}" autofocus required>
                                                    @error('ipk')
                                                        <div class="invalid-feedback">
                                                            {{ $message }}
                                                        </div>
                                                    @enderror
                                                </div>

                                                <div class="mb-3">
                                                    <label for="ekstrakurikuler" class="form-label">Ekstrakurikuler</label>
                                                    <select
                                                        class="form-control @error('ekstrakurikuler') is-invalid @enderror"
                                                        name="ekstrakurikuler" id="ekstrakurikuler" required>
                                                        <option value="1"
                                                            {{ old('ekstrakurikuler', $dataset->ekstrakurikuler) == '1' ? 'selected' : '' }}>
                                                            Terlibat
                                                        </option>
                                                        <option value="0"
                                                            {{ old('ekstrakurikuler', $dataset->ekstrakurikuler) == '0' ? 'selected' : '' }}>
                                                            Tidak Terlibat
                                                        </option>
                                                    </select>
                                                    @error('ekstrakurikuler')
                                                        <div class="invalid-feedback">
                                                            {{ $message }}
                                                        </div>
                                                    @enderror
                                                </div>

                                                <div class="mb-3">
                                                    <label for="kepemimpinan" class="form-label">Kepemimpinan</label>
                                                    <select class="form-control @error('kepemimpinan') is-invalid @enderror"
                                                        name="kepemimpinan" id="kepemimpinan" required>
                                                        <option value="1"
                                                            {{ old('kepemimpinan', $dataset->kepemimpinan) == '1' ? 'selected' : '' }}>
                                                            Ada
                                                        </option>
                                                        <option value="0"
                                                            {{ old('kepemimpinan', $dataset->kepemimpinan) == '0' ? 'selected' : '' }}>
                                                            Tidak Ada
                                                        </option>
                                                    </select>
                                                    @error('kepemimpinan')
                                                        <div class="invalid-feedback">
                                                            {{ $message }}
                                                        </div>
                                                    @enderror
                                                </div>

                                                <div class="mb-3">
                                                    <label for="sertifikat" class="form-label">Jumlah Sertifikat</label>
                                                    <input type="number"
                                                        class="form-control @error('sertifikat') is-invalid @enderror"
                                                        name="sertifikat" id="sertifikat"
                                                        value="{{ old('sertifikat', $dataset->sertifikat) }}" autofocus
                                                        required>
                                                    @error('sertifikat')
                                                        <div class="invalid-feedback">
                                                            {{ $message }}
                                                        </div>
                                                    @enderror
                                                </div>

                                                <div class="mb-3">
                                                    <label for="label" class="form-label">Label</label>
                                                    <select class="form-control @error('label') is-invalid @enderror"
                                                        name="label" id="label" required>
                                                        <option value="">Pilih Label</option>
                                                        <option value="Berprestasi Akademik"
                                                            {{ old('label', $dataset->label) == 'Berprestasi Akademik' ? 'selected' : '' }}>
                                                            Berprestasi Akademik
                                                        </option>
                                                        <option value="Berprestasi Non-Akademik"
                                                            {{ old('label', $dataset->label) == 'Berprestasi Non-Akademik' ? 'selected' : '' }}>
                                                            Berprestasi Non-Akademik</option>
                                                    </select>
                                                    @error('label')
                                                        <div class="invalid-feedback">
                                                            {{ $message }}
                                                        </div>
                                                    @enderror
                                                </div>
                                            </div>
                                        </x-form_modal>

                                        {{-- / Modal Edit

                                        {{-- Modal Hapus  --}}
                                        <x-form_modal>

                                            @slot('id', "hapusDataset$loop->iteration")
                                            @slot('title', 'Hapus Dataset')
                                            @slot('route', route('dataset.destroy', $dataset->id))
                                            @slot('method') @method('delete') @endslot
                                            @slot('btnPrimaryClass', 'btn-outline-danger')
                                            @slot('btnSecondaryClass', 'btn-secondary')
                                            @slot('btnPrimaryTitle', 'Hapus')

                                            <p class="fs-5">Apakah anda yakin akan menghapus data
                                                <b>{{ $dataset->nama }}</b>?
                                            </p>

                                        </x-form_modal>
                                        {{-- / Modal Hapus   --}}
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

    <!-- Modal Tambah  -->
    <x-form_modal>
        @slot('id', 'addDataset')
        @slot('title', 'Tambah Dataset')
        @slot('overflow', 'overflow-auto')
        @slot('route', route('dataset.store'))

        @csrf
        <div class="row">
            <div class="mb-3">
                <label for="nama" class="form-label">Nama</label>
                <input type="text" class="form-control @error('nama') is-invalid @enderror" name="nama"
                    id="nama" autofocus required>
                @error('nama')
                    <div class="invalid-feedback">
                        {{ $message }}
                    </div>
                @enderror
            </div>

            <div class="mb-3">
                <label for="ipk" class="form-label">IPK</label>
                <input type="number" step="0.01" class="form-control @error('ipk') is-invalid @enderror"
                    name="ipk" id="ipk" autofocus required>
                @error('ipk')
                    <div class="invalid-feedback">
                        {{ $message }}
                    </div>
                @enderror
            </div>

            <div class="mb-3">
                <label for="ekstrakurikuler" class="form-label">Ekstrakurikuler</label>
                <select class="form-control @error('ekstrakurikuler') is-invalid @enderror" name="ekstrakurikuler"
                    id="ekstrakurikuler" required>
                    <option value="1">Terlibat</option>
                    <option value="0">
                        Tidak Terlibat
                    </option>
                </select>
                @error('ekstrakurikuler')
                    <div class="invalid-feedback">
                        {{ $message }}
                    </div>
                @enderror
            </div>

            <div class="mb-3">
                <label for="kepemimpinan" class="form-label">Kepemimpinan</label>
                <select class="form-control @error('kepemimpinan') is-invalid @enderror" name="kepemimpinan"
                    id="kepemimpinan" required>
                    <option value="1">
                        Ada
                    </option>
                    <option value="0">
                        Tidak Ada
                    </option>
                </select>
                @error('kepemimpinan')
                    <div class="invalid-feedback">
                        {{ $message }}
                    </div>
                @enderror
            </div>

            <div class="mb-3">
                <label for="sertifikat" class="form-label">Jumlah Sertifikat</label>
                <input type="number" class="form-control @error('sertifikat') is-invalid @enderror" name="sertifikat"
                    id="sertifikat" autofocus required>
                @error('sertifikat')
                    <div class="invalid-feedback">
                        {{ $message }}
                    </div>
                @enderror
            </div>

            <div class="mb-3">
                <label for="label" class="form-label">Label</label>
                <select class="form-control @error('label') is-invalid @enderror" name="label" id="label"
                    required>
                    <option value="">Pilih Label</option>
                    <option value="Berprestasi Akademik">
                        Berprestasi Akademik
                    </option>
                    <option value="Berprestasi Non-Akademik">
                        Berprestasi Non-Akademik</option>
                </select>
                @error('label')
                    <div class="invalid-feedback">
                        {{ $message }}
                    </div>
                @enderror
            </div>
        </div>
    </x-form_modal>
    <!-- Akhir Modal Tambah  -->
@endsection
