console.log("el js está cargado");



function validacion() {
    var v_nombres = document.getElementById('nombres').value;
    var v_alias = document.getElementById('alias').value;
    var v_rut = document.getElementById('rut').value;
    var v_email = document.getElementById('email').value;


    var formato_alias = /^(?=.*[a-zA-Z])(?=.*\d).+$/;
    var formato_rut = /^[0-9]{1,2}\.[0-9]{3}\.[0-9]{3}-[0-9kK]{1}$/;
    var formato_correo = /^[^\s@]+@[^\s@]+.[^\s@]+$/;

    if (v_nombres == "") {
        alert("el nombre viene vacio, ingrese un nombre valido !!!");
        return false;

    };


    if (formato_alias.test(v_alias) == false || v_alias.length < 5) {

        alert("Ingrese un alias correcto, debe contener letras y por lo menos 1 número; debe contener mas de 5 caracteres !!!");
        document.getElementById('alias').value = "";
        return false;

    };


    if (formato_rut.test(v_rut) == false) {

        alert("Ingrese un rut valido con puntos, guión y digito verificador.");
        document.getElementById('rut').value = "";
        return false;

    };



    if (formato_correo.test(v_email) == false) {

        alert("ingrese un correo valido !!!");
        document.getElementById('email').value = "";
        return false;

    };

}


