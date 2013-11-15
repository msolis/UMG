<?php include("../conexion/conexion.php"); ?>
<html>
<head>
	<title>Editar Usuario</title>
</head>
<body>
	<?php
		$idusuario = "";
		$usuario = "";
		$clave= "";
		$clave_confirmacion = "";
		$hospital_idhospital = "";

		if (isset($_POST["boton"])){

			$idusuario = $_POST["idusuario"];
			$hospital_idhospital = $_POST["hospital_idhospital"];
			$nombre = $_POST["usuario"];
			$clave = $_POST["clave"];
			$clave_confirmacion = $_POST["clave_confirmacion"];

			if ( $clave != $clave_confirmacion ){
				header("Location: editar.php?id=" . $idusuario . "&errro=234");
			}else{
				$qry = "update usuario set usuario = '" . $nombre . "', contrasena = '" . $clave . "', hospital_idhospital = " . $hospital_idhospital . " where idusuario = ". $idusuario;
				mysql_query($qry);
				header("Location: editar.php?id=" . $idusuario);
			}

		}else{

			if (!isset($_GET["id"])){
				header("Location: lista.php");
			}else{
				$idusuario = $_GET["id"];

				$qry = "select idusuario, usuario, hospital_idhospital from usuario where idusuario = " . $idusuario;
				$result = mysql_query($qry);
				$rowData = mysql_fetch_array($result);
				$rowCount = mysql_num_rows($result);

				if ($rowCount == 0){
					header("Location: lista.php");
				}else{
					$usuario = $rowData["usuario"];
					$hospital_idhospital = $rowData["hospital_idhospital"];
				}

			}
		}
	?>
	<form action="editar.php" method="post">
		<input type="hidden" name="idusuario" value="<?php echo $idusuario; ?>">
		<table>
			<tr>
				<td>Usuario</td>
				<td>
					<input name="usuario" type="text" value="<?php echo $usuario; ?>">
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
				<td>Clave</td>
				<td>
					<input name="clave" type="password" value="">
				</td>
			</tr>

			<tr>
				<td>Confirmacion Clave</td>
				<td>
					<input name="clave_confirmacion" type="password" value="">
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