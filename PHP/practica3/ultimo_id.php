<?php
    $servidor = 'localhost:3308';
    $basededatos = 'ejemplo';
    $usuario = 'root';
    $password = '';
    $dsn_opciones = [PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION];

    try {
        $conexion = new PDO("mysql:host=$servidor;dbname=$basededatos", $usuario, $password, $dsn_opciones);
        echo("Conexión Exitosa".'<br>');
    } catch (PDOException $error){
        echo("Error de Conexión"."<br>".$error->getMessage());
    }

    $nombre = 'Cristopher Cruz';
    $codigo = '263';

    $inserta = $conexion->prepare("insert into administradores(nombre,codigo) values(:nombre, :codigo)");

    $inserta->bindParam(":nombre", $nombre);
    $inserta->bindParam(":codigo", $codigo);

    if ($inserta->execute()) {
        echo("Nuevo registro creado sin problema"."<br>");
    } else {
        echo("Incapaz de crear registro"."<br>");
    }
    
    $id = $conexion->lastInsertId();
    echo("El último id insertado es ".$id."<br>");

    unset($conexion);
?>