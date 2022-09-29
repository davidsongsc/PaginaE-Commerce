window.onscroll = function () {
    myFunction()
};

var header = document.getElementById("bfixado");
var sticky = header.offsetTop;

function myFunction() {
    if (window.pageYOffset > sticky) {
        header.classList.add("sticky");
        element.classList.remove("loginoculto");

    } else {
        header.classList.remove("sticky");
        element.classList.add("loginvisivel");

    }
}
