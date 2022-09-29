function process(quant) {
    var value = parseInt(document.getElementById("quantidade").value);
    value += quant;
    if (value < 1) {
        document.getElementById("quantidade").value = 1;
    } else {
        document.getElementById("quantidade").value = value;
    }
}
