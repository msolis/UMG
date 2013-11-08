<!DOCTYPE html>
<html lang="es">
<head>
	<title>Login</title>

	<?php
			
			$error = "";

		if(isset($_POST["usuario"])){

			$usuario = $_POST["usuario"];
			$clave = $_POST["clave"];

			$qry = "select idusuario from hospital.usuario where usuario = '" . $usuario . "' and contrasena = '" . $clave . "';";
			$result = mysql_query( $qry )  or die('SQL Error :: '.mysql_error());;
			$rowCount = mysql_num_rows($result);

			if ($rowCount == 0){
				$error = "Usuario o Contraseña no validos.";
			}else{
				
				$rowArray = mysql_fetch_array($result);

				session_start();
				$_SESSION["idusuario"] = $rowArray["idusuario"];
				header("Location: ../inicion/home.php");
			}

		}
	?>
</head>
<body>
	<?php 
		if($error != ""){
			echo $error;
		}
		?>
	<form method="post" action="login.php" >
		Usuario: <input name="usuario" type="text" value="" />	
		<br />

		Clave: <input name="clave" type="password" value="" />	
		<br />

		<input type="submit" value="Entrar" />
	</form>

</body>
</html>