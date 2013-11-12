<?php 
	include("../includes/verifysession.php");
	include("../includes/conexion.php");
	
	//devolucion de departamentos filtrados por pais
	$qry = "select id, descripcion from departamento where estatus = 'A' ";
	if (isset($_POST["pais"])){
		$pais = $_POST["pais"];
		$qry .= " and pais = " . $pais;
		
	}
	$stmt = $db->prepare($qry);
	$stmt->execute();
	$result = $stmt->get_result();
	$count = mysqli_num_rows($result);
	if ($count > 0){
		while ($row = $result->fetch_assoc()) {
			$json[] = $row;
		}
		echo json_encode($json);
	}else
		echo json_encode(null);
	
	
	
?>
