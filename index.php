<?php

# Load XML and stylesheet
$xmldoc = new DOMDocument();
$xsldoc = new DOMDocument();
$xsl = new XSLTProcessor();

# Parameters
$mode = isset($_GET['mode']) ? $_GET['mode'] : 'start' ;

if ($mode == 'week') {
    $xsldoc->loadXML(file_get_contents('xsl/dashboard.xsl'));
    $xmldoc->loadXML(file_get_contents('dashboard.xml'));
}elseif ($mode == 'month') {
    $xsldoc->loadXML(file_get_contents('xsl/dashboardMonth.xsl'));
    $xmldoc->loadXML(file_get_contents('dashboardMonth.xml'));
}elseif ($mode == 'start') {
    $xsldoc->loadXML(file_get_contents('xsl/index.xsl'));
    $xmldoc->loadXML(file_get_contents('index.xml'));
}



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