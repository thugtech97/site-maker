<?php

$command = 'php D:/wsi-sites/harvey-ltd/artisan migrate:fresh';

exec($command, $output, $exitCode);

if ($exitCode === 0) {
    echo "Migration successful!<br>";
    $command = 'php D:/wsi-sites/harvey-ltd/artisan db:seed';
    exec($command, $output, $exitCode);

    if ($exitCode === 0) {
        echo "Seeding successful!<br>";
    }
}

?>