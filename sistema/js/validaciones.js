console.log("el js está cargado");

/*AQUI EMPIEZAN LAS VALIDACIONES DE LA PRUEBA*/

function validacion() {



    var v_nombres = document.getElementById('nombres').value;
    var v_alias = document.getElementById('alias').value;
    var v_rut = document.getElementById('rut').value;
    var v_email = document.getElementById('email').value;
    var checkboxes = $('input[class="checkear"]:checked');

    var formato_alias = /^(?=.*[a-zA-Z])(?=.*\d).+$/;
    var formato_rut = /^[0-9]{1,2}\.[0-9]{3}\.[0-9]{3}-[0-9kK]{1}$/;
    var formato_correo = /^[^\s@]+@[^\s@]+.[^\s@]+$/;

    if (v_nombres.length == 0) {

        alert("el nombre viene vacio, ingrese un nombre valido !!!");
        return false;

    } else if (formato_alias.test(v_alias) == false || v_alias.length < 5) {

        alert("Ingrese un alias correcto, debe contener letras y por lo menos 1 número; debe contener mas de 5 caracteres !!!");
        return false;

    } else if (formato_rut.test(v_rut) == false) {

        alert("Ingrese un rut valido con puntos, guión y digito verificador.");
        return false;

    } else if (formato_correo.test(v_email) == false) {

        alert("ingrese un correo valido !!!");
        return false;

    } else if ($("#region").prop("selectedIndex") == 0) {

        alert("Seleccione una región");
        return false;

    } else if ($("#comuna").prop("selectedIndex") == 0) {

        alert("Seleccione una comuna");
        return false;

    } else if ($("#candidato").prop("selectedIndex") == 0) {

        alert("Seleccione candidato");
        return false;

    } else if (checkboxes.length < 2) {

        alert('Selecciona al menos 2 formas de conocernos.');
        return false;

    } else {

        return true;

    };





};


$('#rut').on('input', function () {

    var valorInput = $("#rut").val();

    $.ajax({
        url: "http://localhost/sistemadevotacion/sistema/php/consultasBDD.php",
        method: "GET",
        dataType: "json",
        data: {
            funcion: 'verificarRut',
            valorInput: valorInput
        },

        success: function (data) {
            if (data.existe == true) {
                console.log("elemento rescatado: ", data);
                alert("El rut que has ingresado ya existe, por favor ingresar un rut diferente");
                $("#rut").val("");
            } else {
                console.log("El rut no existe, puede seguir.");
            }

        },
        error: function (xhr, status, error) {
            console.log("error, no entra a ajax validar rut: " + status + " - " + error);
        }
    });


});


// AQUI COMIENZA LA LLAMADA DE DATOS PARA CARGAR EL COMBOBOX DE CANDIDATOS

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
                //var jsonData = JSON.stringify(data);
                //console.log("Respuesta del servidor candidato:", jsonData);

                $('#candidato').empty();
                $('#candidato').append('<option value="0">Seleccione</option>');
                $.each(data, function (index, element) {
                    $('#candidato').append('<option value="' + element.id_candidato + '">' + element.nombres_candidato + '</option>');
                });

            } catch (e) {
                console.error("Error al analizar JSON candidato:", e);
            }
            //console.log(data);

        },
        error: function (xhr, status, error) {
            console.log("error, no entra a ajax candidato: " + status + " - " + error);
        }
    });


});

// AQUI COMIENZA LA LLAMADA DE DATOS PARA CARGAR EL COMBOBOX DE REGION

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
                //var jsonData = JSON.stringify(data);
                //console.log("Respuesta del servidor region:", jsonData);

                $('#region').empty();
                $('#region').append('<option value="0">Seleccione</option>');
                $.each(data, function (index, element) {
                    $('#region').append('<option value="' + element.REGION_ID + '">' + element.REGION_NOMBRE + '</option>');
                });

            } catch (e) {
                console.error("Error al analizar JSON region:", e);
            }
            //console.log(data);

            //console.log("logré entrar al ajax");
        },
        error: function (xhr, status, error) {
            console.log("error, no entra a ajax region: " + status + " - " + error);
        }
    });


});


