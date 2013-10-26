<?php
	include("../includes/conexion.php");
	if(isset($_POST["usuario"])){
		$usuario = $_POST["usuario"];
		$clave = $_POST["clave"];
		
		$qry = "SELECT Id from USUARIO where Correo = '" . $usuario . "' and Clave = '" . $clave . "';";
		$result = mysql_query($qry);
		$rowCount = mysql_num_rows($result);
		$rowArray = mysql_fetch_array($result);
		$id = $rowArray[0];
		
		if ($rowCount == 0){
			header("Location: index.php?Error=NO se pudo autenticar el Usuario.");
		}else{
			session_start();
			$_SESSION['hospital_user'] = $id;
			header("Location: ../home/index.php");
		}
		
	}
?>