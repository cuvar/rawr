<?php
require "auth.php";
/**
 * returns xml file for given file path
 * @param string $filePath file path of xml file
 * @return SimpleXMLElement xml element
 */
function loadXML(String $filePath) {
    libxml_use_internal_errors(true);
    $xml = simplexml_load_file($filePath);
    if ($xml === false) {
        echo "Failed loading XML: ";
        foreach (libxml_get_errors() as $error) {
            echo "<br>", $error->message;
        }
        die();
    }
    return $xml;
}

/**
 * returns xml file for given file path
 * @param SimpleXMLElement $simpleXMLElement XML element to write 
 * @param String $outputPath file output path
 * @return int the number of bytes written. (Dies if there is any error)
 */
function saveFormattedXML(SimpleXMLElement $simpleXMLElement, String $outputPath) {
    $xmlDocument = new DOMDocument('1.0');
    $xmlDocument->preserveWhiteSpace = false;
    $xmlDocument->formatOutput = true;
    $xmlDocument->loadXML($simpleXMLElement->asXML());

    return $xmlDocument->save($outputPath);
}

# URL Parameters #
$class = isset($_GET['class']) ? $_GET['class'] : die("No 'class' parameter defined");
$uid = isset($_GET['uid']) ? $_GET['uid'] : die("No 'uid' parameter defined");
$note = isset($_GET['note']) ? $_GET['note'] : die("No 'note' parameter defined");

# check whether class exists
$xmlFilePath = "../xml/$class.xml";
file_exists($xmlFilePath) or die("File xml/$class.xml does not exist");

# check permission
session_start();
isset($_SESSION["username"]) or die("Not authentificated");
$username = $_SESSION["username"];
(Auth::hasGroup($username, $class) || Auth::isAdmin($username)) or die("User \"$username\" is lacking permission \"$class\" to add notes in this file");

# read XML file
libxml_use_internal_errors(true);
$xml = loadXML($xmlFilePath);

# set note
$eventFound = false;
foreach ($xml->event as $event) {
    if ($event->uid == $uid) {
        $eventFound = true;
        $event->note = $note;
    }
}
$eventFound or die("Event with uid $uid not found");
saveFormattedXML($xml, $xmlFilePath);

# write note to separate XML file to log changes for later merging (refresh from ical)
$noteFilePath = "../xml/$class-notes.xml";
if (!file_exists($noteFilePath)) {
    $noteFile = fopen($noteFilePath, "w");
    fwrite($noteFile, "<?xml version=\"1.0\"  encoding=\"UTF-8\"?><calendar></calendar>");
}

$noteXml = loadXML($noteFilePath);

$eventFound = false;
foreach ($noteXml->event as $event) {
    if ($event->uid == $uid) {
        $eventFound = true;
        $event->note = $note;
    }
}
if (!$eventFound) {
    $eventNode = $noteXml->addChild("event");
    $eventNode->addChild("uid", $uid);
    $eventNode->addChild("note", $note);
}

saveFormattedXML($noteXml, $noteFilePath);
echo "Success";