// AQUI COMIENZA LA LLAMADA DE DATOS PARA CARGAR EL COMBOBOX DE COMUNAS

$("#region").change(function () {

    var region_id = $("#region").prop("selectedIndex");

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
                //var jsonData = JSON.stringify(data);
                //console.log("Respuesta del servidor Comuna:", jsonData);

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
            //console.log(data);
            //console.log("logré entrar al ajax Comuna");
        },
        error: function (xhr, status, error) {
            console.log("error, no entra a ajax Comuna: " + status + " - " + error);
        }
    });


});




////// AQUI COMIENZA EL INSERT A LA BASE DE DATOS

$('#formulario').submit(function (event) {


    event.preventDefault();

    console.log("Entré la validacion");
    if (validacion() == true) {
        console.log("pase la validacion");
        var formData = $(this).serialize();
        //console.log("datos del formdata: ",formData);

        $.ajax({
            type: 'POST',
            url: 'http://localhost/sistemadevotacion/sistema/php/consultasBDD.php',
            data: formData,
            success: function (data) {

                alert("Votacion ingresada correctamente !!!");

                // console.log(data);

            },
            error: function (error) {

                alert("No fue posible ingresar su votación !!!");
                //console.error('Error en la petición AJAX:', error);
            }
        });

    } else {

        console.log("no he salido de la validacion");
    }

});




/*$("#btnVotar").on('click', function () {

    


    
        //EJECUTANDO LAS VALIDACIONES DEL FORMULARIO
        validacion();
    
        var nombres = $("#nombres").val();
        var alias = $("#alias").val();
        var rut = $("#rut").val();
        var email = $("#email").val();
    
        // VALIDACION DE LOS COMBOBOX PARA QUE SE SELECCIONE UNA OPCION
        if ($("#region").prop("selectedIndex") == 0) {
            alert("Seleccione una región");
        } else {
            var region = $("#region").prop("selectedIndex");
        };
    
        if ($("#comuna").prop("selectedIndex") == 0) {
            alert("Seleccione una comuna");
        } else {
            var comuna = $("#comuna").prop("selectedIndex");
        };
    
        if ($("#candidato").prop("selectedIndex") == 0) {
            alert("Seleccione una región");
        } else {
            var candidato = $("#candidato").prop("selectedIndex");
        };
    
        // VALIDACION DE LOS CHECKBOX PARA ASIGNARLE UN VALOR Y AGREGARLO A LA BASE DE DATOS
    
        if ($("#web").is(":checked")) {
            var web = 1;
        } else {
            var web = 0;
        };
    
        if ($("#tv").is(":checked")) {
            var tv = 1;
        } else {
            var tv = 0;
        };
    
        if ($("#redes").is(":checked")) {
            var redes = 1;
        } else {
            var redes = 0;
        };
    
        if ($("#amigos").is(":checked")) {
            var amigo = 1;
        } else {
            var amigo = 0;
        };
    
    
        var datos = {
    
            nombres: nombres,
            alias: alias,
            rut: rut,
            email: email,
            region: region,
            comuna: comuna,
            candidato: candidato,
            web: web,
            tv: tv,
            redes: redes,
            amigo: amigo,
            funcion: "insertarFormulario"
        }
    
        
    
        var jsonData = JSON.stringify(datos);
        console.log("diccionario de datos: ",jsonData);
    
        $.ajax({
            url: "http://localhost/sistemadevotacion/sistema/php/consultasBDD.php",
            method: "POST",
            dataType: "json",
            data: jsonData,
            success: function (data) {
    
                console.log("Respuesta del formulario exitosa:", data);
    
    
            },
            error: function (xhr, status, error) {
                console.log("error, no muestra los datos para el formulario: " + status + " - " + error);
                console.log("error xhr" + xhr);
               
            }
        });
    
   

});
 */












