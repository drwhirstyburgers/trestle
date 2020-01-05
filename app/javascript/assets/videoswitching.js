function onReady(){
    if(!document.querySelector("trix-editor")){
        var parent = document.querySelector('.trix-content');
        var child = parent.children
        var arr = [...child]
    
        arr.forEach(el => {
            if(el.innerText.includes('iframe')){
                var iframe = el.innerText.split('*').map(x => {
                    if(x.includes('iframe')){
                        return x
                    }
                })
                newIframe = iframe.filter(x => x != null || x != undefined).join()
                var wrapper = document.createElement('div');
                wrapper.innerHTML = newIframe
                wrapper.setAttribute("id", "videoDiv")
                var toReplace = iframe.filter(x => x != null || x != undefined)
                toReplace.push('*')
                toReplace.splice(0, 0, '*')
                toReplace = toReplace.join('')
                el.innerText = el.innerText.replace(toReplace, '')
                el.appendChild(wrapper)
                var video = document.getElementById("videoDiv")
                video.style.margin = "0 auto"
                video.style.width = "50%"
            }
        })
    }
}

document.addEventListener('turbolinks:load', () => {
    onReady();
});