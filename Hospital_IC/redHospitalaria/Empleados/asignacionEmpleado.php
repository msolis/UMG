<?php
include("../Conexion/conexionBD.php");
include("../includes/selectores.php");
include("../Conexion/valius.php");

?>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	
		<title>Asignacion Empleado</title>
				<link rel="stylesheet" href="../css/base.css">
				<link rel="stylesheet" href="../css/skeleton.css">
				<link rel="stylesheet" href="../css/layout.css">	
				<link rel="stylesheet" href="../css/principal.css">
</head>
<body>
<?php include("../includes/menu.php"); ?>

<?php 

		if (isset($_POST["EMPLEADO"]))

		{
		$udatosPersonales = $_POST["EMPLEADO"];
		$uhospital= $_POST["HOSPITAL"];
		$udeptoarea= $_POST["AREA"];
		$upuesto=$_POST["PUESTO"];
		
		$query="INSERT INTO redhospitalaria.empleado(DATOS_PERSONALES, HOSPITAL, DEPTO_AREA,PUESTO) VALUES( ".$udatosPersonales.", ".$uhospital.", ".$udeptoarea.",".$upuesto.");";
		mysql_query ($query);

		}

?>
	<form method="POST">
		<table  width="600"> 
			<h2>Asignacion de Puesto a Empleado</h2>
				
				
				<p><input name ="EMPLEADO" type="text" placeholder="#de dato_Personal" required=""></p>
				<tr>
				<td>HOSPITAL</td>
							<td>
								<select name = "HOSPITAL">
<?php
	nuevoSelector("HOSPITAL", "NOMBRE", "HOSPITAL", "") ;  
?>
	        					</select>
	        				</td>
	        	</tr>
	        	<tr>
	        	<td>AREA DE TRABAJO</td>
							<td>
								<select name = "AREA">
<?php
	nuevoSelector("DEPTO_AREA", "NOMBRE", "DEPTO_AREA", "") ;  
?>
	        					</select>
	        				</td>
	        	</tr>
	        	<tr>
	        	<td>NOMBRE DEL PUESTO</td>
							<td>
								<select name = "PUESTO">
<?php
	nuevoSelector("PUESTO", "NOMBRE", "PUESTO", "") ;  
?>
	        					</select>
	        				</td>
	        		</tr>		
	        		<td>
        								<button name="entrar" type="submit" ></button>
										<button id="borrar" type="reset"></button>
					</tr>
		</table>
			</form>

</body>
</html>	
