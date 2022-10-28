<?php
    $servidor='localhost:3308';
    $basededatos='ejemplo';
    $usuario='root';
    $password='';
    $dsn_opciones=[PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION];

    try {
        $conexion = new PDO("mysql:host=$servidor;dbname=$basededatos", $usuario, $password, $dsn_opciones);
        echo("Conexión Exitosa"."<br>");
    } catch (PDOException $error){
        echo("Error de Conexión"."<br>".$error->getMessage());
    }
    $id = '1';
    $nombre = 'Eduardo';
    $apellido = 'Ascencio';
    $control = '1234567890';

    $inserta = $conexion->prepare("insert into usuarios(id,nombre,apellido,control) values (:id, :nombre, :apellido, :control)");

    $inserta->bindParam(":id", $id);
    $inserta->bindParam(":nombre", $nombre);
    $inserta->bindParam(":apellido", $apellido);
    $inserta->bindParam(":control", $control);

    if ($inserta->execute()) {
        echo("Nuevo registro creado sin problema");
    } else {
        echo("Incapaz de crear registro");
    }
    unset($conexion);
?>