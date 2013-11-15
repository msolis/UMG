<?php

	include("../includes/verifysession.php");
	include("../includes/conexion.php");
	
	$table = $_GET["table"];
	$campo = "";
	$qry = "select ";
	switch ($table) {
		case 1:{
			// pacientes
			$paciente = $_GET["paciente"];
			$Id = $_GET["id"];
			$campo = "foto";
			$qry .= " foto from paciente_foto where corporacion = $USER_CORPORATION and paciente = $paciente  and id = $Id";
			break;
		}
		case 2:{
			// pacientes
			$Id = $_GET["id"];
			$campo = "imagen";
			$qry .= " imagen from medico where corporacion = $USER_CORPORATION and id = $Id";
			break;
		}
	}
	$stmt = $db->prepare($qry);
	$stmt->execute();
	$result = $stmt->get_result();
	$row = mysqli_fetch_array($result);
	
	header("Content-type: image/jpeg");
	echo $row[$campo];
	
	$db->close();

?>