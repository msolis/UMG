<?php include("../conexion/conexion.php"); ?>
<html>
<head>
	<title>Editar empleado </title>
</head>
<body>
<?php 

					$idempleado = "";
					$Nombre = "";
					$Apellido = "";
					$Dpi ="";
					$Telefono = "";
					$Sexo = "";
						
					if(isset ($_POST["boton"])){
					$idempleado = $_POST["idempleado"];
			        $Nombre = $_POST¨["NOMBRE"];
		            $Apellido = $_POST["APELLIDO"];
					$Dpi = $_POST["DPI"];
					$Telefono = $_POST["TELEFONO"];
					$Sexo = $_POST["SEXO"];
								
					if ( $Dpi != $Dpi ){
				header("Location: editar_empleado.php?id=" . $idempleado . "&errro=234");
			}else{
				$qry = "update empleado set empleado = '" . $Nombre . "', Nombre = '" . $Apellido . "', Apellido = " . $Dpi . " where idempleado = ". $idempleado;
				mysql_query($qry);
				header("Location: editar_empleado.php?id=" . $idempleado);
}

		}else{

			if (!isset($_GET["id"])){
				header("Location: lista.php");
			}else{
				$idempleado = $_GET["id"];

				$qry = "select idempleado, Nombre, Apellido, Dpi from empleado where idempleado = " . $idempleado;
				$result = mysql_query($qry);
				$rowData = mysql_fetch_array($result);
				$rowCount = mysql_num_rows($result);

				if ($rowCount == 0){
					header("Location: lista.php");
				}else{
					$empleado = $rowData["Nombre"];
					$hospital_idhospital = $rowData["hospital_idhospital"];
					
						}

			}
		}
	?>
	<form action="editar_empleado.php" method="post">
		<input type="hidden" name="idempleado" value="<?php echo $idempledo; ?>">
		<table>
			<tr>
				<td>Empleado</td>
				<td>
					<input name="empleado" type="text" value="<?php echo $empleado; ?>">
				</td>
			</tr>

			<tr>
				<td>Hospital</td>
				<td>
					<select name="hospital_idhospital">
						<?php
							$qryh = "select idhospital, nombre from hospital;";
							$resulth = mysql_query($qryh);
							$rowCount = mysql_num_rows($rowCount);
							while($row = mysql_fetch_array($resulth, MYSQL_BOTH))
							{
								?>
								<option value="<?php echo $row["idhospital"]; ?>"  <?php if ($row["idhospital"] == $hospital_idhospital) echo " selected "; ?> ><?php echo $row["nombre"]; ?></option>
								<?php
							}


?>
					</select>
				</td>
			</tr>

			<tr>
				<td>Nombre</td>
				<td>
					<input name="Nombre" type="text" value="">
				</td>
			</tr>

			<tr>
				<td>Dpi</td>
				<td>
					<input name="DPI" type="text" value="">
				</td>
			</tr>

			<tr>
				<td></td>
				<td>
					<input name="boton" type="submit" value="Guardar">
				</td>
			</tr>

		</table>	
	</form>
</body>
</html>

















