<?php
  include("coneccion.php");
  ?>
<html>
<head>
  <title>listado</title>

</head>
<body>
<?php



 $sql="SELECT * FROM pasientes";
          $result=mysql_query($sql,$conexio);

          echo "<table border='1' width=50% aling=ceter";
          echo "<tr aling=center><td><b>id</b></td><td><b>nombre</b></td><td><b>direccion</b></td><td><b>telefono</b></td><td><b>tiposangre</b></td><td><b>peso</b></td><td><b>estatus</b></td><td><b>opciones</b></td></tr>";
          while ($row=mysql_fetch_array($result)) 
          {
            echo "<TR><TD>".$row["ID_PASIENTE"]."</TD>
              <TD>".$row["NOMBRE"]."</TD><TD>".$row["DIRECCION"]."</TD>
              <TD>".$row["TELEFONO"]."</TD><TD>".$row["TIPO_SANGRE"]."</TD>
              <TD>".$row["PESO"]."</TD><TD>".$row["ESTATUS"]."</TD>";
?>
          <td> <a href="editar.php?id=<?php echo $row["ID_PASIENTE"]; ?>">editar</a></td>
         </tr>
<?php
          }
          echo "</table>";
          mysql_close();
?>
<center>
<br>
<form method="POST" action="nuevo.html">
  <input type="submit" name"enviar" value="nuevo!!">
  
</form>
</center>
</body>
</html>

