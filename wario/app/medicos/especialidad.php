<?php
	include("../includes/verifysession.php");
	include("../includes/conexion.php");
	if ( isset($_POST["boton"]) ){

		$qry = "";
		$Especialidad = $_POST["Especialidad"];
		$Medico = $_POST["Medico"];
		$Fecha = $_POST["Fecha"];
		$Observacion = $_POST["Observacion"];
		$Pais = $_POST["Pais"];
		$Lugar = $_POST["Lugar"];

		echo "Especialidad " . $Especialidad;
		echo "Medico " . $Medico;
		echo "Fecha " . $Fecha;
		echo "Observacion " . $Observacion;
		echo "Pais " . $Pais;
		echo "Lugar " . $Lugar;

		
		$Especialidadn = $_POST["Especialidadn"];
		echo "Especialidadn " . $Especialidadn;

		if ( $Especialidad == "") {
			$qry = "insert into medico_especialidad (corporacion, medico, especialidad, fecha, observacion, fecharegistro, pais, lugar) values (?, ?, ?,?,?, curdate(), ?, ?);";
			$stmt = $db->prepare($qry);
			$stmt->bind_param('iiissis', $USER_CORPORATION, $Medico, $Especialidadn, $Fecha, $Observacion, $Pais, $Lugar);
		}else{
			
			$qry = "update medico_especialidad set especialidad = ?, fecha = ?, observacion = ?, pais = ?, lugar = ? where corporacion = ? and medico = ? and especialidad = ?";
			$stmt = $db->prepare($qry);
			echo $stmt->error;
			$stmt->bind_param('issisiii',  $Especialidadn, $Fecha, $Observacion, $Pais, $Lugar, $USER_CORPORATION, $Medico, $Especialidad);
		}
		echo $qry;
		$stmt->execute();
		$result = $stmt->get_result();
		

		if (!$result){
			header("Location: edit.php?id=$Medico");
		}else{
			$textError = "Ha ocurrido un Error, No se pudo guardar el Usuario. " . mysqli_stmt_error($stmtinsert) . "asdf";
			$typeError = "error";
		}

	}

?>