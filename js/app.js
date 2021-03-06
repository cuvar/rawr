function onLoadIndex() {
    hideLogoutContainer(isLoggedIn());
}
// EASTEREGG
function triggerEasterEgg() {
    let egg = window.document.getElementById("easteregg-container");
    let currentClassEgg = egg.getAttribute("class");

    egg.setAttribute("class", currentClassEgg + " easteregg-visible");
    playAudio();

    setTimeout(() => {
        egg.setAttribute("class", currentClassEgg);
    }, 1000);

}

function playAudio() {
    const audio = window.document.getElementById("easteregg-audio");
    audio.play();
}

// LOGIN
function getCookieObject() {
    let cookies = document.cookie.split(";").map(c => c.trim());

    let cookieObject = {};
    cookies = cookies.forEach(c => {
        let values = c.split("=");
        cookieObject[values[0]] = values[1];
    });

    return cookieObject;
}

function isLoggedIn() {
    let cookies = getCookieObject();
    return (typeof cookies["loggedin"] != "undefined" && cookies["loggedin"] == "true");
}
function hasPermission() {
    let className = document.getElementById("class-info").innerHTML;
    let cookies = getCookieObject();
    let perms = typeof cookies.perms != "undefined" ? cookies.perms.split("&") : [];
    return perms.includes("admin") || perms.includes(className);
}

// HIDING ELEMENTS
function hideLogoutContainer(isLoggedIn) {
    this.hideElement(document.getElementById("login-container"), isLoggedIn);
    this.hideElement(document.getElementById("logout-container"), !isLoggedIn);
}

function hideElement(element, toHide) {
    if (toHide) {
        this.removeAttribute(element, "class", "display-block");
        this.addAttribute(element, "class", "display-none");
    } else {
        this.removeAttribute(element, "class", "display-none");
        this.addAttribute(element, "class", "display-block");
    }
}

function isHidden(el) {
    var style = window.getComputedStyle(el);
    return (style.display === 'none');
}

function togglePopup(toShow, element) {
    let popup = document.getElementById("popup");
    this.hideElement(popup, !toShow);
    
    if (!isHidden(popup) && element !== null) {
        let title = document.getElementById("popup-event-title");
        let eventValue = element.children[0].children[0].innerHTML;
        title.innerHTML = eventValue;
        
        setUid(element.dataset.popup);
        setNote(element.dataset.popupnote);
        setTimes(element.dataset.popupstart, element.dataset.popupend);
        let currentLocation = document.getElementById("popup-current-link");
        currentLocation.value = window.location.href;
    }
}

// CSS-CLASS MANAGEMENT
function addAttribute(element, attribute, value) {
    let currentAttribute = element.getAttribute(attribute);
    if (currentAttribute === null || !currentAttribute.includes(value)) {
        element.setAttribute(attribute, currentAttribute + " " + value);
    }
}

function removeAttribute(element, attribute, value) {
    let currentAttribute = element.getAttribute(attribute);
    if (currentAttribute !== null && currentAttribute.includes(value)) {
        element.setAttribute(attribute, currentAttribute.replace(value, ""));
    }
}




function setUid(uid) {
    let uidInput = document.getElementById("popup-uid");
    uidInput.value = uid;
}

function setNote(note) {
    let textarea = document.getElementById("note-input");
    textarea.value = note;

    // set textarea readonly if no permissions
    if (isLoggedIn() && hasPermission()) {
        textarea.removeAttribute("readonly");        
    } else {
        addAttribute(textarea, "readonly", "readonly");
    }

}


function setTimes(start, end) {
    date = formDateFromString(start.split("|")[0]);
    stime = formTimeFromString(start.split("|")[1]);
    etime = formTimeFromString(end);

    let startDateLabel = document.getElementById("popup-start-date");
    startDateLabel.innerHTML = date;
    let endDateLabel = document.getElementById("popup-end-date");
    endDateLabel.innerHTML = date;
    let startTimeLabel = document.getElementById("popup-start-time");
    startTimeLabel.innerHTML = stime;
    let endTimeLabel = document.getElementById("popup-end-time");
    endTimeLabel.innerHTML = etime;
}


function formDateFromString(str) {
    str = str.substring(0, str.length / 2);
    let date = str.slice(6, 8) + "." + str.slice(4, 6) + "." + str.slice(0, 4);
    return date;
}


function formTimeFromString(str) {
    str = str.substring(0, str.length / 2);
    if (str.length < 4) {
        str = "0" + str;
    }
    let time = str.slice(0, 2) + ":" + str.slice(2, 4);
    return time;
}

// SIDE VIEW
function showDetails(element) {
    let detailsElement = element.children[0].children[1];
    hideElement(detailsElement, !isHidden(detailsElement));

}