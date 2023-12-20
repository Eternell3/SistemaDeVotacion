<?php
header("Access-Control-Allow-Origin: http://localhost:3000");
require_once "conexion.php";





function seleccionarRegionComuna(){

    try {
    

        $queryString = "
                        SELECT  REGION_ID
                               ,REGION_NOMBRE
                        FROM regiones 
                        
        ";

        $consulta = Connection::connect()->prepare($queryString);

        $consulta -> execute();
        $result = $consulta->fetchAll(PDO::FETCH_ASSOC);

        //echo json_encode(array('resultado' => $result));
        return json_encode($result);

      
       
    }catch(PDOException $e){

        die("no se pudo ejecutar la consulta ".$e->getMessage());

    }

}


print_r(seleccionarRegionComuna());


/*
try{

    $queryString = "select * from regiones";
   
    $consulta = Connection::connect()->prepare($queryString);

    $consulta -> execute();
    $result = $consulta->fetchAll(PDO::FETCH_ASSOC);

    print_r($result);

}catch (PDOException $e){

die("no se pudo ejecutar la consulta ".$e->getMessage());

}

*/ 






?>