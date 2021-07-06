import requests
from ics import Calendar
from xml.etree.ElementTree import Element, SubElement, Comment
from xml.etree import ElementTree
from xml.dom import minidom
import re


# turns camelcase to snake case
def camel_to_snake(name):
    name = re.sub('(.)([A-Z][a-z]+)', r'\1_\2', name)
    return re.sub('([a-z0-9])([A-Z])', r'\1_\2', name).lower().replace("-", "_")


# creates the calendar Element and fills it with information from the ical
# that is downloaded from the given url from the read_urls() function
def setup(url):
    c = Calendar(requests.get(url).text)

    calendar = Element("calendar")
    timezone = SubElement(calendar, "timezone")
    tz_name = SubElement(timezone, "tz_name")
    tz_name.text = "Europe/Berlin"
    tz_url = SubElement(timezone, "tz_timezone")
    tz_url.text = "http://tzurl.org/zoneinfo/Europe/Berlin"

    url = url.replace("https://rapla.dhbw-karlsruhe.de/rapla?", "").split("&")
    info = SubElement(calendar, "info")
    user = SubElement(info, "user")
    user.text = url[1].replace("user=", "")
    cclass = SubElement(info, "class")
    cclass.text = url[2].replace("file=", "")

    for event in c.events:
        event_str = str(event).replace(";", ":").splitlines()
        attendees_done = False

        for attribute in event_str:
            att = attribute.split(":")

            if att[0] == "BEGIN":
                ev = SubElement(calendar, "event")
            elif att[0] == "ATTENDEE":
                if not attendees_done:
                    for attendee in event.attendees:
                        element = SubElement(ev, "attendee")
                        name = SubElement(element, "name")
                        name.text = attendee.common_name
                        contact = SubElement(element, "contact")
                        contact.text = attendee.email
                        status = SubElement(element, "status")
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


# pulls the ical download urls from urls.txt file
def read_urls():
    path = "urls.txt"
    file = open(path, "r")
    lines = file.readlines()

    return lines


# turns the calendar element into a pretty-printed XML string
def prettify(elem):
    rough_string = ElementTree.tostring(elem, 'utf-8')
    reparsed = minidom.parseString(rough_string)
    return reparsed.toprettyxml(indent="    ")


# writes the pretty printed string from prettify() into a xml file
# if the xml file for that class already exists, the existing on is updated rather than a new one created
def generate_xml(xml_string, url):
    file_name = url.split("file=")[1].upper()
    xml_file = open("xml/" + file_name + ".xml", "w")
    xml_file.write(xml_string)
    xml_file.close()


# program logic
def main():
    urls = read_urls()
    for url in urls:
        url = url.replace("\n", "")
        cal = setup(url)
        generate_xml(cal, url)


if __name__ == "__main__":
    main()
