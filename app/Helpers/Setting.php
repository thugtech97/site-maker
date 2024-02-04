<?php

namespace App\Helpers;
/*
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
*/
use App\Models\Settings;

class Setting {

    public static function logo() {
        return null;
	}

	public static function getMaxSite() {
       $setting = Settings::first();
       return $setting->max_site;
    }

    public static function getDestinationDirectory() {
        $setting = Settings::first();
        return $setting->destination_directory;
    }

}
