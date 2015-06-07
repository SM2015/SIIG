document.addEventListener("mozfullscreenchange", function () {
    if (!document.mozFullScreen) {
        $('.zona_maximizada').toggleClass('zona_maximizada');
        $('.zoom').show();
    }
}, false);
document.addEventListener("fullscreenchange", function () {
    fullscreenState.innerHTML = (document.fullscreenElement) ? "" : "not ";
    if (!document.fullscreenElement) {
        $('.zona_maximizada').toggleClass('zona_maximizada');
        $('.zoom').show();
    }
}, false);
document.addEventListener("msfullscreenchange", function () {
    if (!document.msFullscreenElement) {
        $('.zona_maximizada').toggleClass('zona_maximizada');
        $('.zoom').show();
    }
}, false);
document.addEventListener("webkitfullscreenchange", function () {
    if (!document.webkitIsFullScreen) {
        $('.zona_maximizada').toggleClass('zona_maximizada');
        $('.zoom').show();
    }
}, false);
function goFullscreen(id) {
    var element = document.getElementById(id);

    // These function will not exist in the browsers that don't support fullscreen mode yet, 
    // so we'll have to check to see if they're available before calling them.    
    if (element.requestFullscreen) {
        element.requestFullscreen();
    } else if (element.mozRequestFullScreen) {
        // This is how to go into fullscren mode in Firefox
        // Note the "moz" prefix, which is short for Mozilla.
        element.mozRequestFullScreen();
    } else if (element.webkitRequestFullScreen) {
        // This is how to go into fullscreen mode in Chrome and Safari
        // Both of those browsers are based on the Webkit project, hence the same prefix.
        element.webkitRequestFullScreen();
    } else if (element.msRequestFullscreen) {
        element.msRequestFullscreen();
    }
}