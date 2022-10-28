<?php
    $servidor='localhost:3306';
    $usuario='root';
    $password='';
    $basededatos='ejemplo';
    $conexion=mysqli_connect($servidor,$usuario,$password,$basededatos);
    if (!$conexion) {
        die("No se ha podido conectar con el servidor".mysqli_connect_error()."<br>");
    }
    echo("Conexión exitosa"."<br>");
    $consulta="delete from usuarios where id='1'";
    if (mysqli_query($conexion,$consulta)) {
        echo("Registro eliminado con éxito"."<br>");
    } else {
        echo("Error: No se pudo eliminar el registro $consulta" . mysqli_error($conexion)."<br>");
    }
    mysqli_close($conexion);
?>