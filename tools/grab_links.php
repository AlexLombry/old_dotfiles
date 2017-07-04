<?php
$url = 'https://github.com';
$content = file_get_contents($url);
// create dom element and suppress warning
$pageElement = new DOMDocument();
@$pageElement->loadHTML($content);

// Grab all path
$path = new DOMXPath($pageElement);
$hrefs = $path->evaluate("/html/body//a");
$links = [];

for ($i = 0; $i < $hrefs->length; $i++) {
    $links[] = str_replace($url, '', $hrefs->item($i)->getAttribute('href'));
}

var_dump($links);
