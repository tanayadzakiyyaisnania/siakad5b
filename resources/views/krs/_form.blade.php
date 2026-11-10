@php
    $mataKuliahTerpilih = old(
        'mata_kuliah_id',
        isset($krs) ? $krs->matakuliah->pluck('id')->all() : []
    );
@endphp

<div class="row g-3">
    <div class="col-md-6">
        <label for="mahasiswa_id" class="form-label">Mahasiswa</label>
        <select name="mahasiswa_id" id="mahasiswa_id"
                class="form-select @error('mahasiswa_id') is-invalid @enderror">
            <option value="">-- Pilih Mahasiswa --</option>
            @foreach ($mahasiswa as $item)
                <option value="{{ $item->id }}"
                    @selected(old('mahasiswa_id', $krs->mahasiswa_id ?? '') == $item->id)>
                    {{ $item->nim }} - {{ $item->nama }}
                </option>
            @endforeach
        </select>
        @error('mahasiswa_id')
            <div class="invalid-feedback">{{ $message }}</div>
        @enderror
    </div>

    <div class="col-md-6">
        <label for="tahun_akademik" class="form-label">Tahun Akademik</label>
        <input type="text" name="tahun_akademik" id="tahun_akademik"
               class="form-control @error('tahun_akademik') is-invalid @enderror"
               value="{{ old('tahun_akademik', $krs->tahun_akademik ?? '') }}"
               placeholder="Contoh: 2026/2027" maxlength="9">
        @error('tahun_akademik')
            <div class="invalid-feedback">{{ $message }}</div>
        @enderror
    </div>

    <div class="col-md-6">
        <label for="semester" class="form-label">Semester</label>
        <select name="semester" id="semester"
                class="form-select @error('semester') is-invalid @enderror">
            <option value="">-- Pilih Semester --</option>
            @foreach (['Ganjil', 'Genap'] as $semester)
                <option value="{{ $semester }}"
                    @selected(old('semester', $krs->semester ?? '') == $semester)>
                    {{ $semester }}
                </option>
            @endforeach
        </select>
        @error('semester')
            <div class="invalid-feedback">{{ $message }}</div>
        @enderror
    </div>

    <div class="col-md-6">
        <label for="status" class="form-label">Status</label>
        <select name="status" id="status"
                class="form-select @error('status') is-invalid @enderror">
            @foreach (['draft', 'diajukan', 'disetujui', 'ditolak'] as $status)
                <option value="{{ $status }}"
                    @selected(old('status', $krs->status ?? 'draft') == $status)>
                    {{ ucfirst($status) }}
                </option>
            @endforeach
        </select>
        @error('status')
            <div class="invalid-feedback">{{ $message }}</div>
        @enderror
    </div>

    <div class="col-12">
        <label class="form-label">Mata Kuliah</label>
        <div class="border rounded p-3">
            @foreach ($matakuliah as $item)
                <div class="form-check mb-2">
                    <input class="form-check-input" type="checkbox"
                           name="mata_kuliah_id[]"
                           value="{{ $item->id }}"
                           id="mk{{ $item->id }}"
                           @checked(in_array($item->id, $mataKuliahTerpilih))>
                    <label class="form-check-label" for="mk{{ $item->id }}">
                        {{ $item->kode_mk }} - {{ $item->nama_mk }}
                        ({{ $item->sks }} SKS)
                    </label>
                </div>
            @endforeach
        </div>
        @error('mata_kuliah_id')
            <div class="text-danger small mt-1">{{ $message }}</div>
        @enderror
        @error('mata_kuliah_id.*')
            <div class="text-danger small mt-1">{{ $message }}</div>
        @enderror
    </div>
</div>