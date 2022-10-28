<?php
    //Conexión con base de datos.

    $host = "sql213.byethost.com";
    $user = "b7_25932700";
    $pass = "User2003";
    $db = "b7_25932700_registro";

    //Verificación de conexión

    $con = mysqli_connect($host,$user,$pass,$db)or die("Problemas al Conectar");

    mysqli_select_db($con,$db)or die("Problemas la conectar con la Base de Datos");

    //Recuperar variables del formulario

    $nombre = $_POST['nombre'];
    $apellido = $_POST['apellido'];
    $correo = $_POST['correo'];
    $mensaje = $_POST['mensaje'];

    //Sentencia SQL

    $sql = "INSERT INTO datos VALUES('$nombre','$apellido','$correo','$mensaje')";

    //Ejecución sql

    $ejecutar = mysqli_query($con,$sql);

    if (!$ejecutar) {
        echo "Hubo algún error";
    }
    else {
        echo "Datos guardados Coreectamente<br><a href='index.html'>Volver</a>";
    }
?>