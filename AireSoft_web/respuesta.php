<!DOCTYPE html>
<html>
<head>
    <title>Respuesta MySQL</title>
    <meta charset="UTF-8">
</head>
<body>
<?php
include 'conexion.php';

function temperatura_diaria ($Usuario,$Ano,$Mes,$Dia) {
	
	$resultado=mysql_query("SELECT UNIX_TIMESTAMP (Fecha), Mensaje FROM mqtt_db WHERE year(Fecha) = '$Ano' AND month(Fecha)= '$Mes' AND day(Fecha)='$Dia' AND Usuario ='$Usuario' AND Topic != 'temperatura'");
	$row=mysql_fetch_array($resultado);
	echo $row[0];
	 while ($row)
	 {
	  echo "[";
	  echo ($row[0]*1000)-10800000; //le resto 3 horas = 10800000 mill
	  echo ",";
	  echo $row[1];
	  echo "],";
	 }
}
?>

</script>
<?php
function tablaDeTopics ($usuario,$ano,$mes,$dia) {
    
    $resultado=mysqli_query("SELECT fecha, topic, mensaje FROM tabla WHERE year(`fecha`) = '$ano' AND month(`fecha`) = '$mes' AND day(`fecha`) = '$dia' AND `usuario`= '$usuario' AND `topic`!= 'temperatura'");

    echo "<table border='1'>";
    echo "<tr>";
    echo "<td>";
    echo "Fecha";
    echo "</td>";
    echo "<td>";
    echo "Topic";
    echo "</td>";
    echo "<td>";
    echo "Mensaje";
    echo "</td>";
    echo "</tr>";

    while ($row=mysql_fetch_array($resultado))
    {
        echo "<tr>";
        echo "<td>";
        echo $row[0];
        echo "</td>";
        echo "<td>";
        echo $row[1];
        echo "</td>";
        echo "<td>";
        echo $row[2];
        echo "</td>";
        echo "</tr>";
    }
    echo "</table>";
    mysql_close();
}
tablaDeTopics($usuario, $ano , $mes, $dia)
?>
</body>
</html>