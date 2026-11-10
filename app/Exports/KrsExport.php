<?php

namespace App\Exports;

use App\Models\Krs;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;

class KrsExport implements FromCollection, WithHeadings, WithMapping
{
    public function collection(): Collection
    {
        return Krs::with(['mahasiswa', 'matakuliah'])->get();
    }
    public function headings(): array
    {
        return [
            'No.',
            'NIM',
            'Nama Mahasiswa',
            'Tahun Akademik',
            'Semester',
            'Mata Kuliah',
            'Total SKS',
            'Status',
        ];
    }
    public function map($krs): array
    {
        return [
            $krs->id,
            $krs->mahasiswa->nim,
            $krs->mahasiswa->nama,
            $krs->tahun_akademik,
            $krs->semester,
            $krs->matakuliah->pluck('nama_mk')->implode(', '),
            $krs->matakuliah->sum('sks'),
            ucfirst($krs->status),
        ];
    }
}