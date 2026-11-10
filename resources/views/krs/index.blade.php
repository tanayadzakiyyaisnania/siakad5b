@extends('layouts.app')

@section('title', 'Kartu Rencana Studi')

@section('content')
    <x-page-header judul="Kartu Rencana Studi"
               deskripsi="Daftar KRS mahasiswa.">
        @if (Auth::user()->role === 'admin')
            <a href="{{ route('krs.exportExcel') }}" class="btn btn-success">
                <i class="bi bi-file-earmark-excel"></i> Export Excel
            </a>

            <a href="{{ route('krs.exportPdf') }}" class="btn btn-danger">
                <i class="bi bi-file-earmark-pdf"></i> Export PDF
            </a>

            <a href="{{ route('krs.create') }}" class="btn btn-primary">
                <i class="bi bi-plus-lg"></i> Tambah KRS
            </a>
        @endif
    </x-page-header>

    <div class="card border-0 shadow-sm">
        <div class="card-header bg-body fw-semibold">
            Daftar KRS
        </div>

        <div class="card-body">
            <div class="table-responsive">
                <table id="tabelKrs"
                    class="table table-striped table-hover align-middle w-100">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>NIM</th>
                            <th>Nama Mahasiswa</th>
                            <th>Tahun Akademik</th>
                            <th>Semester</th>
                            <th>Total SKS</th>
                            <th>Status</th>
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
        let tabel = $('#tabelKrs').DataTable({
            processing: true,
            serverSide: true,
            ajax: @json(route('krs.data', [], false)),
            columns: [
                {
                    data: 'DT_RowIndex',
                    name: 'DT_RowIndex',
                    orderable: false,
                    searchable: false
                },
                { data: 'nim', name: 'mahasiswa.nim' },
                { data: 'nama', name: 'mahasiswa.nama' },
                { data: 'tahun_akademik', name: 'tahun_akademik' },
                { data: 'semester', name: 'semester' },
                {
                    data: 'total_sks',
                    name: 'total_sks',
                    orderable: false,
                    searchable: false
                },
                { data: 'status', name: 'status' },
                {
                    data: 'aksi',
                    name: 'aksi',
                    className: 'text-nowrap',
                    orderable: false,
                    searchable: false
                }
            ],
            order: [[3, 'desc']],
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

        $('#tabelKrs').on('click', '.btn-hapus', function () {
            const id = this.dataset.id;

            Swal.fire({
                title: 'Hapus data KRS?',
                text: 'Data KRS ini akan dihapus permanen.',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Ya, hapus',
                cancelButtonText: 'Batal',
                confirmButtonColor: '#dc3545',
            }).then(function (hasil) {
                if (!hasil.isConfirmed) return;

                $.ajax({
                    url: '/krs/' + id,
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