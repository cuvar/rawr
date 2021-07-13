<?php
require "xmlUtil.php";

class VCalendar
{

    private $header;
    public $events = [];

    function __construct($header = null)
    {
        $this->header = $header == null ? file_get_contents("res/defaultIcalHeader.txt") : $header;
    }

    function toString()
    {
        $icalStr = "BEGIN:VCALENDAR\n";
        $icalStr .= "$this->header\n";
        foreach ($this->events as $event) {
            $icalStr .= $event->toString() . "\n";
        }
        return $icalStr . "END:VCALENDAR";
    }
}

class VEvent
{
    private $properties = [];

    function __construct($lastModified, $created, $dtStart, $dtStamp, $dtEnd, $uid, $summary, $organizer, $location = null, $description = null, $categories = null, $attendees = [])
    {
        # use ical keys as key
        $this->properties["LAST-MODIFIED"] = $lastModified;
        $this->properties["CREATED"] = $created;
        $this->properties["DTSTART"] = $dtStart;
        $this->properties["DTSTAMP"] = $dtStamp;
        $this->properties["DTEND"] = $dtEnd;
        $this->properties["UID"] = $uid;
        $this->properties["SUMMARY"] = $summary;
        $this->properties["ORGANIZER"] = $organizer;
        if ($location != null)
            $this->properties["LOCATION"] = $location;
        if ($description != null)
            $this->properties["DESCRIPTION"] = $description;
        if ($categories != null)
            $this->properties["CATEGORIES"] = $categories;
        if (sizeof($attendees) > 0)
            $this->properties["ATTENDEE"] = $attendees;
    }

    function toString()
    {
        $icalStr = "BEGIN:VEVENT\n";
        foreach ($this->properties as $key => $value) {
            # include specifications of the respective keys (colon/semicolon as separator)
            if ($key === "ATTENDEE") {
                foreach ($value as $valueChild) {
                    $icalStr .= "$key;$valueChild\n";
                }
            } else if ($key === "ORGANIZER") {
                $icalStr .= "$key;$value\n";
            } else {
                $icalStr .= "$key:$value\n";
            }
        }
        return $icalStr . "END:VEVENT";
    }

    static function constructFromXml($xmlEvent)
    {
        # parse values to format in ical -> single string
        $organizer = 'CN="' . $xmlEvent->organizer->name . '":MAILTO:' . $xmlEvent->organizer->contact;
        $location = isset($xmlEvent->location) ? $xmlEvent->location : null;
        $description = isset($xmlEvent->description) ? $xmlEvent->description : null;
        if (isset($xmlEvent->note)) {
            $description .= "\n\nNotiz: $xmlEvent->note";
        }
        $categories = isset($xmlEvent->categories) ? $xmlEvent->categories : null;
        $attendees = [];
        if (isset($xmlEvent->attendee)) {
            foreach ($xmlEvent->attendee as $attendee) {
                array_push($attendees, "ROLE=$attendee->role;CN=\"$attendee->name\";PARTSTAT=$attendee->status:MAILTO:$attendee->contact");
            }
        }
        return new VEvent($xmlEvent->last_modified, $xmlEvent->created, $xmlEvent->start, $xmlEvent->dtstamp, $xmlEvent->end, $xmlEvent->uid, $xmlEvent->summary, $organizer, $location, $description, $categories, $attendees);
    }
}

# URL Parameters #
$class = isset($_GET['class']) ? $_GET['class'] : die("No 'class' parameter defined");

# check whether class exists
$xmlFilePath = "../xml/$class.xml";
file_exists($xmlFilePath) or die("File xml/$class.xml does not exist");

# read XML file
libxml_use_internal_errors(true);
$xml = loadXML($xmlFilePath);

# convert xml to iCal object
$calendar = new VCalendar();
foreach ($xml->event as $event) {
    array_push($calendar->events, VEvent::constructFromXml($event));
}

# generate iCal file and trigger download
$icalStr = $calendar->toString();
header('Content-type: text/calendar; charset=utf-8');
header('Content-Disposition: attachment; filename=calendar.ics');
header('Content-Length: ' . strlen($icalStr));
header('Connection: close');
echo $icalStr;
