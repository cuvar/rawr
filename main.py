import requests
from ics import Calendar
from xml.etree.ElementTree import Element, SubElement, Comment
from xml.etree import ElementTree
from xml.dom import minidom
import re

def camel_to_snake(name):
    name = re.sub('(.)([A-Z][a-z]+)', r'\1_\2', name)
    return re.sub('([a-z0-9])([A-Z])', r'\1_\2', name).lower().replace("-","_")

def prettify(elem):
    """Return a pretty-printed XML string for the Element.
    """
    rough_string = ElementTree.tostring(elem, 'utf-8')
    reparsed = minidom.parseString(rough_string)
    return reparsed.toprettyxml(indent="    ")


def setup():
    url = "https://rapla.dhbw-karlsruhe.de/rapla?page=ICal&user=braun&file=TINF20B2"
    c = Calendar(requests.get(url).text)

    calendar = Element("calendar")
    timezone = SubElement(calendar, "timezone")
    tz_name = SubElement(timezone, "tz_name")
    tz_name.text = "Europe/Berlin"
    tz_url = SubElement(timezone, "tz_timezone")
    tz_url.text = "http://tzurl.org/zoneinfo/Europe/Berlin"

    for event in c.events:
        event_str = str(event).replace(";", ":").splitlines()
        attendees_done = False

        for attribute in event_str:
            att = attribute.split(":")

            if att[0] == "BEGIN":
                ev = SubElement(calendar, "event")
            elif att[0] == "ATTENDEE":#todoo
                if not attendees_done:
                    for attendee in event.attendees:
                        element = SubElement(ev, "attendee")
                        name = SubElement(element, "name")
                        name.text = attendee.common_name
                        contact = SubElement(element, "contact")
                        contact.text = attendee.email
                        status = SubElement(element,"status")
                        status.text = attendee.partstat
                        role = SubElement(element, "role")
                        role.text = attendee.role
                    attendees_done = True
            elif att[0] == "ORGANIZER":
                organizer = SubElement(ev, "organizer")
                name = SubElement(organizer, "name")
                name.text = event.organizer.common_name
                contact = SubElement(organizer, "contact")
                contact.text = event.organizer.email
            elif att[0] == "DTSTART":
                y = SubElement(ev, "start")
                y.text = att[1]
            elif att[0] == "DTEND":
                y = SubElement(ev, "end")
                y.text = att[1]
            elif att[0] == "RRULE":
                rrule = SubElement(ev, "rrule")
                att.remove("RRULE")
                for rule_attribute in att:
                    att_split = rule_attribute.split("=")
                    y = SubElement(rrule, camel_to_snake(att_split[0]))
                    y.text = att_split[1]
            elif att[0] != "END":
                y = SubElement(ev, camel_to_snake(att[0]))
                y.text = att[1]


    print(len(c.events), "Events")

    return prettify(calendar)

def generate_xml(xml_string):
    xml_file = open("event.xml", "w")
    xml_file.write(xml_string)
    xml_file.close()

if __name__ == "__main__":
    cal = setup()
    generate_xml(cal)
