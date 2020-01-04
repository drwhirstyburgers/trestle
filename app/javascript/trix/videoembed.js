function onReady(){
    var element = document.querySelector("trix-editor");
    var editor = element.editor;
    var toolbar = element.toolbarElement;
    var groupElement = toolbar.querySelector(".trix-button-group.trix-button-group--text-tools");
    var linkInput = toolbar.querySelector(".trix-input.trix-input--dialog");
    var linkButton = toolbar.querySelector(".trix-button.trix-button--dialog");

    let buttonContent = `<button id="newVideo" type="button" class="trix-button trix-button--icon trix-button--icon-link" data-trix-key="+" title="VE" tabindex="-1">VE</button>`;
    groupElement.insertAdjacentHTML("beforeend", buttonContent);

    var videoButton = document.getElementById("newVideo")
    console.log(videoButton);

    videoButton.addEventListener("click", event => {
        var response;
        var videoPrompt = prompt("Please enter the YouTube embed URL");
        if(videoPrompt == null || videoPrompt == ''){
        } else {
            response = videoPrompt
        }
        let video = '<iframe src="' + response + '" width="560" height="315" frameborder="0" allowfullscreen></iframe>';
        console.log(video);
    });
};

window.onload = function() {
    onReady();
};