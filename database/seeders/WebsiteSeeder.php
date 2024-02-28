<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Website;
use Faker\Factory as Faker;
use App\Models\Module;

class WebsiteSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run()
    {
        $faker = Faker::create();

        foreach (range(1, 3) as $index) {
            Website::create([
                'company' => $faker->company,
                'contact_person' => $faker->name,
                'contact_number' => $faker->phoneNumber,
                'website_name' => $faker->company,
                'project_type' => $faker->word,
                'url' => $faker->url,
                'theme' => $faker->randomElement(['theme1', 'theme2']), // Seed the enum column
                //'user_id' => User::inRandomOrder()->first()->id,
            ])->modules()->attach(Module::inRandomOrder()->limit(rand(1, 11))->pluck('id'));
        }
    }
}
