import Trix from "trix";

function onReady(){
    var element = document.querySelector("trix-editor");
    if(element != null  || element != undefined){
        var editor = element.editor;
        var toolbar = element.toolbarElement;
        var groupElement = toolbar.querySelector(".trix-button-group.trix-button-group--file-tools");
        var checkpoint = document.getElementById('custId');
        var checkpointValue = JSON.parse(checkpoint.dataset.checkpoint)

        let buttonContent = `<button id="newVideo" type="button" class="trix-button trix-button--icon trix-button--icon-link" data-trix-key="+" title="VE" tabindex="-1">VE</button>`;
        groupElement.insertAdjacentHTML("beforeend", buttonContent);

        var videoButton = document.getElementById("newVideo")

        videoButton.addEventListener("click", event => {
            var response;
            var videoPrompt = prompt("Please enter the YouTube embed URL");
            if(videoPrompt == null || videoPrompt == ''){
            } else {
                response = videoPrompt
            };
            var attachment = new Trix.Attachment({
                sgid: checkpointValue.attachable_sgid, 
                content: `<iframe src=${response} width="560" height="315" frameborder="0" allowfullscreen></iframe>`
            })
            element.editor.setSelectedRange(editor.getDocument().getLength() - 1)
            element.editor.insertAttachment(attachment)
        });
    }
};

document.addEventListener('turbolinks:load', () => {
    onReady();
});