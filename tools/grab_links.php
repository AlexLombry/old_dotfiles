<?php
$content = file_get_contents('https://sites.com/');
// create dom element and suppress warning
$pageElement = new DOMDocument();
@$pageElement->loadHTML($content);

// Grab all path
$path = new DOMXPath($pageElement);
$hrefs = $path->evaluate("/html/body//a");
$links = [];

for ($i = 0; $i < $hrefs->length; $i++) {
    $links[] = $hrefs->item($i)->getAttribute('href');
}
var_dump($links);
