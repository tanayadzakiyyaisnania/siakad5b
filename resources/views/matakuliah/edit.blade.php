@extends('layouts.app')

@section('title', 'Edit Mata Kuliah')

@section('content')
    <x-page-header judul="Edit Mata Kuliah"
                   deskripsi="Ubah data mata kuliah." />

    <div class="card border-0 shadow-sm">
        <div class="card-body">
            <form action="{{ route('matakuliah.update', $matakuliah->id) }}" method="POST" novalidate>
                @csrf
                @method('PUT')

                @include('matakuliah._form')

                <div class="mt-3">
                    <button type="submit" class="btn btn-primary">
                    <i class="bi bi-save"></i> Perbarui
                </button>

                <a href="{{ route('matakuliah.index') }}"
                   class="btn btn-outline-secondary">Batal</a>
                </div>
            </form>
        </div>
    </div>
@endsection