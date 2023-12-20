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
        url: "http://localhost/sistemadevotacion/sistema/php/consultas.php",
        method: "GET",
        dataType: "json",
        data:{ 
               funcion: 'seleccionarRegionComuna'
        },
        
        success: function (data) {
            try{               
                var jsonData = JSON.stringify(data);
                console.log("Respuesta del servidor:", jsonData);

                $('#region').empty();
                $('#region').append('<option value="0">Seleccione</option>');
                $.each(data, function(index, element) {
                    $('#region').append('<option value="' + element.REGION_ID + '">' + element.REGION_NOMBRE + '</option>');
                });

            }catch(e){
                console.error("Error al analizar JSON:", e);
            }
            console.log(data);

            //console.log("logré entrar al ajax");
        },
        error: function(xhr, status, error){
            console.log("error, no entra a ajax: "+ status +" - "+error);
        } 
    });


});


$('#region').change(function () {

    console.log("hola mundo");

});








