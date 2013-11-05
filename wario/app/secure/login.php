<?php
	include("../includes/conexion.php");
	if(isset($_POST["usuario"])){
		$usuario = $_POST["usuario"];
		$clave = $_POST["clave"];
		
		$stmt = $db->prepare("select corporacion, id from usuario where correo = ? and clave = ?;");
		$stmt->bind_param('ss', $usuario, $clave);
		
		$stmt->execute();
		
		$result = $stmt->get_result();
		
		$rowCount = mysqli_num_fields($result);
		$rowArray = mysqli_fetch_array($result);
		
		//variables del usuario
		$corporacion = $rowArray[0];
		$id = $rowArray[1];
		echo $rowCount;
		if ($rowCount == 0){
			header("Location: index.php?Error=NO se pudo autenticar el Usuario.");
		}else{
			session_start();
			//save important variables user
			
			$_SESSION['hospital_user'] = $id;
			$_SESSION['hospital_corporacion'] = $corporacion;
			header("Location: ../home/index.php");
		}
		
	}
?>