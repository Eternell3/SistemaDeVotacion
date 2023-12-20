<?php
header("Access-Control-Allow-Origin: http://localhost:3000");

require_once "conexion.php";

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
}

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
}

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
}

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
            
        default:
            echo json_encode(array('error' => 'Función no válida.'));

    }

} else {
    echo json_encode(array('error' => 'Funcion viene NULL.'));

}
