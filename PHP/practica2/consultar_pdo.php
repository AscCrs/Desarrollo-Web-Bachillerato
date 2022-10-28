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
    $consulta = $conexion->prepare("select * from usuarios");
    $consulta->execute();

    if ($existe=$consulta->rowCount()>0) {
        while ($rows = $consulta->fetch()) {
            echo('id: '.$rows['id'].', nombre: '.$rows['nombre'].', apellido: '.$rows['apellido'].', control: '.$rows['control'].'<br>');
        }
    } else {
        echo("No existen registros");
    }
    $conexion = null;
?>