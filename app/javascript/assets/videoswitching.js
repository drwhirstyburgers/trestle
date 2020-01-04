function onReady(){
    var parent = document.querySelector('.trix-content');
    var child = parent.children
    var arr = [...child]
    var divsWithIframes = []
    
    arr.forEach(el => {
        if(el.innerText.includes('iframe')){
            var iframe = el.innerText.split('*').map(x => {
                if(x.includes('iframe')){
                    return x
                }
            })
            iframe = iframe.filter(x => x != null || x != undefined).join()
            console.log(iframe)
        }
    })
}

document.addEventListener('turbolinks:load', () => {
    onReady();
});