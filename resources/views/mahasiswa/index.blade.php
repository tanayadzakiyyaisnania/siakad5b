@extends('layouts.app')

@section('title', 'Data Mahasiswa')

@section('content')
    <x-page-header judul="Data Mahasiswa"
                   deskripsi="Daftar data mahasiswa yang tersimpan.">
        @if (Auth::user()->role === 'admin')
            <a href="{{ route('mahasiswa.create') }}" class="btn btn-primary">
                <i class="bi bi-plus-lg"></i> Tambah Mahasiswa
            </a>
        @endif
    </x-page-header>

    <div class="collapse mb-4" id="formMahasiswa">
        <div class="card border-0 shadow-sm">
            <div class="card-header bg-body fw-semibold">Form Mahasiswa</div>
            <div class="card-body">
                @include('mahasiswa._form')
            </div>
        </div>
    </div>

    <div class="card border-0 shadow-sm">
        <div class="card-header bg-body fw-semibold">
            Daftar Mahasiswa
        </div>

        <div class="card-body">
            <div class="table-responsive">
                <table id="tabelMahasiswa"
                    class="table table-striped table-hover align-middle w-100">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>NIM</th>
                            <th>Nama Lengkap</th>
                            <th>Jenis Kelamin</th>
                            <th>Email</th>
                            <th>Angkatan</th>
                            <th>Program Studi</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
@endsection
@push('styles')
    <link href="{{ asset('vendor/datatables/dataTables.bootstrap5.min.css') }}"
        rel="stylesheet">
@endpush
@push('scripts')
<script>
    $(function () {
        let tabel = $('#tabelMahasiswa').DataTable({
            processing: true,
            serverSide: true,
            ajax: @json(route('mahasiswa.data', [], false)),
            columns: [
                { data: 'DT_RowIndex', name: 'DT_RowIndex',
                    orderable: false, searchable: false },
                { data: 'nim', name: 'nim' },
                { data: 'nama', name: 'nama' },
                { data: 'jenis_kelamin', name: 'jenis_kelamin' },
                { data: 'email', name: 'email' },
                { data: 'angkatan', name: 'angkatan' },
                { data: 'program_studi', name: 'program_studi' },
                { data: 'aksi', name: 'aksi', className: 'text-nowrap',
                    orderable: false, searchable: false }
            ],
            order: [[2, 'asc']],
            language: {
                processing: 'Memuat data...',
                search: 'Cari:',
                lengthMenu: 'Tampilkan _MENU_ data',
                info: 'Menampilkan _START_ sampai _END_ dari _TOTAL_ data',
                infoEmpty: 'Tidak ada data',
                infoFiltered: '(disaring dari _MAX_ data)',
                zeroRecords: 'Data tidak ditemukan',
                paginate: {
                    first: 'Awal',
                    last: 'Akhir',
                    next: 'Berikutnya',
                    previous: 'Sebelumnya'
                }
            }
        });

        const csrfToken = @json(csrf_token());

        $('#tabelMahasiswa').on('click', '.btn-hapus', function () {
            const nim = this.dataset.nim;
            const nama = this.dataset.nama;

            Swal.fire({
                title: 'Hapus data mahasiswa?',
                text: 'Data ' + nama + ' akan dihapus permanen.',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Ya, hapus',
                cancelButtonText: 'Batal',
                confirmButtonColor: '#dc3545',
            }).then(function (hasil) {
                if (!hasil.isConfirmed) return;

                $.ajax({
                    url: '/mahasiswa/' + nim,
                    method: 'DELETE',
                    headers: {
                        'X-CSRF-TOKEN': csrfToken,
                        'Accept': 'application/json',
                    },
                }).done(function (respons) {
                    tabel.ajax.reload(null, false);
                    Swal.fire({
                        toast: true,
                        position: 'top-end',
                        icon: 'success',
                        title: 'Berhasil',
                        text: respons.message,
                        showConfirmButton: false,
                        timer: 3000,
                    });
                }).fail(function (xhr) {
                    const pesan = (xhr.responseJSON && xhr.responseJSON.message)
                        || 'Data tidak dapat dihapus.';

                    Swal.fire({
                        icon: 'error',
                        title: 'Gagal (' + xhr.status + ')',
                        text: pesan,
                    });
                });
            });
        });
    });
</script>
@endpush