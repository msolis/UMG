
<?php
  include("coneccion.php");
  ?>
  <html>
  <head>
    <title></title>
  </head>
  <body>
  
  <?php

		      $id=$_GET["id"];
          $Nombre="";
          $Direccion="";
          $Telefono="";
          $Tipo_Sangre="";
          $Peso="";
          $Estatus="";
          if (isset($_POST["enviar"]))
           {          
         
          $Nombre=$_POST["nombre"];
          $Direccion=$_POST["direccion"];
          $Telefono=$_POST["telefono"];
          $Tipo_Sangre=$_POST["tiposangre"];
          $Peso=$_POST["peso"];
          $Estatus=$_POST["estatus"];

          $query="UPDATE hospitaldb.pasientes SET ID_PASIENTE=".$id.",Nombre='".$Nombre."',Direccion='".$Direccion."',Telefono='".$Telefono."',Tipo_Sangre'".$Tipo_Sangre."',Peso'".$Peso."',Estatus'".$Peso."'";
          	mysql_query($query);
      }
      if (isset($id))
       {
      	$result = mysql_query("SELECT  ID_PASIENTE,NOMBRE, DIRECCION, TELEFONO, TIPO_SANGRE,PESO,ESTATUS FROM hospitaldb.pasientes WHERE ID_PASIENTE = ".$id.";");
      		echo mysql_error();

      		if ($result ==0)
      		{
      		echo "eror";
      		}
      		else
      		{
      	  $row_array = mysql_fetch_array($result);
          $id=$row_array[0];
          $Nombre=$row_array[1];
          $Direccion=$row_array[2];
          $Telefono=$row_array[3];
          $Tipo_Sangre=$row_array[4];
          $Peso=$row_array[5];
          $Estatus=$row_array[6];

      		}
       }
  ?>
  <form method="POST" action="edguardar.php">
     <table  width="600">
                        <h2>
                          Editando pasiente <?php echo "editando pasiente! <br> pasiente: <b>".$Nombre."</b> <br>depi: <b>".$id."</br>" ?>
                        </h2>
                                <p>dpi<input name ="id" value= "<?php echo $id ?>"</p>

                                <p>Nombre<input name ="nombre"  value= "<?php echo $Nombre ?>" required=""></p>
                                
                                <p>Direccion<input name = "direccion"  value= "<?php echo $Direccion?>"></p>
                                <p>Telefono<input name = "telefono"  value= "<?php echo $Telefono?>"></p>
                                
                                <p>Tipo de Sangre<input name = "tiposangre"  value= "<?php echo $Tipo_Sangre?>"></p>
                                
                                <p>Peso<input name = "peso"  value= "<?php echo $Peso?>"></p>
                                
                                <p>Estatus<input name = "estatus"  value= "<?php echo $Estatus?>"></p>
                                
                                <INPUT type="submit" NAME="enviar" VALUE="Guardar!">
                </table>
  </form>
   </body>
  </html>