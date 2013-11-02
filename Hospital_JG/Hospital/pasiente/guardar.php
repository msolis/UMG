
<?php
  include("coneccion.php");
  ?>
<html>
<head>
  <title></title>
</head>

<?php

          $id=$_POST["id"];
          $Nombre=$_POST["nombre"];
          $Direccion=$_POST["direccion"];
          $Telefono=$_POST["telefono"];
          $Tipo_Sangre=$_POST["tiposangre"];
          $Peso=$_POST["peso"];
          $Estatus=$_POST["estatus"];
          
          $sql="SELECT ID_PASIENTE FROM pasientes WHERE ID_PASIENTE='".$id."'";
          $result=mysql_query($sql,$conexio);
         if($row=mysql_fetch_array($result))
          {
          	echo "el id <br> ".$id."</bre> ya fue ingresado.";
            exit();
          }
          mysql_query("INSERT INTO pasientes(ID_PASIENTE,NOMBRE,DIRECCION,TELEFONO,TIPO_SANGRE,PESO,ESTATUS)VALUES('$id','$Nombre','$Direccion','$Telefono','$Tipo_Sangre','$Peso','$Estatus');",$conexio);
        echo "Registro Exitoso! <br><br> pasiente: <b>".$Nombre."</b> <br>estatus: <b>".$Estatus."</br>";
       
        mysql_close($conexio);

?> 

<BR><BR>
  <form method="POST" action="listado.php">
    <input type="submit" name"enivar" value= "ver listado!!">
  </form>
<body>

</body>
</html>
