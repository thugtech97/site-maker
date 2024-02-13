<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        $this->call(ModuleSeeder::class);
        $this->call(WebsiteSeeder::class);
        $this->call(SettingsSeeder::class);
        $this->call(SubmodulesSeeder::class);
    }
}
