<?php

namespace App\Http\Controllers;

use App\Models\Mahasiswa;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Validation\Rule;
use Illuminate\View\View;
use Yajra\DataTables\Facades\DataTables;

class MahasiswaController extends Controller
{
    public function index(): View
    {
        return view('mahasiswa.index');
    }

    public function data(): JsonResponse
    {
        $query = Mahasiswa::query()->select([
            'id', 'nim', 'nama', 'jenis_kelamin',
            'email', 'angkatan', 'program_studi',
        ]);

        return DataTables::eloquent($query)
            ->addIndexColumn()
            ->addColumn('aksi', function ($mahasiswa) {
                return view('mahasiswa._aksi', compact('mahasiswa'))->render();
            })
            ->rawColumns(['aksi'])
            ->toJson();
    }

    public function create(): View
    {
        return view('mahasiswa.create', [
            'mahasiswa' => new Mahasiswa(),
        ]);
    }

    public function store(Request $request): RedirectResponse
    {
        $mahasiswa = Mahasiswa::create($this->validated($request));

        return redirect()
            ->route('mahasiswa.index')
            ->with('success', 'Data mahasiswa ' . $mahasiswa->nama . ' berhasil ditambahkan.');
    }

    public function show(string $nim): View
    {
        $mahasiswa = Mahasiswa::where('nim', $nim)->firstOrFail();

        return view('mahasiswa.show', compact('mahasiswa'));
    }

    public function edit(string $nim): View
    {
        $mahasiswa = Mahasiswa::where('nim', $nim)->firstOrFail();

        return view('mahasiswa.edit', compact('mahasiswa'));
    }

    public function update(Request $request, string $nim): RedirectResponse
    {
        $mahasiswa = Mahasiswa::where('nim', $nim)->firstOrFail();

        $mahasiswa->update($this->validated($request, $mahasiswa));

        return redirect()
            ->route('mahasiswa.index')
            ->with('success', 'Data mahasiswa ' . $mahasiswa->nama . ' berhasil diperbarui.');
    }

    public function destroy(string $nim): JsonResponse
    {
        $mahasiswa = Mahasiswa::where('nim', $nim)->firstOrFail();

        $mahasiswa->delete();

        return response()->json([
            'success' => true,
            'message' => 'Data mahasiswa ' . $mahasiswa->nama . ' berhasil dihapus.',
        ]);
    }

    private function validated(Request $request, ?Mahasiswa $mahasiswa = null): array
    {
        return $request->validate([
            'nim' => [
                'required', 'string', 'max:15',
                Rule::unique('mahasiswa', 'nim')->ignore($mahasiswa?->id),
            ],
            'nama' => ['required', 'string', 'max:100'],
            'jenis_kelamin' => ['required', Rule::in(['L', 'P'])],
            'email' => [
                'required', 'email', 'max:100',
                Rule::unique('mahasiswa', 'email')->ignore($mahasiswa?->id),
            ],
            'angkatan' => ['required', 'integer', 'min:2000', 'max:2100'],
            'program_studi' => ['required', 'string', 'max:100'],
        ], [
            'nim.required' => 'NIM wajib diisi.',
            'nim.max' => 'NIM maksimal 15 karakter.',
            'nim.unique' => 'NIM sudah digunakan mahasiswa lain.',
            'nama.required' => 'Nama mahasiswa wajib diisi.',
            'nama.max' => 'Nama mahasiswa maksimal 100 karakter.',
            'jenis_kelamin.required' => 'Jenis kelamin wajib dipilih.',
            'jenis_kelamin.in' => 'Jenis kelamin tidak valid.',
            'email.required' => 'Email wajib diisi.',
            'email.email' => 'Format email tidak valid.',
            'email.max' => 'Email maksimal 100 karakter.',
            'email.unique' => 'Email sudah digunakan mahasiswa lain.',
            'angkatan.required' => 'Angkatan wajib diisi.',
            'angkatan.integer' => 'Angkatan harus berupa angka.',
            'angkatan.min' => 'Angkatan minimal tahun 2000.',
            'angkatan.max' => 'Angkatan maksimal tahun 2100.',
            'program_studi.required' => 'Program studi wajib diisi.',
            'program_studi.max' => 'Program studi maksimal 100 karakter.',
        ]);
    }
}