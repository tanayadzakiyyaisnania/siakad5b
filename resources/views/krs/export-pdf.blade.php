<!DOCTYPE html>
<html>
<head>
    <title>Data KRS</title>
    <style>
        body {
            font-family: sans-serif;
            font-size: 11px;
        }
        h2 {
            text-align: center;
            margin-bottom: 5px;
        }
        p {
            text-align: center;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #333;
            padding: 6px;
            text-align: left;
        }
        th {
            background-color: #aadbff;
        }
    </style>
</head>
<body>
    <h2>DATA KARTU RENCANA STUDI (KRS)</h2>
    <p>Program Studi D3 Teknik Informatika</p>

    <table>
        <thead>
            <tr>
                <th>No.</th>
                <th>NIM</th>
                <th>Nama Mahasiswa</th>
                <th>Tahun Akademik</th>
                <th>Semester</th>
                <th>Mata Kuliah</th>
                <th>Total SKS</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($krs as $item)
                <tr>
                    <td>{{ $loop->iteration }}</td>
                    <td>{{ $item->mahasiswa->nim }}</td>
                    <td>{{ $item->mahasiswa->nama }}</td>
                    <td>{{ $item->tahun_akademik }}</td>
                    <td>{{ $item->semester }}</td>
                    <td>{{ $item->matakuliah->pluck('nama_mk')->implode(', ') }}</td>
                    <td>{{ $item->matakuliah->sum('sks') }}</td>
                    <td>{{ ucfirst($item->status) }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
</body>
</html>