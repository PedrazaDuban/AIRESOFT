<?php
//Define el Usuario, clave, nombre de MySQL y nombre de la base de datos.
 define("DB_USER", "root");
 define("DB_PASS", "");
 define("DB_HOST", "localhost");
 define("DB_NAME", "aire_db");


 // Conexión a la Base de Datos.
 $con = mysqli_connect(DB_HOST, DB_USER, DB_PASS);
 mysqli_select_db($con,DB_NAME) or die( "Unable to select database");


 ?>