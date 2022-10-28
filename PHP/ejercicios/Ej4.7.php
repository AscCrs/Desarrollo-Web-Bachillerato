<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ejercicio 4.7</title>
</head>
<body>
    
    <?php
        if ($gestor = opendir('fotos'))
        {
         echo "<table border=1>";
         echo "<tr>";
         $i=0;
         while (false !== ($archivo = readdir($gestor)))
        {
            if ($archivo!="." && $archivo!="..") {
                if ($i==4) {
                    $i=0;
                    echo "</tr>";
                    echo "<tr>";
                }
                $i++;
                echo "<td>";
                echo "<a href=fotos/$archivo><img src=fotos/$archivo></a>";
                echo "</td>";
            }
        }
        echo "</tr>";
        echo "</table>";
        closedir($gestor);
        }        
    ?>

</body>
</html>