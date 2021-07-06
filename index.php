<?php

# Display modes
const MODE_WEEK = "week";
const MODE_MONTH = "month";
const MODE_START = "start";

# Load XML and stylesheet
$xmldoc = new DOMDocument();
$xsldoc = new DOMDocument();
$xsl = new XSLTProcessor();

# Parameters
$mode = isset($_GET['mode']) ? $_GET['mode'] : 'start';

if ($mode == MODE_WEEK) {
    $xsldoc->loadXML(file_get_contents('xsl/dashboard.xsl'));
    $xmldoc->loadXML(file_get_contents('dashboard.xml'));
} elseif ($mode == MODE_MONTH) {
    $xsldoc->loadXML(file_get_contents('xsl/dashboardMonth.xsl'));
    $xmldoc->loadXML(file_get_contents('dashboardMonth.xml'));
} elseif ($mode == MODE_START) {
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
$currentDate = date('Ymd');
$startDate = isset($_GET['startDate']) ? $_GET['startDate'] : $currentDate;
$startDateTimestamp = strtotime($startDate);
$endDate = null;
$endDateTimestamp = null;

# Retrieve date which is meant to be the week/month start
if ($mode == MODE_WEEK) {
    $startDateTimestamp = strtotime("Monday this week", $startDateTimestamp);
    $startDate = date("Ymd", $startDateTimestamp);
    $endDateTimestamp = strtotime("Sunday this week", $startDateTimestamp);
    $endDate = date("Ymd", $endDateTimestamp);
} else if ($mode == MODE_MONTH) {
    $startDateTimestamp = strtotime("first day of this month", $startDateTimestamp);
    $startDate = date("Ymd", $startDateTimestamp);
    $endDateTimestamp = strtotime("last day of this month", $startDateTimestamp);
    $endDate = date("Ymd", $endDateTimestamp);
}

# Hand parameters over to XSLT
$xsl->setParameter('', 'timeframestart', $startDate);
$xsl->setParameter('', 'timeframeend', $endDate);
$xsl->setParameter('', 'currentDate', $currentDate);

# Transform
if ($result) {
    echo $xsl->transformToXML($xmldoc);
}
