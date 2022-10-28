<?php
    $servidor='localhost:3306';
    $usuario='root';
    $password='';
    $basededatos='ejemplo';
    $conexion=mysqli_connect($servidor,$usuario,$password,$basededatos);
    if (!$conexion) {
        die("No se ha podido conectar con el servidor".mysqli_connect_error());
    }
    echo("Conexión exitosa"."<br>");
    $sql="update usuarios set nombre='Eduardo' where id='1'";
    $consulta=mysqli_query($conexion,$sql) or die(mysqli_error($conexion));
    echo("<br>"."Actualizado 1 registro");
    mysqli_close($conexion);
?>