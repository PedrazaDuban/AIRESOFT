<!DOCTYPE html>
<html>
<head>
 <title>Respuesta MySQL</title>
 <meta charset="UTF-8">
</head>
<body>
<?php
include 'conexion.php';
$Fecha = $_POST['Fecha'];
$Usuario = $_POST['Usuario'];
echo $Fecha;
echo "</br>";
Echo $Usuario;

$conexion = mysqli_connect("localhost", "root", "");
mysqli_select_db($conexion,"mqtt_db" );


function tablaDeTopics ($Usuario,$Ano,$Mes,$Dia) {
    $consulta="SELECT Fecha, Topic, Mensaje FROM mqtt_db WHERE year(Fecha) = '$Ano' AND month(Fecha) = '$Mes' AND day(Fecha) = '$Dia' AND Usuario= '$Usuario' AND Topic!= 'temperatura'";
    $resultado=mysqli_query($conexion,$consulta);

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

    while ($row=mysqli_fetch_array($resultado))
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
tablaDeTopics($Usuario, $Ano , $Mes, $Dia);
?>
</body>
</html>