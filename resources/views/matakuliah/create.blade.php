@extends('layouts.app')

@section('title', 'Tambah Mata Kuliah')

@section('content')
    <x-page-header judul="Tambah Mata Kuliah"
                   deskripsi="Form tambah data mata kuliah." />

    <div class="card border-0 shadow-sm">
        <div class="card-body">
            <form action="{{ route('matakuliah.store') }}" method="POST" novalidate>
                @csrf

                @include('matakuliah._form')

                <div class="mt-3">
                    <button type="submit" class="btn btn-primary">
                        <i class="bi bi-save"></i> Simpan
                    </button>
                    <a href="{{ route('matakuliah.index') }}" 
                        class="btn btn-outline-secondary">
                        Batal
                    </a>
                </div>
            </form>
        </div>
    </div>
@endsection