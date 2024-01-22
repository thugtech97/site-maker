<?php

namespace App\Http\Controllers;

use App\Models\Module;
use App\Models\Website;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Helpers\ListingHelper;
use Illuminate\Support\Facades\Artisan;
use App\Http\Requests\StoreWebsiteRequest;
use App\Http\Requests\UpdateWebsiteRequest;
use Symfony\Component\Process\Exception\ProcessFailedException;

class WebsiteController extends Controller {
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $websites = Website::orderBy('created_at', 'desc')->paginate(10);

        return view('website.index', compact('websites'));
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
            $website = Website::create($request->all());
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

    /*
    public function build(Request $request){

        return redirect()->route('website.index')->with('success', 'Site created successfully.');
    }
    */
    
    public function build(Request $request)
    {
        try {
            $website = Website::findOrFail($request->website);

            ini_set('max_execution_time', 600);
            $projectPath = 'C:/laragon/www/wsi/site-maker';
            $repositoryUrl = "https://github.com/thugtech97/wsi-standards.git";

            $artisanScript = $projectPath . DIRECTORY_SEPARATOR . 'artisan';
            $gitCloneCommand = sprintf('php %s clone:repository %s %s', $artisanScript, escapeshellarg($repositoryUrl), escapeshellarg($request->website));

            exec('start cmd /c "cd /d ' . $projectPath . ' && ' . $gitCloneCommand . '"', $output, $exitCode);

            if ($exitCode === 0) {
                /*
                chdir('D:/wsi-sites/harvey-ltd');
                $commands = [
                    'php artisan list',
                ];
                
                // Concatenate commands using && and execute them
                exec('start cmd /k ' . implode(' && ', $commands));
                */
                return redirect()->route('website.index')->with('success', 'Site created successfully.');
            } else {
                return redirect()->route('website.index')->with('error', 'Error: Build failed');
            }
        } catch (ProcessFailedException $e) {
            return redirect()->route('website.index')->with('error', 'Error: ' . $e->getMessage());
        }
    }
    
}