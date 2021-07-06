function submitLogin() {
    alert("Test");
}

function triggerEasterEgg(){
    let egg = window.document.getElementById("easteregg-container");
    let currentClassEgg = egg.getAttribute("class");
    
    egg.setAttribute("class", currentClassEgg + " easteregg-visible");
    playAudio();
    
    setTimeout(() => { 
        egg.setAttribute("class", currentClassEgg);
    }, 1000);

}


function playAudio() {
    let audio = window.document.getElementById("easteregg-audio");
    audio.play();
}