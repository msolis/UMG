<?php
include("../Conexion/conexionBD.php");
include("../includes/selectores.php");
include("../Conexion/valius.php");

?>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	
		<title>New Consulta</title>
				<link rel="stylesheet" href="../css/base.css">
				<link rel="stylesheet" href="../css/skeleton.css">
				<link rel="stylesheet" href="../css/layout.css">	
				<link rel="stylesheet" href="../css/principal.css">
</head>
<body>
	<?php include("../includes/menu.php"); ?>
	
	<tbody>
<?php 

		if (isset($_POST["NOMBRE_ENFERMEDAD"]))

		{
		
		$unombre_enfermedad = $_POST["NOMBRE_ENFERMEDAD"];
		$utratamiento = $_POST["TRATAMIENTO"];
		
		$query = "INSERT INTO redhospitalaria.enfermedad ( NOMBRE_ENFERMEDAD, TRATAMIENTO) VALUES ( '".$unombre_enfermedad."', ".$utratamiento.");";
		#$query = "INSERT INTO redhospitalaria.tipo_consulta( DESCRIPCION, ESTATUS) VALUES ('".$udescripcion."', '".$uestatus."');";
		
		
		mysql_query ($query);
		echo "$query";

		}
?>
	<form method="POST">
		<table  width="600"> 
			<h2>Nueva Enfermedad</h2>
				
				<p><input name ="NOMBRE_ENFERMEDAD" type="text" placeholder="NOMBRE ENFERMEDAD" required=""></p>
				<p><input name ="TRATAMIENTO" type="text" placeholder="TRATAMIENTO" required=""></p>
										

								</tr>																											
									<button id="entrar" type="submit"></button>
									<button id="borrar" type="reset"></button>
		
		</table>
			</form>
		</tbody>
	</body>
</html>

