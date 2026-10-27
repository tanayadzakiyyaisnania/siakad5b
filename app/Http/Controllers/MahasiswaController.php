<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class MahasiswaController extends Controller
{
    public function index()
    {
        $kolom = [
            'nim' => 'NIM', 'nama' => 'Nama Lengkap',
            'angkatan' => 'Angkatan', 'email' => 'Email',
            'status' => 'Status',
        ];

        $mahasiswa = [
            ['nim' => '241001', 'nama' => 'Ahmad Fauzi', 'angkatan' => 2024,
            'email'=> 'ahmad.fauzi@contoh.ac.id', 'status' => 'Aktif'],
            ['nim' => '241002', 'nama' => 'Siti Rahmawati', 'angkatan' => 2024,
            'email'=> 'siti.rahmawati@contoh.ac.id', 'status' => 'Aktif'],
            ['nim' => '241005', 'nama' => 'Budi Santoso', 'angkatan' => 2023,
            'email'=> 'budi.santoso@contoh.ac.id', 'status' => 'Aktif'],
            ['nim' => '241012', 'nama' => 'Dewi Lestari', 'angkatan' => 2023,
            'email'=> 'dewi.lestari@contoh.ac.id', 'status' => 'Cuti'],
            ['nim' => '241020', 'nama' => 'Rizky Pratama', 'angkatan' => 2022,
            'email'=> 'rizky.pratama@contoh.ac.id', 'status' => 'Drop Out'],
        ];

        return view('mahasiswa.index', compact('kolom', 'mahasiswa'));
    }
}
