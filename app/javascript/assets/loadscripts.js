function loadScripts(){
    var tag = document.createElement("script");
    tag.src = "https://code.getmdl.io/1.3.0/material.min.js";
    document.getElementsByTagName("head")[0].appendChild(tag);
}

document.addEventListener("turbolinks:load", () => {
    //console.log("HELLO")
    //loadScripts();
});