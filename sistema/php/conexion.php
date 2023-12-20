<?php  


class Connection{
    /*================================================
    Informacion de la base de datos
    ================================================*/

    static public function infoDatabase(){
        $infoDB = array(
            "host"=> "localhost",
            "database" => "sistemadevotaciones",
            "user" => "root",
            "pass" => ""
        );

        return $infoDB;
    }

    // /================================================
    // Conexiona a la base de datos
    // ================================================/
     static public function connect(){
        try{
            
            $conexion = new PDO("mysql:host=localhost;dbname="
                                .Connection::infoDatabase()["database"]
                                ,Connection::infoDatabase()["user"]
                                ,Connection::infoDatabase()["pass"]);
           
        }
        catch(PDOException $e){
            die("Error en base de datos: ".$e->getMessage());
        }
        return $conexion;
     }
}










?>