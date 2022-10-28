<?php
    $servidor = 'localhost:3308';
    $usuario = 'root';
    $password = '';
    $basededatos = 'ejemplo';
    $conexion = mysqli_connect($servidor,$usuario,$password,$basededatos);

    if (!$conexion) {
        die("No se ha podido conectar con el servidor".mysqli_connect_error());
    }
    echo("Conexión exitosa"."<br>");

    $sql = "insert into administradores(nombre, codigo) values('Sally','333')";
    if (mysqli_query($conexion,$sql)) {
        echo("Nuevo registro creado exitosamente");
    } else {
        echo("Error".$sql."<br>".mysqli_error($conexion));
    }
    mysqli_close($conexion);
?>