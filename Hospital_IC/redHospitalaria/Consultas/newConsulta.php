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

		if (isset($_POST["DESCRIPCION"]))

		{
		
		$udescripcion = $_POST["DESCRIPCION"];
		$uestatus = $_POST["ESTATUS"];
		
		$query = "INSERT INTO redhospitalaria.tipo_consulta( DESCRIPCION, ESTATUS) VALUES ('".$udescripcion."', '".$uestatus."');";
		mysql_query ($query);
		echo "$query";

		}
?>
	<form method="POST">
		<table  width="600"> 
			<h2>Tipo de Consulta Nueva</h2>
				
				<p><input name ="DESCRIPCION" type="text" placeholder="Descripcion de Consulta" required=""></p>							
							<tr>	
							<td>Estatus</td>
							<td>
								<SELECT NAME="ESTATUS"> 
								<OPTION SELECTED VALUE = "A">Alta
								<OPTION VALUE= "B">Baja
								</SELECT> 
							</td>													
								</tr>																											
									<button id="entrar" type="submit"></button>
									<button id="borrar" type="reset"></button>
		
		</table>
			</form>
		</tbody>
	</body>
</html>

