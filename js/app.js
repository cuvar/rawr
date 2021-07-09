function onLoadIndex() {
    let cookies = getCookieObject();
    let isLoggedIn = typeof cookies["loggedin"] != "undefined" && cookies["loggedin"] == "true";

    hideLogoutContainer(isLoggedIn);
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

// HIDING ELEMENTS
function hideLogoutContainer(isLoggedIn) {
    this.hideElement(document.getElementById("login-container"), isLoggedIn);
    this.hideElement(document.getElementById("logout-container"), !isLoggedIn);
}

function hideElement(element, toHide) {
    if (toHide) {
        this.removeClass(element, "display-block");
        this.addClass(element, "display-none");
    } else {
        this.removeClass(element, "display-none");
        this.addClass(element, "display-block");
    }
}

function isHidden(el) {
    var style = window.getComputedStyle(el);
    return (style.display === 'none')
}

function togglePopup(toShow, element) {
    let popup = document.getElementById("popup");
    this.hideElement(popup, !toShow);
    this.blurBackground(toShow);

    if(!isHidden(popup) && element !== null) {
        let title = document.getElementById("popup-event-title");
        let eventValue = element.innerHTML.split("<p>")[0];
        title.innerHTML = eventValue;
    }
}

// CSS-CLASS MANAGEMENT
function addClass(element, attribute) {
    let currentClass = element.getAttribute("class");
    if (currentClass === null || !currentClass.includes(attribute)) {
        element.setAttribute("class", currentClass + " " + attribute);
    }
}

function removeClass(element, attribute) {
    let currentClass = element.getAttribute("class");
    if (currentClass !== null && currentClass.includes(attribute)) {
        element.setAttribute("class", currentClass.replace(attribute, ""));
    }
}

function blurBackground(toBlur) {
    let e = document.getElementsByTagName("html")[0];
    if(toBlur) {
        this.addClass(e, "bg-blur");
    } else {
        this.removeClass(e, "bg-blur");
    }
}