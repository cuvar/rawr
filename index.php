<?php

# display modes
const MODE_WEEK = "week";
const MODE_MONTH = "month";
const MODE_START = "start";

# load XML and stylesheet
$xmldoc = new DOMDocument();
$xsldoc = new DOMDocument();
$xsl = new XSLTProcessor();

# URL Parameters
$mode = isset($_GET['mode']) ? $_GET['mode'] : 'start';
$class = isset($_GET['class']) ? $_GET['class'] : 'TINF20B2';

if ($mode == MODE_WEEK) {
    $xsldoc->loadXML(file_get_contents('xsl/dashboard.xsl'));
    $xmldoc->loadXML(file_get_contents("xml/$class.xml"));
} elseif ($mode == MODE_MONTH) {
    $xsldoc->loadXML(file_get_contents('xsl/dashboardMonth.xsl'));
    $xmldoc->loadXML(file_get_contents("xml/$class.xml"));
} elseif ($mode == MODE_START) {
    $xsldoc->loadXML(file_get_contents('xsl/index.xsl'));
    $xmldoc->loadXML(file_get_contents('index.xml'));
}

# error handling on load
libxml_use_internal_errors(true);
$result = $xsl->importStyleSheet($xsldoc);
if (!$result) {
    foreach (libxml_get_errors() as $error) {
        echo "Libxml error: {$error->message}\n";
    }
}
libxml_use_internal_errors(false);

# XSLT parameters
$currentDate = date('Ymd');
$startDate = isset($_GET['startDate']) ? $_GET['startDate'] : $currentDate;
$startDateTimestamp = strtotime($startDate);
$endDate = null;
$endDateTimestamp = null;

# retrieve week/month timeframe start/end
if ($mode == MODE_WEEK) {
    $startDateTimestamp = strtotime("Monday this week", $startDateTimestamp);
    $startDate = date("Ymd", $startDateTimestamp);
    $endDateTimestamp = strtotime("Sunday this week", $startDateTimestamp);
    $endDate = date("Ymd", $endDateTimestamp);
} else if ($mode == MODE_MONTH) {
    # hand over deviating month start/end as well
    $monthStartDateTimestamp = strtotime("first day of this month", $startDateTimestamp);
    $monthStartDate = date("Ymd", $monthStartDateTimestamp);
    $xsl->setParameter('', 'monthStart', $monthStartDate);
    $monthEndDateTimestamp = strtotime("last day of this month", $startDateTimestamp);
    $monthEndDate = date("Ymd", $monthEndDateTimestamp);
    $xsl->setParameter('', 'monthEnd', $monthEndDate);

    # if month starts with monday use regular month start as timeframestart
    if (date("N", $monthStartDateTimestamp) == 1) {
        $startDateTimestamp = $monthStartDateTimestamp;
        $startDate = $monthStartDate;
    } else {
        $startDateTimestamp = strtotime("last monday of last month", $monthStartDateTimestamp);
        $startDate = date("Ymd", $startDateTimestamp);
    }

    # respectively for month end
    if (date("N", $monthEndDateTimestamp) == 7) {
        $endDateTimestamp = $monthEndDateTimestamp;
        $endDate = $monthEndDate;
    } else {
        $endDateTimestamp = strtotime("first sunday of next month", $monthStartDateTimestamp);
        $endDate = date("Ymd", $endDateTimestamp);
    }
}

# hand parameters over to XSLT
$xsl->setParameter('', 'timeframeStart', $startDate);
$xsl->setParameter('', 'timeframeEnd', $endDate);
$xsl->setParameter('', 'currentDate', $currentDate);

# transform
if ($result) {
    echo $xsl->transformToXML($xmldoc);
}
