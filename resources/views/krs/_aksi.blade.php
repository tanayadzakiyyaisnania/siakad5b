<div class="btn-group btn-group-sm" role="group">
    <a href="{{ route('krs.show', $krs->id) }}"
       class="btn btn-outline-info" title="Detail">
        <i class="bi bi-eye"></i>
    </a>

    @if (Auth::user()->role === 'admin')
        <a href="{{ route('krs.edit', $krs->id) }}"
           class="btn btn-outline-primary" title="Ubah">
            <i class="bi bi-pencil"></i>
        </a>

        <button type="button" class="btn btn-outline-danger btn-hapus"
                data-id="{{ $krs->id }}"
                title="Hapus">
            <i class="bi bi-trash"></i>
        </button>
    @endif
</div>