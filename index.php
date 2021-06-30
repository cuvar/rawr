<?php

# Load XML and stylesheet
$xmldoc = new DOMDocument();
$xsldoc = new DOMDocument();
$xsl = new XSLTProcessor();

$xmldoc->loadXML(file_get_contents('dashboard.xml'));
$xsldoc->loadXML(file_get_contents('xsl/dashboard.xsl'));

# Error handling on load
libxml_use_internal_errors(true);
$result = $xsl->importStyleSheet($xsldoc);
if (!$result) {
    foreach (libxml_get_errors() as $error) {
        echo "Libxml error: {$error->message}\n";
    }
}
libxml_use_internal_errors(false);

# Parameters
$startDate = isset($_GET['startDate']) ? $_GET['startDate'] : date('Ymd');
$endDate = isset($_GET['endDate']) ? $_GET['endDate'] : date('Ymd') ;
$currentDate = date('Ymd');

$xsl->setParameter('', 'timeframestart', $startDate);
$xsl->setParameter('', 'timeframeend', $endDate);
$xsl->setParameter('', 'currentDate', $currentDate);

# Transform
if ($result) {
    echo $xsl->transformToXML($xmldoc);
}