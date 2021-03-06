import re
from os.path import exists
import requests
import recurring_ical_events as rie
import icalendar
import codecs
from ics import Calendar
from xml.etree.ElementTree import Element, SubElement
from xml.etree import ElementTree
from xml.dom import minidom


# turns camelcase to snake case
def camel_to_snake(name):
    name = re.sub('(.)([A-Z][a-z]+)', r'\1_\2', name)
    return re.sub('([a-z0-9])([A-Z])', r'\1_\2', name).lower().replace("-", "_")


# creates the calendar Element and fills it with information from the ical
# that is downloaded from the given url from the read_urls() function
def setup(url):
    ical_string = requests.get(url).text

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
    cclass.text = url[2].replace("file=", "").upper()

    # handle convert all recurring to single events - keep single ones
    rie_calendar = icalendar.Calendar.from_ical(ical_string)
    events = rie.of(rie_calendar).all()
    # convert vevents of icalendar library to ics library (easier to handle)
    ical_string_header = ical_string[:ical_string.find("BEGIN:VEVENT")]
    rie_ical_string = f"{ical_string_header}\n" \
                      + "".join(event.to_ical().decode() for event in events) \
                      + "END:VCALENDAR"
    ical_calendar = Calendar(rie_ical_string)
    # convert ical events to required xml format
    (event_count, note_count) = convert_ical_to_xml_events(
        cclass.text, ical_calendar, calendar)

    print(f"--- {cclass.text} ---")
    print(len(Calendar(ical_string).events),
          "Original Events (recurring included)")
    print(event_count, "Total Events (single only)")
    print(note_count, "Notes injected")

    return prettify(calendar)


def convert_ical_to_xml_events(cclass, ical_calendar, xml_calendar):
    found = 0
    notes_injected = 0
    uids_found = set()
    for event in ical_calendar.events:
        try:
            event_str = str(event).replace(";", ":").splitlines()
            attendees_done = False
            dtstart = None
            uid = None

            for attribute in event_str:
                att = attribute.split(":")

                if att[0] == "BEGIN":
                    ev = SubElement(xml_calendar, "event")
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
                    dtstart = att[1]
                    y.text = dtstart
                elif att[0] == "DTEND":
                    y = SubElement(ev, "end")
                    y.text = att[1]
                elif att[0] == "RRULE":
                    # skip current event if it contains recurrence - should've been handled beforehand
                    xml_calendar.remove(ev)
                    raise RuntimeError(f"Found RRULE for event with uid={uid}")
                elif att[0] == "UID":
                    y = SubElement(ev, "uid")
                    uid = att[1]
                    # change uid on uid collision (happens at repeating events)
                    if uid in uids_found:
                        if dtstart is None:
                            raise RuntimeError(
                                f"UID collision - couldn't change as DTSTART attribute hasn't been read yet for uid={uid}")
                        uid += dtstart
                    y.text = uid
                    uids_found.add(uid)
                elif att[0] != "END":
                    y = SubElement(ev, camel_to_snake(att[0]))
                    y.text = att[1]

            # add notes from separate XML file if present for this UID
            if uid is not None and uid in get_notes(cclass):
                notes_injected += 1
                y = SubElement(ev, "note")
                y.text = get_notes(cclass)[uid]
        except RuntimeError as ex:
            print(ex)
            continue
        found += 1

    return (found, notes_injected)


notes_cache = {}


# get event specific notes per class
def get_notes(cclass):
    if cclass in notes_cache:
        return notes_cache[cclass]

    file_path = f"xml/{cclass}-notes.xml"
    notes_dict = {}
    if not exists(file_path):
        return notes_dict

    notes_file = minidom.parse(f"xml/{cclass}-notes.xml")
    for event in notes_file.getElementsByTagName("event"):
        uid = event.getElementsByTagName("uid")[0].firstChild.nodeValue
        note = event.getElementsByTagName("note")[0].firstChild.nodeValue
        notes_dict[uid] = note

    notes_cache[cclass] = notes_dict
    return notes_dict


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
    xml_file = codecs.open("xml/" + file_name + ".xml", "w", "utf-8")
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
