<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;

class UserSeeder extends Seeder
{
    public function run(): void
    {
        User::updateOrCreate(
            ['email' => 'dosen@siakad.test'],
            [
                'name' => 'Dosen SIAKAD',
                'password' => 'dosen123',
                'role' => 'dosen',
            ]
        );

        User::updateOrCreate(
            ['email' => 'mahasiswa@siakad.test'],
            [
                'name' => 'Mahasiswa SIAKAD',
                'password' => 'mahasiswa123',
                'role' => 'mahasiswa',
            ]
        );
    }
}