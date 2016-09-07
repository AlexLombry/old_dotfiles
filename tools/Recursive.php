<?php

class Recursive {

    public $basePath;
    public $datas = [];

    public function __construct($path) {

    }

    public function iterate($path) {
        $iterator = new RecursiveIteratorIterator(
            new RecursiveDirectoryIterator($path), 
            RecursiveIteratorIterator::SELF_FIRST
        );

        foreach ($iterator as $iterate) {
            if (! $object->isFile()) {
                continue;
            }

            array_push($this->data, $object);
        }
    }

    public function model() {
        $objects = $this->iterate('/App/Models');

        
    }

    public function hyphen() {

    }

    public function use() {

    }
}