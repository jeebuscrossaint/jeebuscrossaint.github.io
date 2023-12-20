var text = 'Hello! Welcome to my portfolio website, here I will formally present all my projects to you, the internet explorer. Theres a bar above me for you to go directly to my social media accounts, and the source code of this website hosted on Github pages. There is a toggle switch in the top right to toggle light/dark mode with dark mode being the default.';
var index = 0;
var speed = 10; //ms

function type() {
    if (index < text.length) {
        document.getElementById('typed-text').innerHTML += text.charAt(index);
        index++;
        setTimeout(type, speed);
    }
}

type();

