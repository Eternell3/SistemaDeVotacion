<?php
header("Access-Control-Allow-Origin: http://localhost:3000");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");

require_once "conexion.php";

/// FUNCION insertarFormulario

function insertarFormulario($nombres, $alias, $rut, $email, $region, $comuna, $candidato, $web, $tv, $redes, $amigo)
{

    //INSERTAR VOTANTES
    $queryStringVotantes = "
        INSERT INTO votante(rut,nombres,alias,email)
        values('" . $rut . "','" . $nombres . "','" . $alias . "','" . $email . "')
   ";

    $consultaVotante = Connection::connect()->prepare($queryStringVotantes);
    $consultaVotante->execute();

    //INSERTAR FORMULARIO
    $queryStringFormulario = "
   INSERT INTO formulario(RUT_VOTANTE, ID_CANDIDATO, ID_REGION, ID_COMUNA, VIA_WEB, VIA_TV, VIA_REDES_SOCIALES, VIA_AMIGOS)
        VALUES ('" . $rut . "', '$candidato', '$region', ' $comuna','$web', '$tv', '$redes', '$amigo')
    ";

    $consultaFormulario = Connection::connect()->prepare($queryStringFormulario);
    $consultaFormulario->execute();

}

/// FUNCION seleccionarRegion

function seleccionarRegion()
{

    try {
        $queryString = "
                        SELECT  REGION_ID
                               ,REGION_NOMBRE
                        FROM regiones

        ";
        $consulta = Connection::connect()->prepare($queryString);

        $consulta->execute();
        $result = $consulta->fetchAll(PDO::FETCH_ASSOC);
        header('Content-Type: application/json');
        return json_encode($result);

    } catch (PDOException $e) {

        die("no se pudo ejecutar la consulta " . $e->getMessage());
    }
};

/// FUNCION seleccionarComuna

function seleccionarComuna($codigo_region)
{

    try {
        $queryString = "
                        SELECT c.comuna_nombre
                            ,c.comuna_id
                        from comunas c left join provincias p
                        on c.provincia_id = p.provincia_id
                        left join regiones r
                        on p.region_id  = r.REGION_ID
                        where r.REGION_ID = " . $codigo_region;

        $consulta = Connection::connect()->prepare($queryString);

        $consulta->execute();
        $result = $consulta->fetchAll(PDO::FETCH_ASSOC);

        header('Content-Type: application/json');
        return json_encode($result);

    } catch (PDOException $e) {

        die("no se pudo ejecutar la consulta " . $e->getMessage());
    }
};

/// FUNCION seleccionarCandidato

function seleccionarCandidato()
{

    try {
        $queryString = "
                        select id_candidato
                        ,nombres_candidato
                        from candidato
        ";

        $consulta = Connection::connect()->prepare($queryString);

        $consulta->execute();
        $result = $consulta->fetchAll(PDO::FETCH_ASSOC);

        header('Content-Type: application/json');
        return json_encode($result);

    } catch (PDOException $e) {

        die("no se pudo ejecutar la consulta " . $e->getMessage());
    }
};

function verificarRut($rut_verificar)
{

    try {
        $queryString = "
         SELECT rut FROM votante WHERE rut = :rut_verificar
         ";

        $consulta = Connection::connect()->prepare($queryString);

        $consulta->execute([':rut_verificar' => $rut_verificar]);
        $result = $consulta->fetchAll(PDO::FETCH_ASSOC);

        header('Content-Type: application/json');

        $existe = count($result) > 0;
        $respuesta = array('existe' => $existe);
        
        return json_encode($respuesta);

    } catch (PDOException $e) {

        die("no se pudo ejecutar la consulta " . $e->getMessage());
    }

}

///////////////////////////   VALIDACIONES DESDE JAVASCRIPT PARA VALIDAR AJAX   METODOS POST Y GET   ///////////////////////////

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $nombres = isset($_POST['nombres']) ? $_POST['nombres'] : '';
    $alias = isset($_POST['alias']) ? $_POST['alias'] : '';
    $rut = isset($_POST['rut']) ? $_POST['rut'] : '';
    $email = isset($_POST['email']) ? $_POST['email'] : '';
    $region = isset($_POST['region']) ? $_POST['region'] : '';
    $comuna = isset($_POST['comuna']) ? $_POST['comuna'] : '';
    $candidato = isset($_POST['candidato']) ? $_POST['candidato'] : '';
    $web = isset($_POST['web']) ? $_POST['web'] : '';
    $tv = isset($_POST['tv']) ? $_POST['tv'] : '';
    $redes = isset($_POST['redes']) ? $_POST['redes'] : '';
    $amigo = isset($_POST['amigo']) ? $_POST['amigo'] : '';

    if ($web === 'on') {
        $web = 1;
    } else {
        $web = 0;
    }

    if ($tv === 'on') {
        $tv = 1;
    } else {
        $tv = 0;
    }

    if ($redes === 'on') {
        $redes = 1;
    } else {
        $redes = 0;
    }

    if ($amigo === 'on') {
        $amigo = 1;
    } else {
        $amigo = 0;
    }

    $funcion = isset($_POST['funcion']) ? $_POST['funcion'] : '';

    if ($funcion === 'insertarFormulario') {

        $resultado = insertarFormulario($nombres, $alias, $rut, $email, $region, $comuna, $candidato, $web, $tv, $redes, $amigo);
        print_r("La función es valida y trae los datos");

    } else {

        print_r("La función no es válida");
    }

    echo json_encode($resultado);

} else {

    if (isset($_GET['funcion'])) {

        $FUNCTION = $_GET['funcion'];

        switch ($FUNCTION) {

            case 'seleccionarRegion':
                print_r(seleccionarRegion());
                break;

            case 'seleccionarComuna':
                if (isset($_GET['region_id'])) {

                    $parametro = $_GET['region_id'];
                    print_r(seleccionarComuna($parametro));

                } else {

                    echo json_encode(array('error' => 'Falta el parámetro "region_id" para seleccionarComuna'));

                }
                break;

            case 'seleccionarCandidato':
                print_r(seleccionarCandidato());
                break;

            case 'verificarRut':
                if (isset($_GET['valorInput'])) {

                    $rut_verificar = $_GET['valorInput'];
                    print_r(verificarRut($rut_verificar));
                    break;

                } else {

                    echo json_encode(array('error' => 'Falta el parámetro "valorInput" para verificarRut'));
                }

            default:
                echo json_encode(array('error' => 'Función no válida.'));

        }

    } else {
        echo json_encode(array('error' => 'Funcion viene NULL.'));

    }
    ;

}
