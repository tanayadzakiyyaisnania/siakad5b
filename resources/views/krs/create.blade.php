@extends('layouts.app')

@section('title', 'Tambah KRS')

@section('content')
    <x-page-header judul="Tambah KRS"
                   deskripsi="Form untuk menambahkan KRS mahasiswa." />

    <div class="card border-0 shadow-sm">
        <div class="card-body">
            <form action="{{ route('krs.store') }}" method="POST" novalidate>
                @csrf

                @include('krs._form')

                <div class="mt-3">
                    <button type="submit" class="btn btn-primary">
                        <i class="bi bi-save"></i> Simpan
                    </button>
                    <a href="{{ route('krs.index') }}" 
                        class="btn btn-outline-secondary">
                            Batal
                    </a>
                </div>
            </form>
        </div>
    </div>
@endsection