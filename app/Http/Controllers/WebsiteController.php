<?php

namespace App\Http\Controllers;

use App\Models\Module;
use App\Models\Website;
use App\Models\Submodule;
use App\Helpers\Setting;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Helpers\ListingHelper;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Storage;
use App\Http\Requests\StoreWebsiteRequest;
use App\Http\Requests\UpdateWebsiteRequest;

class WebsiteController extends Controller {
    /**
     * Display a listing of the resource.
     */
    private $maxSite;
    private $destinationDirectory;

    public function __construct(){
        $this->maxSite = Setting::getMaxSite();
        $this->destinationDirectory = Setting::getDestinationDirectory();
    }

    public function index()
    {
        $websites = Website::orderBy('created_at', 'desc')->paginate(10);
        $availableSite = 0;

        for($i = 1; $i <= $this->maxSite; $i++){
            if(!File::exists($this->destinationDirectory.'/wsi-standards'.$i)) {
                $availableSite++;
            }
        }

        return view('website.index', compact('websites', 'availableSite'))->with('maxSite', $this->maxSite);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $modules = Module::all();
        return view('website.create', compact('modules'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreWebsiteRequest $request)
    {
        try{
            $websiteData = $request->except('logo');

            $website = Website::create($websiteData);
            $logoFile = $request->file('logo');
            $logoFileName = $logoFile->store('logos/'.$website->id, 'public');
            $website->update(['logo' => $logoFileName]);
            $website->modules()->sync($request->module_id);

            return redirect()->route('website.index')->with('success', 'New website has been added.');
        }catch(Exception $e){
            return redirect()->route('website.index')->with('error', $e->getMessage());
        }
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $website = Website::findOrFail($id);
        return view('website.view', compact('website'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        $website = Website::findOrFail($id);
        $modules = Module::all();
        return view('website.edit', compact('website','modules'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateWebsiteRequest $request, $id)
    {
        //var_dump($request->all());
        try{
            $website = Website::findOrFail($id);
            $website->update($request->all());
            $website->modules()->sync($request->module_id);
            return redirect()->route('website.index')->with('success', 'Website info has been updated.');
        }catch(Exception $e){
            return redirect()->route('website.index')->with('error', $e->getMessage());
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        try {
            $website = Website::findOrFail($id);
            $website->delete();
            return redirect()->route('website.index')->with('success', 'Website record has been deleted.');
        } catch (Exception $e) {
            return redirect()->route('website.index')->with('error', $e->getMessage());
        }
    }

    public function delete(Request $request)
    {
        try {
            $website = Website::findOrFail($request->website);
            $website->delete();
            return redirect()->route('website.index')->with('success', 'Website record has been deleted.');
        } catch (Exception $e) {
            return redirect()->route('website.index')->with('error', $e->getMessage());
        }
    }

    
    public function build(Request $request)
    {
        try{

            $website = Website::findOrFail($request->website);
            $websiteModules = $website->modules;     
            $submodules = Submodule::whereIn('module_id', $websiteModules->pluck('id'))
                ->join('modules', 'submodules.module_id', '=', 'modules.id')
                ->select('submodules.*', 'modules.name as module')
                ->get();
                
            // return $submodules;
            $companyName = $website->company;
            $slug = Str::slug($website->website_name);

            ini_set('max_execution_time', 600);

            $siteIndex = 0;
            
            for($i = 1; $i <= $this->maxSite; $i++){
                if(File::exists($this->destinationDirectory.'/wsi-standards'.$i)) {
                    $siteIndex = $i;
                    break;
                }
            }

            if($siteIndex == 0){
                return redirect()->route('website.index')->with('error', 'No Site Available.');
            }

            $oldPath    = $this->destinationDirectory.'/wsi-standards'.$siteIndex;
            $newProject = $this->destinationDirectory.'/'.$slug;

            //rename the directory to a new project
            File::move($oldPath, $newProject);

            //transfer theme assets
            $sourceAsset = $this->destinationDirectory.'/themes/'.$website->theme.'/assets';
            $targetAsset = $newProject.'/public/theme';
            File::copyDirectory($sourceAsset, $targetAsset);

            //transfer theme views
            $sourceView = $this->destinationDirectory.'/themes/'.$website->theme.'/views';
            $targetView = $newProject.'/resources/views/theme';
            File::copyDirectory($sourceView, $targetView);

            //transfer logo
            $sourceLogo = storage_path('app/public/'.$website->logo);
            $destinationLogo = $newProject.'/public/storage/logos/site-logo.png';
            File::copy($sourceLogo, $destinationLogo);

            //create db & setting up environment and seeders
            DB::statement("CREATE DATABASE IF NOT EXISTS `$slug`");
            $this->configureDatabaseInEnvFile($slug, $newProject);
            $this->changeSeederValues('company_name', $companyName, $newProject);
            $this->changeSeederValues('website_name', $companyName, $newProject);
            $this->updatePermissionsSeeder($submodules, $newProject);
        
            $website->update(["status" => "Built"]);
            
            return redirect()->route('website.index')->with('success', 'Site created successfully.');

        }catch(Exception $e){
            return redirect()->route('website.index')->with('error', 'Error: ' . $e->getMessage());
        }
    }

    private function configureDatabaseInEnvFile($databaseName, $destinationDirectory)
    {
        $envFilePath = $destinationDirectory . '/.env';
        $currentEnvContent = file_get_contents($envFilePath);
        $newDatabaseConfig = "DB_DATABASE=$databaseName";

        $updatedEnvContent = preg_replace(
            '/(DB_DATABASE=)(.*)/',
            $newDatabaseConfig,
            $currentEnvContent
        );

        file_put_contents($envFilePath, $updatedEnvContent);
    }

    private function changeSeederValues($key, $companyName, $destinationDirectory) {
        $SettingSeeder = $destinationDirectory . '/database/seeders/SettingSeeder.php';
        $escapedCompanyName = preg_quote($companyName, '/');
    
        $currentSeeder = file_get_contents($SettingSeeder);
        $newSeeder = "'$key' => '$escapedCompanyName',";
        $updatedSeederContent = preg_replace(
            "/('$key' =>\s*')([^']+)(.*)/",
            $newSeeder,
            $currentSeeder
        );
    
        if ($updatedSeederContent === null) {
            throw new \Exception("Failed to update $key in the seeder file.");
        }
    
        file_put_contents($SettingSeeder, $updatedSeederContent);
    }

    private function updatePermissionsSeeder($websiteModules, $destinationDirectory) {
        $seederFile = $destinationDirectory . '/database/seeders/PermissionsSeeder.php';
        $currentSeeder = file_get_contents($seederFile);
        $websiteModulesArray = $websiteModules->toArray();
    
        $permissionsArray = array_map(function ($module) {
            return [
                'name' => '"' .  $module['name'] . '"',
                'is_view_page' => 0,
                'module' => '"' .  $module['module'] . '"',
                'description' => '""',
                'routes' => '""',
                'methods' => '""',
                'user_id' => 1,
                'created_at' => 'now()',
                'updated_at' => 'now()',
            ];
        }, $websiteModulesArray);
    
        $formattedArray = '['  . PHP_EOL . implode(', ' . PHP_EOL, array_map(function ($permission) {
            return '            [' . implode(', ', array_map(function ($key, $value) {
                return '"' . $key . '" => ' . $value;
            }, array_keys($permission), $permission)) . ']';
        }, $permissionsArray))  . PHP_EOL . '       ];';
    
        $updatedSeederContent = preg_replace(
            '/\$permissions\s*=\s*\[.*?\];/s',
            '$permissions = ' . $formattedArray,
            $currentSeeder
        );
    
        if ($updatedSeederContent === null) {
            throw new \Exception("Failed to update 'name' in the seeder file.");
        }
    
        file_put_contents($seederFile, $updatedSeederContent);
    }
}