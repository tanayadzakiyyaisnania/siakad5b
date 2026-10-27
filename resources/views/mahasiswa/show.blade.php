@extends('layouts.app')

@section('content')
    <div class="container-fluid">
        <h4 class="mb-3">Detail Mahasiswa</h4>

        <div class="card">
            <div class="card-body">
                <p><strong>NIM:</strong> {{ $mahasiswa['nim']}} </p>
                <p><strong>Nama Lengkap:</strong> {{ $mahasiswa['nama']}} </p>
                <p><strong>Angkatan:</strong> {{ $mahasiswa['angkatan']}} </p>
                <p><strong>Email:</strong> {{ $mahasiswa['email']}} </p>
                <p><strong>Status:</strong> {{ $mahasiswa['status']}} </p>

                <a href="{{ route('mahasiswa.index') }}"
                    class="btn btn-secondary">
                        Kembali
                </a>
            </div>
        </div>
    </div>
@endsection