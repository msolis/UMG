

<?php include("../include/validacion.php") ?>
<?php include("../include/conexion.php") ?>
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

			 $result = mysql_query("select  count(*) as campo from usuario_empleado where idusuario_empleado = '".$usuario."' and clave = '".$clave."' and privilegios = '2';");

			if ($result == 0)
				echo "USUARIO O CONTRASEÑA NO VALIDO";
			else{
			
				$row_array = mysql_fetch_array($result);
				$conteo = $row_array[0];
				if ($conteo == 0)
					echo "USUARIO NO AUTORIZADO PARA HACER CABIOS";
					else
					{
						header("Location: ../js/pasiente/ingreso.php");
					}
					
				
			}

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

