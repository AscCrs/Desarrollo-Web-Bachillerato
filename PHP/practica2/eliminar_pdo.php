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

    $elimina = $conexion->prepare("delete from usuarios where id=1");

    if ($elimina->execute()) {
        echo("Registro eliminado".'<br>');
    } else {
        echo("Registro no eliminado");
    }
    $conexion = null;
?>