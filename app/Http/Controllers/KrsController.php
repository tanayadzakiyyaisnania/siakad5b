<?php

namespace App\Http\Controllers;

use App\Models\Krs;
use App\Models\Mahasiswa;
use App\Models\MataKuliah;
use App\Exports\KrsExport;
use Maatwebsite\Excel\Facades\Excel;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\Rule;
use Illuminate\View\View;
use Yajra\DataTables\Facades\DataTables;

class KrsController extends Controller
{
    public function index(): View
    {
        return view('krs.index');
    }

    public function exportExcel()
    {
        return Excel::download(
            new KrsExport,
            'data-krs.xlsx'
        );
    }
    public function exportPdf()
    {
        $krs = Krs::with(['mahasiswa', 'matakuliah'])->get();

        $pdf = Pdf::loadView('krs.export-pdf', compact('krs'))
            ->setPaper('a4', 'landscape');

        return $pdf->download('data-krs.pdf');
    }

    public function data(): JsonResponse
    {
        $query = Krs::with(['mahasiswa', 'matakuliah'])
            ->select('krs.*');

        return DataTables::eloquent($query)
            ->addIndexColumn()
            ->addColumn('nim', function ($krs) {
                return $krs->mahasiswa->nim;
            })
            ->addColumn('nama', function ($krs) {
                return $krs->mahasiswa->nama;
            })
            ->addColumn('total_sks', function ($krs) {
                return $krs->matakuliah->sum('sks');
            })
            ->editColumn('status', function ($krs) {
                return ucfirst($krs->status);
            })
            ->addColumn('aksi', function ($krs) {
                return view('krs._aksi', compact('krs'))->render();
            })
            ->rawColumns(['aksi'])
            ->make(true);
    }

    public function create(): View
    {
        $krs = new Krs();
        $mahasiswa = Mahasiswa::orderBy('nama')->get();
        $matakuliah = MataKuliah::orderBy('kode_mk')->get();

        return view('krs.create', compact(
            'krs',
            'mahasiswa',
            'matakuliah'
        ));
    }

    public function store(Request $request): RedirectResponse
    {
        $validated = $this->validated($request);

        DB::transaction(function () use ($validated) {
            $krs = Krs::create([
                'mahasiswa_id' => $validated['mahasiswa_id'],
                'tahun_akademik' => $validated['tahun_akademik'],
                'semester' => $validated['semester'],
                'status' => $validated['status'],
            ]);

            $krs->matakuliah()->sync($validated['mata_kuliah_id']);
        });

        return redirect()
            ->route('krs.index')
            ->with('success', 'KRS berhasil ditambahkan.');
    }

    public function show(string $id): View
    {
        $krs = Krs::with(['mahasiswa', 'matakuliah'])->findOrFail($id);

        return view('krs.show', compact('krs'));
    }

    public function edit(string $id): View
    {
        $krs = Krs::with('matakuliah')->findOrFail($id);
        $mahasiswa = Mahasiswa::orderBy('nama')->get();
        $matakuliah = MataKuliah::orderBy('kode_mk')->get();

        return view('krs.edit', compact(
            'krs',
            'mahasiswa',
            'matakuliah'
        ));
    }

    public function update(Request $request, string $id): RedirectResponse
    {
        $krs = Krs::findOrFail($id);
        $validated = $this->validated($request, $krs);

        DB::transaction(function () use ($krs, $validated) {
            $krs->update([
                'mahasiswa_id' => $validated['mahasiswa_id'],
                'tahun_akademik' => $validated['tahun_akademik'],
                'semester' => $validated['semester'],
                'status' => $validated['status'],
            ]);

            $krs->matakuliah()->sync($validated['mata_kuliah_id']);
        });

        return redirect()
            ->route('krs.index')
            ->with('success', 'KRS berhasil diperbarui.');
    }

    public function destroy(string $id): JsonResponse
    {
        $krs = Krs::findOrFail($id);
        $krs->delete();

        return response()->json([
            'message' => 'KRS berhasil dihapus.'
        ]);
    }

    private function validated(Request $request, ?Krs $krs = null): array
    {
        return $request->validate([
            'mahasiswa_id' => [
                'required',
                'exists:mahasiswa,id',
                Rule::unique('krs')
                    ->where(fn ($query) => $query
                        ->where('mahasiswa_id', $request->mahasiswa_id)
                        ->where('tahun_akademik', $request->tahun_akademik)
                        ->where('semester', $request->semester))
                    ->ignore($krs?->id),
            ],
            'tahun_akademik' => [
                'required',
                'string',
                'size:9',
                'regex:/^\d{4}\/\d{4}$/',
            ],
            'semester' => [
                'required',
                Rule::in(['Ganjil', 'Genap']),
            ],
            'status' => [
                'required',
                Rule::in(['draft', 'diajukan', 'disetujui', 'ditolak']),
            ],
            'mata_kuliah_id' => [
                'required',
                'array',
                'min:1',
            ],
            'mata_kuliah_id.*' => [
                'required',
                'integer',
                'distinct',
                'exists:mata_kuliah,id',
            ],
        ], [
            'mahasiswa_id.required' => 'Mahasiswa wajib dipilih.',
            'mahasiswa_id.exists' => 'Mahasiswa tidak ditemukan.',
            'mahasiswa_id.unique' => 'Mahasiswa sudah memiliki KRS untuk tahun akademik dan semester tersebut.',
            'tahun_akademik.required' => 'Tahun akademik wajib diisi.',
            'tahun_akademik.size' => 'Tahun akademik harus berformat 2026/2027.',
            'tahun_akademik.regex' => 'Format tahun akademik tidak valid. Contoh: 2026/2027.',
            'semester.required' => 'Semester wajib dipilih.',
            'semester.in' => 'Semester tidak valid.',
            'status.required' => 'Status wajib dipilih.',
            'status.in' => 'Status tidak valid.',
            'mata_kuliah_id.required' => 'Mata kuliah wajib dipilih.',
            'mata_kuliah_id.min' => 'Pilih minimal satu mata kuliah.',
            'mata_kuliah_id.*.exists' => 'Mata kuliah yang dipilih tidak ditemukan.',
            'mata_kuliah_id.*.distinct' => 'Mata kuliah tidak boleh dipilih lebih dari satu kali.',
        ]);
    }
}