<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Consulta MySQL</title>
</head>
<body>
<?php
include 'conexion.php';
/*
$host="localhost";
$usuario="root";
$password="";
$Name_DB="aire_db";

$conexion=mysqli_connect($host,$usuario,$password);
mysqli_query($conexion,$Name_DB);
*/
$Selector="SELECT DISTINCT Usuario FROM mqtt_db WHERE 1";
//$Selector="SELECT DISTINCT CHIP_ID FROM sensor_db WHERE 1";
//echo $Selector;

$resultado = mysqli_query($con,$Selector);

?>
<form action="respuesta1.php" method="POST">
  <select name="Usuario">
  <?php
    while ($row=mysqli_fetch_array($resultado))
      {
       echo "<option>";
        echo $row[0];
        echo "</option>";
      }
    mysqli_close();
  ?>
  </select><br>
  <input type="date" name="Fecha" ><br>
  <input type="submit" name="Enviar" >
</form>
</body> 
</html>