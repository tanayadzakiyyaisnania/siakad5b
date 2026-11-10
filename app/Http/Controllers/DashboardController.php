<?php

namespace App\Http\Controllers;

use App\Models\Mahasiswa;
use App\Models\MataKuliah;
use App\Models\Krs;
use App\Models\Dosen;

class DashboardController extends Controller
{
    public function index()
    {
        $kolomKrs = [
            'nim' => 'NIM',
            'nama' => 'Nama Mahasiswa',
            'sks' => 'SKS',
            'status' => 'Status',
        ];

        $krsTerbaru = Krs::with(['mahasiswa', 'matakuliah'])
            ->latest()
            ->take(5)
            ->get()
            ->map(function ($item) {
                return [
                    'nim' => $item->mahasiswa->nim,
                    'nama' => $item->mahasiswa->nama,
                    'sks' => $item->matakuliah->sum('sks'),
                    'status' => ucfirst($item->status),
                ];
            });

        $semuaKrs = Krs::with('matakuliah')->get();

        $rataRataSks = $semuaKrs->count() > 0
            ? round($semuaKrs->avg(
                fn ($item) => $item->matakuliah->sum('sks')
            ), 1)
            : 0;

        $statistik = [
        [
            'judul' => 'Mahasiswa',
            'jumlah' => Mahasiswa::count(),
            'ikon' => 'bi-mortarboard-fill',
            'warna' => 'primary'
        ],
        [
            'judul' => 'Dosen',
            'jumlah' => Dosen::count(),
            'ikon' => 'bi-person-badge-fill',
            'warna' => 'success'
        ],
        [
            'judul' => 'Mata Kuliah',
            'jumlah' => MataKuliah::count(),
            'ikon' => 'bi-book-fill',
            'warna' => 'warning'
        ],
        [
            'judul' => 'KRS',
            'jumlah' => Krs::count(),
            'ikon' => 'bi-journal-check',
            'warna' => 'info'
        ],
        [
            'judul' => 'Rata-rata SKS per KRS',
            'jumlah' => $rataRataSks,
            'ikon' => 'bi-calculator-fill',
            'warna' => 'secondary'
        ],
    ];

        $statusKrs = [
            [
                'label' => 'Draft',
                'jumlah' => Krs::where('status', 'draft')->count(),
                'warna' => 'secondary'
            ],
            [
                'label' => 'Diajukan',
                'jumlah' => Krs::where('status', 'diajukan')->count(),
                'warna' => 'warning'
            ],
            [
                'label' => 'Disetujui',
                'jumlah' => Krs::where('status', 'disetujui')->count(),
                'warna' => 'success'
            ],
            [
                'label' => 'Ditolak',
                'jumlah' => Krs::where('status', 'ditolak')->count(),
                'warna' => 'danger'
            ],
        ];

        return view('dashboard', compact (
            'statistik', 'kolomKrs', 'krsTerbaru', 'statusKrs'
        ));
    }
}