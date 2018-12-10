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
    $currentUrl = trim(str_replace($url, '', $hrefs->item($i)->getAttribute('href')));
    if (substr($currentUrl, 0, 1) === '/') $currentUrl = $url . $currentUrl;
    if (substr($currentUrl, 0, 1) === '#') $currentUrl = $url . '/' . $currentUrl;
    if ($currentUrl != "") $links[] = trim($currentUrl);
}

var_dump($links);
