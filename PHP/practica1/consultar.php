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
    $accion_nm="select * from usuarios";
    $consulta_nm=mysqli_query($conexion,$accion_nm);
    $datos_nm=mysqli_fetch_assoc($consulta_nm);
    $cantidad_nm=mysqli_num_rows($consulta_nm);
    echo("$cantidad_nm registro consultado<br>");
    $sql="select id, nombre FROM usuarios";
    if ($result=$conexion->query($sql)) {
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_object()) {
                echo($row->id . ":" . $row->nombre . "\n");
            }
            $result->close();
        }
        else {
            echo("No se encontró ningún registro que coincida con su busqueda");
        }
    }
    else {
        echo "Error: No fue posible ejecutar $sql. " . $conexion->error;
    }
    mysqli_close($conexion);
?>