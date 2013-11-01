

<?php include("include/conexion.php") ?>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="css/styles.css" />
	<title>Login</title>
</head>
<body>
	<?php

		if (isset($_POST["USUARIO"])){
			$usuario = $_POST["USUARIO"];
			$clave = $_POST["CLAVE"];

			if (($clave == "") || ($usuario == "")){
				header("Location: hola.php");
				exit();
			}

			$result = mysql_query("select  count(*) as campo from usuario_paciente where id_usuario = '".$usuario."' and clave = '".$clave."';");
			$nombre = "";				
			if ($result == 0)
				echo "USUARIO O CONTRASEÑA NO VALIDO";
			else{
			
				$row_array = mysql_fetch_array($result);
				$conteo = $row_array[0];
				if ($conteo == 0)
					echo "USUARIO O CLAVE NO VALIDO";
					else
					{
						session_start();
						$_SESSION["inicio_hosp"] = $usuario;
						header("Location: js/menu.php");
						//echo "Nombre: " . $nombre;
					}
					
				
				/*$estatus = $row_array[2];*/
			}

			//echo "Nombre: " . $nombre;
		}
	?>
	<form method="POST" alin >

		<table id="tabla" width="270" height="171" border="0" text-color="black" ;>
			<style type="text/css">
            


        </style>
			<tr>
				<td>Usuario:</td>
				<td>
					<input name="USUARIO" required type="text" value="">
				</td>
			</tr>
			<tr>
				<td>Clave:</td>
				<td>
					<input name="CLAVE" required  type="password" value="">
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
					<input type="submit" value="Iniciar Sesion" alingn="center">
				</td>
			</tr>
		</table>
	</form>

</body>
</html>

