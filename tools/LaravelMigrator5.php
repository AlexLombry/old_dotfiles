<?php
// on récupère tous les models de manière récursive dans un tableau en construisant le namespace et le nom.
ini_set('memory_limt', -1);
$basePath = "/Users/alex/Web/zenchef52";

/**
 * Debug
 * @param  mixed $m
 * @return mixed
 */
function dd($m) {
    var_dump($m);
    die;
}

/**
 * Recursive iterator helper
 * @param string $rPath
 * @return array
 */
function recursiveArray($rPath)
{
    $tabs = array();

    $objects = new RecursiveIteratorIterator(
        new RecursiveDirectoryIterator($rPath),
        RecursiveIteratorIterator::SELF_FIRST
    );

    foreach ($objects as $object) {
        if (!$object->isFile()) continue;
        if ($object->getExtension() != 'php') continue;
        $tabs[] = $object;
    }

    return $tabs;
}

/**
 * Recursive update depends on path
 * @param string $rPath
 * @param array $modelArray
 * @return mixed
 */
function recursiveUpdate($rPath, $modelArray)
{
    $updateArray = array();
    $updates = recursiveArray(realpath($rPath));
    foreach ($updates as $update) {
        if ($update->getExtension() != 'php') continue;

        $file = $update->getPathName();
        echo $file . "\n";

        foreach ($modelArray as $m) {
            $getFile = file_get_contents($file);
            $output = preg_replace("/".$m['old_use']."/", $m['use'], $getFile);
            file_put_contents($file, $output);
        }
    }    
}

// Get all models and create one array to get them all
$modelArray = array();
$models = recursiveArray(realpath("{$basePath}/app/Models"));

foreach ($models as $model) {
    $path = str_replace('{$basePath}/app/Models', 'App\\Models', $model->getPath());
    $name = $model->getFilename();
    $filename = str_replace('.php', '', $model->getFilename());

    $path = str_replace('/', '\\', $path);
    $old_use = "use {$filename};";
    $use = "use {$path}\\{$filename};";

    $modelArray[] = compact('path', 'name', 'filename', 'path', 'old_use', 'use');
}

$folders = [
    "{$basePath}/app/Console",
    "{$basePath}/app/Menus1001",
    "{$basePath}/app/Http/Controllers"
];

array_map(function ($folder) use ($modelArray) {
    return recursiveUpdate($folder, $modelArray);    
}, $folders);