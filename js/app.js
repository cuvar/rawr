window.addEventListener('load', onLoad, false);


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


function getCookieObject() {
    let cookies = document.cookie.split(";").map(c => c.trim());

    let cookieObject = {};
    cookies = cookies.forEach(c => {
        let values = c.split("=");
        cookieObject[values[0]] = values[1];
    });

    return cookieObject;
}



function onLoad() {
    let cookies = getCookieObject();
    let isLoggedIn = typeof cookies["loggedin"] != "undefined" && cookies["loggedin"] == "true";

    hideLogoutContainer(isLoggedIn);
}

function hideLogoutContainer(isLoggedIn) {
    const loginContainer = document.getElementById("login-container");
    const logoutContainer = document.getElementById("logout-container");

    this.hideElement(loginContainer, isLoggedIn);
    this.hideElement(logoutContainer, !isLoggedIn);
}

function hideElement(element, hidden) {
    if (hidden) {
        let currentClass = element.getAttribute("class");
        element.setAttribute("class", currentClass + " display-none");
    } else {
        let currentClass = element.getAttribute("class");
        element.setAttribute("class", currentClass.replace(" display-none", ""));
    }

}