<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Settings;

class SettingsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run()
    {
        Settings::create([
            'max_site' => 10,
            'destination_directory' => 'C:/laragon/www/wsi/wsi-sites',
        ]);
    }
}
