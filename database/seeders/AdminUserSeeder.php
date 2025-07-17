<?php
namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class AdminUserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        User::updateOrCreate(
            ['email' => 'admin@ggtc.world'],
            [
                'first_name' => 'GGTC',
                'last_name'  => 'Admin',
                'username'   => 'ggtc-admin',
                'role_id'    => 1,
                'password'   => Hash::make('ggtc@2024#!'),
            ]
        );

    }
}
