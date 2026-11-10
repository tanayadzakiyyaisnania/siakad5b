@extends('layouts.app')

@section('title', 'Ubah KRS')

@section('content')
    <x-page-header judul="Ubah KRS"
                   deskripsi="Form untuk memperbarui data KRS mahasiswa." />

    <div class="card border-0 shadow-sm">
        <div class="card-body">
            <form action="{{ route('krs.update', $krs->id) }}" method="POST" novalidate>
                @csrf
                @method('PUT')

                @include('krs._form')

                <div class="mt-3">
                    <button type="submit" class="btn btn-primary">
                        <i class="bi bi-save"></i> Perbarui
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