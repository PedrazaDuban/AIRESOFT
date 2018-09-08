
<?php

$user = $_POST ['user'];
$pass = $_POST ['pass'];

require_once ('Dashboards2_4A.html');
echo "      
  usuario = '$user';
  contrasena = '$pass';
";
require_once ('Dashboards2_4B.html');

?>