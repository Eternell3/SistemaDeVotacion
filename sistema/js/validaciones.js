console.log("el js está cargado");

/*AQUI EMPIEZAN LAS VALIDACIONES DEL FORMULARIO*/

function validacion() {



    //var v_nombres = document.getElementById('nombres').value;
    var v_alias = document.getElementById('alias').value;
    var v_rut = document.getElementById('rut').value;
    var v_email = document.getElementById('email').value;


    var formato_alias = /^(?=.*[a-zA-Z])(?=.*\d).+$/;
    var formato_rut = /^[0-9]{1,2}\.[0-9]{3}\.[0-9]{3}-[0-9kK]{1}$/;
    var formato_correo = /^[^\s@]+@[^\s@]+.[^\s@]+$/;

    if ($("#nombres").val().length == 0) {
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


$(document).ready(function () {

    $.ajax({
        url: "http://localhost/sistemadevotacion/sistema/php/consultasBDD.php",
        method: "GET",
        dataType: "json",
        data: {
            funcion: 'seleccionarCandidato'
        },

        success: function (data) {
            try {
                var jsonData = JSON.stringify(data);
                console.log("Respuesta del servidor candidato:", jsonData);

                $('#candidato').empty();
                $('#candidato').append('<option value="0">Seleccione</option>');
                $.each(data, function (index, element) {
                    $('#candidato').append('<option value="' + element.id_candidato + '">' + element.nombres_candidato + '</option>');
                });

            } catch (e) {
                console.error("Error al analizar JSON candidato:", e);
            }
            console.log(data);

            //console.log("logré entrar al ajax");
        },
        error: function (xhr, status, error) {
            console.log("error, no entra a ajax candidato: " + status + " - " + error);
        }
    });


});

$(document).ready(function () {

    $.ajax({
        url: "http://localhost/sistemadevotacion/sistema/php/consultasBDD.php",
        method: "GET",
        dataType: "json",
        data: {
            funcion: 'seleccionarRegion'
        },

        success: function (data) {
            try {
                var jsonData = JSON.stringify(data);
                console.log("Respuesta del servidor region:", jsonData);

                $('#region').empty();
                $('#region').append('<option value="0">Seleccione</option>');
                $.each(data, function (index, element) {
                    $('#region').append('<option value="' + element.REGION_ID + '">' + element.REGION_NOMBRE + '</option>');
                });

            } catch (e) {
                console.error("Error al analizar JSON region:", e);
            }
            console.log(data);

            //console.log("logré entrar al ajax");
        },
        error: function (xhr, status, error) {
            console.log("error, no entra a ajax region: " + status + " - " + error);
        }
    });


});


$("#region").change(function () {

    var region_id = $("#region").prop("selectedIndex");
    //var region_nombre = $("#region option:Selected").text();
    //console.log("valor obtenido de region: "+ region_id + " - " + region_nombre);
    //var region_id = 1;

    $.ajax({
        url: "http://localhost/sistemadevotacion/sistema/php/consultasBDD.php",
        method: "GET",
        dataType: "json",
        data: {
            funcion: 'seleccionarComuna',
            region_id: region_id
        },

        success: function (data) {
            try {
                var jsonData = JSON.stringify(data);
                console.log("Respuesta del servidor Comuna:", jsonData);

                if (region_id == 0) {
                    $('#comuna').empty();
                    $('#comuna').append('<option value="0">Seleccione</option>');

                } else {

                    $('#comuna').empty();
                    $.each(data, function (index, element) {
                        $('#comuna').append('<option value="' + element.comuna_id + '">' + element.comuna_nombre + '</option>');
                    });

                }


            } catch (e) {
                console.error("Error al analizar JSON Comuna:", e);
            }
            console.log(data);

            console.log("logré entrar al ajax Comuna");
        },
        error: function (xhr, status, error) {
            console.log("error, no entra a ajax Comuna: " + status + " - " + error);
        }
    });


});












