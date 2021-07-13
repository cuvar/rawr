<?php

/**
 * returns xml file for given file path
 * @param string $filePath file path of xml file
 * @return SimpleXMLElement xml element
 */
function loadXML(String $filePath)
{
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
function saveFormattedXML(SimpleXMLElement $simpleXMLElement, String $outputPath)
{
    $xmlDocument = new DOMDocument('1.0');
    $xmlDocument->preserveWhiteSpace = false;
    $xmlDocument->formatOutput = true;
    $xmlDocument->loadXML($simpleXMLElement->asXML());

    return $xmlDocument->save($outputPath);
}
