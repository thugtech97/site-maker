<?php

namespace App\Console\Commands;

use App\Models\Website;
use Illuminate\Support\Str;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Symfony\Component\Process\Process;
use Illuminate\Support\Facades\Artisan;
use Symfony\Component\Process\Exception\ProcessFailedException;

class BuildSiteCommand extends Command
{
    
    protected $signature = 'clone:repository {repositoryUrl} {siteId?}';
    protected $description = 'Clone WSI Standards...';


    public function handle()
    {
        try {
            $repositoryUrl = $this->argument('repositoryUrl');
            $website = Website::findOrFail($this->argument('siteId'));
            $siteName = Str::slug($website->website_name);
            $companyName = $website->company;
            $destinationDirectory = 'D:/wsi-sites/'.$siteName;
            $timeout = 300;
        
            if (!File::exists($destinationDirectory)) {
                File::makeDirectory($destinationDirectory, 0755, true);
            }

            $progressBar = $this->output->createProgressBar();
            $progressBar->setFormat('verbose');
            $this->info('Creating a company site named '.$siteName.'...' . "\033[31m" . '(****DO NOT CLOSE THIS WINDOW****)' . "\033[0m");
 
            $this->info("\033[33m
            //          //  ///////  //        ////////   //    //
            //         //  //       //        //     //  //    //
            //   //   //  ///////  //  ////  ////////   ////////
            // // // //       //  //        //         //    //
            //      //  ///////  //        //         //    //
            \033[0m");

         //START CLONING WSI-STANDARDS REPO
            $gitCloneProcess = new Process(['git', 'clone', $repositoryUrl, $destinationDirectory]);
            $gitCloneProcess->setTimeout($timeout);
            $gitCloneProcess->setWorkingDirectory($destinationDirectory);
            $gitCloneProcess->run();
    
            if (!$gitCloneProcess->isSuccessful()) {
                throw new ProcessFailedException($gitCloneProcess);
            }
        //END CLONING WSI-STANDARDS REPO


        //START INSTALLING CORE PACKAGES
            $this->info('Installing core packages for '.$siteName.'...' . "\033[31m" . '(****PLEASE DO NOT CLOSE THIS WINDOW****)' . "\033[0m");
            $composerInstallProcess = new Process(['composer', 'install']);
            $composerInstallProcess->setTimeout($timeout);
            $composerInstallProcess->setWorkingDirectory($destinationDirectory);
            
            $progressBar->start();
            $composerInstallProcess->run(function ($type, $buffer) use ($progressBar) {
                $progressBar->advance();
            });
            $progressBar->finish();
            $this->output->newLine();

            if (!$composerInstallProcess->isSuccessful()) {
                throw new ProcessFailedException($composerInstallProcess);
            }
        //END INSTALLING CORE PACKAGES

        //START .ENV AND DATABASE SETUP
            $this->info("Setting up environment: Configuring database and additional settings..." . "\033[31m" . '(****PLEASE DO NOT CLOSE THIS WINDOW****)' . "\033[0m");
            DB::statement("CREATE DATABASE IF NOT EXISTS `$siteName`");
            $this->configureDatabaseInEnvFile($siteName, $destinationDirectory);
            $this->changeSeederValues('company_name', $companyName, $destinationDirectory);
            $this->changeSeederValues('website_name', $companyName, $destinationDirectory);
        //END .ENV AND DATABASE SETUP 

        /*
        //START RUN MIGRATIONS
            $this->tempChangeCurrentEnv($siteName);

            $artisanScript = $destinationDirectory . DIRECTORY_SEPARATOR . 'artisan';
            $migrateCmd = sprintf('php %s migrate:fresh', $artisanScript);
            exec('start cmd /c "cd /d ' . $destinationDirectory . ' && ' . $migrateCmd . '"', $output, $exitCode);
            if ($exitCode === 0) {
                
            }
            $this->tempChangeCurrentEnv('wsi-site-maker');
        */
        //END RUN MIGRATIONS

            $this->info('Website created successfully.');

        } catch (ProcessFailedException $e) {
            $this->error('Error: ' . $e->getMessage());
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
        $seederPath = $destinationDirectory . '/database/seeders/SettingSeeder.php';
        $escapedCompanyName = preg_quote($companyName, '/');
    
        $currentSeeder = file_get_contents($seederPath);
        $newSeeder = "'$key' => '$escapedCompanyName',";
        $updatedSeederContent = preg_replace(
            "/('$key' =>\s*')([^']+)(.*)/",
            $newSeeder,
            $currentSeeder
        );
    
        if ($updatedSeederContent === null) {
            throw new \Exception("Failed to update $key in the seeder file.");
        }
    
        file_put_contents($seederPath, $updatedSeederContent);
    }
    
}
