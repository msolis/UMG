<?php
	include("../includes/verifysession.php");
	include("../includes/conexion.php");
	if (isset($_FILES['image']) && $_FILES['image']['size'] > 0) {
		
		// Temporary file name stored on the server
		$tmpName = $_FILES['image']['tmp_name'];
		
		// Read the file
		$fp = fopen($tmpName, 'r');
		$data = fread($fp, filesize($tmpName));
		$data = addslashes($data);
		fclose($fp);
		
		$table = $_POST["table"];
		switch ($table) {
			case 1:{
				$Paciente = $_POST["Id"];
				$stmt = $db->prepare("select ifnull(max(id),0)+1 as id from paciente_foto where corporacion = ? and paciente = ?;");
				$stmt->bind_param('ii', $USER_CORPORATION, $Paciente);
				$stmt->execute();
				$result = $stmt->get_result();
				$rowArray = mysqli_fetch_array($result);
				
				$Id = $rowArray["id"];
				
				$query = "insert into paciente_foto (corporacion, paciente, id, fecha, foto, tipofoto, fecharegistro, estatus) ";
				$query .= " values (?, ?, ?, curdate(), '$data', 'image/jpeg', curdate(), 'A')";
				$stmt = $db->prepare($query);
				
				$stmt->bind_param('iii', $USER_CORPORATION, $Paciente, $Id);
				
				$stmt->execute();
				$result = $stmt->get_result();
				header("Location: index.php?id=$Id");
			}
		}
		
	}
	else {
		//header("Location: ../home/");
	}
		
	// Close our MySQL Link
?>