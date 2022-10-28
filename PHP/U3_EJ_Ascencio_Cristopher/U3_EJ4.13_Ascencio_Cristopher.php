<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Ejercicio 4.13</title>
</head>
<body>
    
    <center>
        <?php
            $v[1]=90;
            $v[30]=7;
            $v['e']=99;
            $v['hola']=43;
            foreach ($v as $indice => $valor) {
                echo "El elemento de indice $indice vale $valor <br>";
            }            
        ?>
    </center>

</body>
</html>