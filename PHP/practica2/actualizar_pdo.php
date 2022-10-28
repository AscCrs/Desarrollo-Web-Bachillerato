<?php
    $servidor='localhost:3308';
    $basededatos='ejemplo';
    $usuario='root';
    $password='';
    $dsn_opciones=[PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION];
    
    try {
        $conexion = new PDO("mysql:host=$servidor;dbname=$basededatos", $usuario, $password, $dsn_opciones);
        echo("Conexión Exitosa".'<br>');
    } catch (PDOException $error){
        echo("Error de Conexión"."<br>".$error->getMessage());
    }

    $actualiza=$conexion->prepare("update usuarios set nombre='Cristopher', apellido='Cruz', control='18330050790158' where id=1");

    if ($actualiza->execute()) {
        echo("Registro actualizado".'<br>');
    } else {
        echo("Registro no actualizado");
    }
    unset($conexion);
?>