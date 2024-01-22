<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Module;

class ModuleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $moduleNames = [
            "Dashboard",
            "Pages",
            "Banners",
            "Files",
            "Menu",
            "News",
            "Settings",
            "Users",
            "Account Management",
            "Members",
            "Careers",
        ];

        foreach ($moduleNames as $moduleName) {
            Module::create(["name" => $moduleName]);
        }
    }
}
