<?php

namespace App\Http\Controllers;

use App\Models\MataKuliah;
use Illuminate\Database\QueryException;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Validation\Rule;
use Illuminate\View\View;
use Yajra\DataTables\Facades\DataTables;

class MataKuliahController extends Controller
{
    public function index(): View
    {
        return view('matakuliah.index');
    }
    public function data(): JsonResponse
    {
        $query = MataKuliah::query()->select([
            'id',
            'kode_mk',
            'nama_mk',
            'sks',
        ]);

        return DataTables::eloquent($query)
            ->addIndexColumn()
            ->addColumn('aksi', function ($matakuliah) {
                return view('matakuliah._aksi', compact('matakuliah'))->render();
            })
            ->rawColumns(['aksi'])
            ->toJson();
    }
    public function create(): View
    {
        $matakuliah = new MataKuliah();

        return view('matakuliah.create', compact('matakuliah'));
    }
    public function store(Request $request): RedirectResponse
    {
        $validated = $this->validated($request);

        MataKuliah::create($validated);

        return redirect()
            ->route('matakuliah.index')
            ->with('success', 'Data mata kuliah berhasil ditambahkan.');
    }
    public function show(int $id): View
    {
        $matakuliah = MataKuliah::findOrFail($id);

        return view('matakuliah.show', compact('matakuliah'));
    }
    public function edit(int $id): View
    {
        $matakuliah = MataKuliah::findOrFail($id);

        return view('matakuliah.edit', compact('matakuliah'));
    }
    public function update(Request $request, int $id): RedirectResponse
    {
        $matakuliah = MataKuliah::findOrFail($id);

        $validated = $this->validated($request, $matakuliah);

        $matakuliah->update($validated);

        return redirect()
            ->route('matakuliah.index')
            ->with('success', 'Data mata kuliah berhasil diperbarui.');
    }
    public function destroy(int $id): JsonResponse
    {
        $matakuliah = MataKuliah::findOrFail($id);

        try {
            $matakuliah->delete();
        } catch (QueryException $e) {
            return response()->json([
                'message' => 'Mata kuliah tidak dapat dihapus karena masih digunakan dalam KRS.',
            ], 409);
        }

        return response()->json([
            'success' => true,
            'message' => 'Data mata kuliah berhasil dihapus.',
        ]);
    }
    
    private function validated(Request $request, ?MataKuliah $matakuliah = null): array
    {
        return $request->validate([
            'kode_mk' => [
                'required',
                'string',
                'max:10',
                Rule::unique('mata_kuliah', 'kode_mk')->ignore($matakuliah?->id),
            ],
            'nama_mk' => ['required', 'string', 'max:100'],
            'sks' => ['required', 'integer', 'min:1', 'max:6'],
        ], [
            'kode_mk.required' => 'Kode mata kuliah wajib diisi.',
            'kode_mk.unique' => 'Kode mata kuliah sudah terdaftar.',
            'kode_mk.max' => 'Kode mata kuliah maksimal 10 karakter.',
            'nama_mk.required' => 'Nama mata kuliah wajib diisi.',
            'nama_mk.max' => 'Nama mata kuliah maksimal 100 karakter.',
            'sks.required' => 'Jumlah SKS wajib diisi.',
            'sks.integer' => 'Jumlah SKS harus berupa angka.',
            'sks.min' => 'Jumlah SKS minimal 1.',
            'sks.max' => 'Jumlah SKS maksimal 6.',
        ]);
    }
}