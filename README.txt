VERSIONES UTILIZADAS PARA EL PROYECTO

--phpMyAdmin SQL Dump  version 5.2.1
--Versión de PHP: 8.0.30
--Xampp VERSION 8.0.30

► PREPARACION DEL AMBIENTE DE TRABAJO


-VISUAL STUDIO CODE VERSION 1.85.1 

SE INSTALA XAMPP EN EL EQUIPO EN UNA RUTA LOCAL. (VERISON 8.0.30)

SE INSTALARON LAS SIGUIENTES LIBRERIAS: PHP EXTENSION PACK
                                        PHPFMT - PHP FORMAT
                                        PHP SERVER

- LUEGO DE INSTALAR LAS LIBRERIAS:

DEBE DIRIGIRSE A MODIFICAR LAS VARIABLES DE ENTORNOS DEL SISTEMA PARA AGRAGAR PHP AL PATH.

(MI RUTA ES: C:\xampp\php) LA RUTA DE USTED PUEDE CAMBIAR, DEPENDIENDO DEL LUGAR DE INSTALACIÓN DE XAMPP.

EN VISUAL STUDIO CODE DEBE IR A CONFIGURACIONES (SETTINGS) Y BUSCAR PHP, DEBE BUSCAR LA OPCION "PHP: Executable path"
Y DEBE SELECCIONAR "EDITAR EN SETTINGS.JSON" (Edit in settings.json)
Y DENTRO DEL CODIGO JSON DEBE PEGAR ESTA LINEA DE CODIGO. 

----- "php.validate.executablePath": "c:\\xampp\\php\\php.exe", 
ESTO ES LA RUTA DEL PHP A UTILIZAR DESDE XAMPP (DEBE SER SU RUTA DE INSTALACION DE XAMPP).


► INSTALACION DEL PROYECTO 

EL PROYECTO DEBE SER ALOJADO EN LA SIGUIENTE RUTA: C:\xampp\htdocs (DEBE SER SU RUTA DE INSTALACION DE XAMPP).

(DESDE GIT DEBE POSICIONARSE EN LA RUTA Y CLONAR EL PROYECTO PARA QUE SEA VIABLE EL USO).


► EL PROYECTO SE COMPONE DE UNA CARPETA PADRE LLAMADA "SISTEMADEVOTACION"
QUE A SU VEZ CONTIENE 2 CARPERAS ADICIONALES:

-sistema
-SQL

LA CARPETA "sistema" CONTIENE LOS ARCHIVOS HTML, CSS, PHP Y JAVASCRIPT.
LA CARPETA "SQL" CONTIENE LA BASE DE DATOS UTILIZADA EN EL PROYECTO.

PARA INSTALAR LA BASE DE DATOS EN PHPMyAdmin DEBE INICIAR "XAMPP" Y EN LOS "modulos" "apache" y "mysql"
LA OPCION  "action" DEBE ESTAR EN "start" Y PARA INGRESAR A LA BASE DE DATOS DEBE PRESIONAR EN LA OPCION 
"admin" DONDE SE ABRIRÁ EL NAVEGADOR CON LA INTERFAZ DE phpMyAdmin.


PARA IMPORTAR LA BASE DE DATOS DEBE PRESIONAR EN LA OPCION "IMPORTAR" DEL MENÚ DE OPCIONES VISIBLE Y SEGUIR 
LAS INSTRUCCIONES DE IMPORTACION. 

► CON LA BASE DE DATOS INSTALADA Y EL ID DE PROGRAMACIÓN CONFIGURADO PARA TRABAJAR, EN EL NAVEGADOR DEBE ESCRIBIR "localhost"
Y DEBE ENVIARLO AL DASHBOARD DE phpMyAdmin


► EN EL DOCUMENTO HTML DEBE PRESIONAR CON EL CLICK DERECHO Y EN EL MENÚ DE OPCIONES DEBE BUSCAR 
"PHP SERVER: Server Project" Y CON ESTO EL SERVIDOR DE PHP ABRIRÁ EL PROYECTO EN EL NAVEGADOR PARA INTERACTUAR CON EL 
FORMULARIO DE VOTACIONES.


















