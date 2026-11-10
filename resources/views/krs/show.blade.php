@extends('layouts.app')

@section('title', 'Detail KRS')

@section('content')
    <x-page-header judul="Detail KRS"
                   deskripsi="Informasi lengkap Kartu Rencana Studi mahasiswa." />

    <div class="card border-0 shadow-sm">
        <div class="card-body">
            <dl class="row">
                <dt class="col-sm-3">NIM</dt>
                <dd class="col-sm-9">{{ $krs->mahasiswa->nim ?: '-' }}</dd>

                <dt class="col-sm-3">Nama Mahasiswa</dt>
                <dd class="col-sm-9">{{ $krs->mahasiswa->nama ?: '-' }}</dd>

                <dt class="col-sm-3">Tahun Akademik</dt>
                <dd class="col-sm-9">{{ $krs->tahun_akademik ?: '-' }}</dd>

                <dt class="col-sm-3">Semester</dt>
                <dd class="col-sm-9">{{ $krs->semester ?: '-' }}</dd>

                <dt class="col-sm-3">Status</dt>
                <dd class="col-sm-9">{{ ucfirst($krs->status) }}</dd>

                <dt class="col-sm-3">Total SKS</dt>
                <dd class="col-sm-9">{{ $krs->matakuliah->sum('sks') }} SKS</dd>
            </dl>

            <h6 class="fw-semibold mt-4">Daftar Mata Kuliah</h6>

            <div class="table-responsive">
                <table class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Kode Mata Kuliah</th>
                            <th>Nama Mata Kuliah</th>
                            <th>SKS</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse ($krs->matakuliah as $index => $item)
                            <tr>
                                <td>{{ $index + 1 }}</td>
                                <td>{{ $item->kode_mk }}</td>
                                <td>{{ $item->nama_mk }}</td>
                                <td>{{ $item->sks }}</td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="4" class="text-center">
                                    Belum ada mata kuliah.
                                </td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>

            <a href="{{ route('krs.index') }}"
               class="btn btn-outline-secondary">
                <i class="bi bi-arrow-left"></i> Kembali
            </a>

            @if (Auth::user()->role === 'admin')
                <a href="{{ route('krs.edit', $krs->id) }}"
                   class="btn btn-warning">
                    <i class="bi bi-pencil-square"></i> Ubah
                </a>
            @endif
        </div>
    </div>
@endsection
