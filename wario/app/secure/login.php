<?php
	include("../includes/conexion.php");
	if(isset($_POST["usuario"])){
		$usuario = $_POST["usuario"];
		$clave = $_POST["clave"];
		$contra =md5($clave);
		$stmt = $db->prepare("select corporacion, id from usuario where correo = ? and clave = ?;");
		$stmt->bind_param('ss', $usuario, $contra);
		
		$stmt->execute();
		
		$result = $stmt->get_result();
		
		$rowCount = mysqli_num_rows($result);
		$rowArray = mysqli_fetch_assoc($result);
		
		//variables del usuario
		$corporacion = $rowArray["corporacion"];
		$id = $rowArray["id"];
		echo "coporacion = " . $corporacion;
		echo "id= " . $id;
		echo "count = " . $rowCount;
		if ($rowCount != 1){
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