<?php

use App\Http\Controllers\PenggunaController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\BerandaController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\DosenController;
use App\Http\Controllers\KrsController;
use App\Http\Controllers\MahasiswaController;
use App\Http\Controllers\MataKuliahController;
use Illuminate\Support\Facades\Route;

// Halaman tamu: hanya dapat diakses sebelum login
Route::middleware('guest')->group(function () {
    Route::get('/login', [LoginController::class, 'showLoginForm'])->name('login');
    Route::post('/login', [LoginController::class, 'authenticate'])->name('login.attempt');
});

// Halaman internal: hanya dapat diakses setelah login
Route::middleware(['auth', 'no-store'])->group(function () {
    
    // Hanya admin
    Route::get('/pengguna', [PenggunaController::class, 'index'])
        ->middleware('role:admin')
        ->name('pengguna.index');

    // Halaman awal diarahkan ke dashboard
    Route::get('/', fn () => redirect()->route('dashboard'));

    // Logout
    Route::post('/logout', [LoginController::class, 'logout'])->name('logout');

    // Dashboard
    Route::get('/dashboard', [DashboardController::class, 'index'])
        ->name('dashboard');

    // Mahasiswa
    Route::get('/mahasiswa', [MahasiswaController::class, 'index'])
        ->name('mahasiswa.index');

    Route::get('/mahasiswa/{nim}', [MahasiswaController::class, 'show'])
        ->name('mahasiswa.show');

    // Dosen

    // 1) Endpoint JSON DataTables: Harus di atas route yang memuat {dosen}
    Route::get('/dosen/data', [DosenController::class, 'data']) ->name('dosen.data');
    
    // 2) Tambah, ubah, hapus: khusu admin (role berjalan SETELAH auth)
    Route::middleware('role:admin')->group(function () {
        Route::resource('dosen', DosenController::class)
            ->except(['index','show']);
    });

    // 3) Daftar dan detail: semua pengguna yang sudah login
    Route::resource('dosen', DosenController::class) 
        ->only(['index', 'show']);

    // Mata Kuliah
    Route::get('/mata-kuliah', [MataKuliahController::class, 'index'])
        ->name('matakuliah.index');

    // KRS
    Route::get('/krs', [KrsController::class, 'index'])
        ->name('krs.index');

    // Beranda dari Jobsheet 07
    Route::get('/beranda', [BerandaController::class, 'index'])
        ->name('beranda');

    // Route tambahan dari proyek sebelumnya
    Route::get('/home', function () {
        return view('home');
    });

    Route::get('/uji-tabel', function () {
        return view('uji-tabel');
    });
});