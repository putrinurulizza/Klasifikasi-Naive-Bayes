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
                                        <th>PKH</th>
                                        <th>JUMLAH TANGGUNGAN</th>
                                        <th>KEPALA RUMAH TANGGA</th>
                                        <th>KONDISI RUMAH</th>
                                        <th>JUMLAH PENGHASILAN</th>
                                        <th>STATUS RUMAH</th>
                                        <th>LABEL</th>
                                        <th>ACTION</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($datasets as $dataset)
                                        <tr>
                                            <td>{{ $loop->iteration }}</td>
                                            <td>{{ $dataset->nama }}</td>
                                            <td>{{ $dataset->pkh }}</td>
                                            <td>{{ $dataset->jml_tanggungan }}</td>
                                            <td>{{ $dataset->kepala_rt }}</td>
                                            <td>{{ $dataset->kondisi_rumah }}</td>
                                            <td>{{ $dataset->jml_penghasilan }}</td>
                                            <td>{{ $dataset->status_rumah }}</td>
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
                                                    <label for="pkh" class="form-label">PKH</label>
                                                    <select class="form-control @error('pkh') is-invalid @enderror"
                                                        name="pkh" id="pkh" required>
                                                        <option value="">Pilih PKH</option>
                                                        <option value="PKH"
                                                            {{ old('pkh', $dataset->pkh) == 'PKH' ? 'selected' : '' }}>PKH
                                                        </option>
                                                        <option value="Non-PKH"
                                                            {{ old('pkh', $dataset->pkh) == 'Non-PKH' ? 'selected' : '' }}>
                                                            Non-PKH
                                                        </option>
                                                    </select>
                                                    @error('pkh')
                                                        <div class="invalid-feedback">
                                                            {{ $message }}
                                                        </div>
                                                    @enderror
                                                </div>

                                                <div class="mb-3">
                                                    <label for="jml_tanggungan" class="form-label">Jumlah Tanggungan</label>
                                                    <input type="number"
                                                        class="form-control @error('jml_tanggungan') is-invalid @enderror"
                                                        name="jml_tanggungan" id="jml_tanggungan"
                                                        value="{{ old('jml_tanggungan', $dataset->jml_tanggungan) }}"
                                                        required>
                                                    @error('jml_tanggungan')
                                                        <div class="invalid-feedback">
                                                            {{ $message }}
                                                        </div>
                                                    @enderror
                                                </div>

                                                <div class="mb-3">
                                                    <label for="kepala_rt" class="form-label">Kepala Rumah Tangga</label>
                                                    <select class="form-control @error('kepala_rt') is-invalid @enderror"
                                                        name="kepala_rt" id="kepala_rt" required>
                                                        <option value="">Pilih Jenis Kelamin Kepala Rumah Tangga
                                                        </option>
                                                        <option value="Laki-Laki"
                                                            {{ old('kepala_rt', $dataset->kepala_rt) == 'Laki-Laki' ? 'selected' : '' }}>
                                                            Laki-Laki</option>
                                                        <option value="Perempuan"
                                                            {{ old('kepala_rt', $dataset->kepala_rt) == 'Perempuan' ? 'selected' : '' }}>
                                                            Perempuan</option>
                                                    </select>
                                                    @error('kepala_rt')
                                                        <div class="invalid-feedback">
                                                            {{ $message }}
                                                        </div>
                                                    @enderror
                                                </div>

                                                <div class="mb-3">
                                                    <label for="kondisi_rumah" class="form-label">Kondisi Rumah</label>
                                                    <select
                                                        class="form-control @error('kondisi_rumah') is-invalid @enderror"
                                                        name="kondisi_rumah" id="kondisi_rumah" required>
                                                        <option value="">Pilih Kondisi Rumah</option>
                                                        <option value="Batu Permanen"
                                                            {{ old('kondisi_rumah', $dataset->kondisi_rumah) == 'Batu Permanen' ? 'selected' : '' }}>
                                                            Batu Permanen</option>
                                                        <option value="Bambu Anyam"
                                                            {{ old('kondisi_rumah', $dataset->kondisi_rumah) == 'Bambu Anyam' ? 'selected' : '' }}>
                                                            Bambu Anyam</option>
                                                        <option value="Papan"
                                                            {{ old('kondisi_rumah', $dataset->kondisi_rumah) == 'Papan' ? 'selected' : '' }}>
                                                            Papan</option>
                                                    </select>
                                                    @error('kondisi_rumah')
                                                        <div class="invalid-feedback">
                                                            {{ $message }}
                                                        </div>
                                                    @enderror
                                                </div>

                                                <div class="mb-3">
                                                    <label for="jml_penghasilan" class="form-label">Jumlah
                                                        Penghasilan</label>
                                                    <input type="number"
                                                        class="form-control @error('jml_penghasilan') is-invalid @enderror"
                                                        name="jml_penghasilan" id="jml_penghasilan"
                                                        value="{{ old('jml_penghasilan', $dataset->jml_penghasilan) }}"
                                                        required>
                                                    @error('jml_penghasilan')
                                                        <div class="invalid-feedback">
                                                            {{ $message }}
                                                        </div>
                                                    @enderror
                                                </div>

                                                <div class="mb-3">
                                                    <label for="status_rumah" class="form-label">Status Rumah</label>
                                                    <select
                                                        class="form-control @error('status_rumah') is-invalid @enderror"
                                                        name="status_rumah" id="status_rumah" required>
                                                        <option value="">Pilih Status Rumah</option>
                                                        <option value="Milik Sendiri"
                                                            {{ old('status_rumah', $dataset->status_rumah) == 'Milik Sendiri' ? 'selected' : '' }}>
                                                            Milik Sendiri</option>
                                                        <option value="Sewa"
                                                            {{ old('status_rumah', $dataset->status_rumah) == 'Sewa' ? 'selected' : '' }}>
                                                            Sewa</option>
                                                    </select>
                                                    @error('status_rumah')
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
                                                        <option value="Layak"
                                                            {{ old('label', $dataset->label) == 'Layak' ? 'selected' : '' }}>
                                                            Layak
                                                        </option>
                                                        <option value="Tidak Layak"
                                                            {{ old('label', $dataset->label) == 'Tidak Layak' ? 'selected' : '' }}>
                                                            Tidak Layak</option>
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
                <label for="pkh" class="form-label">PKH</label>
                <select class="form-control @error('pkh') is-invalid @enderror" name="pkh" id="pkh" required>
                    <option value="">Pilih PKH</option>
                    <option value="PKH">PKH</option>
                    <option value="Non-PKH">Non-PKH</option>
                </select>
                @error('pkh')
                    <div class="invalid-feedback">
                        {{ $message }}
                    </div>
                @enderror
            </div>
            <div class="mb-3">
                <label for="jml_tanggungan" class="form-label">Jumlah Tanggungan</label>
                <input type="number" class="form-control @error('jml_tanggungan') is-invalid @enderror"
                    name="jml_tanggungan" id="jml_tanggungan" required>
                @error('jml_tanggungan')
                    <div class="invalid-feedback">
                        {{ $message }}
                    </div>
                @enderror
            </div>
            <div class="mb-3">
                <label for="kepala_rt" class="form-label">Kepala Rumah Tangga</label>
                <select class="form-control @error('kepala_rt') is-invalid @enderror" name="kepala_rt" id="kepala_rt"
                    required>
                    <option value="">Pilih Jenis Kelamin Kepala Rumah Tangga</option>
                    <option value="Laki-Laki">Laki-Laki</option>
                    <option value="Perempuan">Perempuan</option>
                </select>
                @error('kepala_rt')
                    <div class="invalid-feedback">
                        {{ $message }}
                    </div>
                @enderror
            </div>
            <div class="mb-3">
                <label for="kondisi_rumah" class="form-label">Kondisi Rumah</label>
                <select class="form-control @error('kondisi_rumah') is-invalid @enderror" name="kondisi_rumah"
                    id="kondisi_rumah" required>
                    <option value="">Pilih Kondisi Rumah</option>
                    <option value="Batu Permanen">Batu Permanen</option>
                    <option value="Bambu Anyam">Bambu Anyam</option>
                    <option value="Papan">Papan</option>
                </select>
                @error('kepala_rt')
                    <div class="invalid-feedback">
                        {{ $message }}
                    </div>
                @enderror
            </div>
            <div class="mb-3">
                <label for="jml_penghasilan" class="form-label">Jumlah Penghasilan</label>
                <input type="number" class="form-control @error('jml_penghasilan') is-invalid @enderror"
                    name="jml_penghasilan" id="jml_penghasilan" required>
                @error('jml_penghasilan')
                    <div class="invalid-feedback">
                        {{ $message }}
                    </div>
                @enderror
            </div>
            <div class="mb-3">
                <label for="status_rumah" class="form-label">Status Rumah</label>
                <select class="form-control @error('status_rumah') is-invalid @enderror" name="status_rumah"
                    id="status_rumah" required>
                    <option value="">Pilih Status Rumah</option>
                    <option value="Milik Sendiri">Milik Sendiri</option>
                    <option value="Sewa">Sewa</option>
                </select>
                @error('status_rumah')
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
                    <option value="Layak">Layak</option>
                    <option value="Tidak Layak">Tidak Layak</option>
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
