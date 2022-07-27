export default class Validations {
    soloLetras(e) {
        var key = e.keyCode || e.which,
            tecla = String.fromCharCode(key).toLowerCase(),
            letras = " áéíóúabcdefghijklmnñopqrstuvwxyz",
            especiales = [8, 37, 39, 46],
            tecla_especial = false;

        for (var i in especiales) {
            if (key == especiales[i]) {
                tecla_especial = true;
                console.log("letras2222",tecla_especial);
                break;
            }
        }
        console.log("letras",letras);
        console.log("tecla_especial",tecla_especial);

        if (letras.indexOf(tecla) == -1 && !tecla_especial) {
            return false;
        }
    }
}