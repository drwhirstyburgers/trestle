function onReady(){
    if(!document.querySelector("trix-editor")){
        var parent = document.querySelector('.trix-content');
        var child = parent.children
        var arr = [...child]
        let count = 0
    
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
                wrapper.id = count
                var toReplace = iframe.filter(x => x != null || x != undefined)
                toReplace.push('*')
                toReplace.splice(0, 0, '*')
                toReplace = toReplace.join('')
                el.innerText = el.innerText.replace(toReplace, '')
                el.appendChild(wrapper)
                var video = document.getElementById(count)
                video.style.textAlign = "center"
                count ++
            }
        })
    }
}

document.addEventListener('turbolinks:load', () => {
    onReady();
});