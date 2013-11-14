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

		if (isset($_POST["FECHA_CONSULTA"]))

		{
		
			$ifecha_consulta = $_POST["FECHA_CONSULTA"];
			$ifecha_proxima_consulta = $_POST["FECHA_PROXIMA_CONSULTA"];						
			$ipaciente = $_POST["PACIENTE"];								
			$itipo_consulta = $_POST["TIPO_CONSULTA"];						
			$ienfermedad = $_POST["ENFERMEDAD"];							
			
		$query = "insert into redhospitalaria.consulta (fecha_consulta, fecha_proxima_consulta, paciente, tipo_consulta, enfermedad) values ('".$ifecha_consulta."', '".$ifecha_proxima_consulta."', ".$ipaciente.", ".$itipo_consulta.",".$ienfermedad.");";

			
		mysql_query ($query);

		}
?>
	<form method="POST">
		<table  width="600"> 
			<h2>Nueva Consulta</h2>
			<tr>
							<td>Fecha de la Consulta</td>
							<td>
									
									<p><input name ="FECHA_CONSULTA" type="date" required=""></p>
							</td>
				</tr>
				<tr>
							<td>Fecha de Nueva Consulta</td>
							<td>
									
									<p><input name ="FECHA_PROXIMA_CONSULTA" type="date" required=""></p>
							</td>
				</tr>
							
					
					<tr>
						<td>Paciente</td>
							<td>
								<select name = "PACIENTE">
<?php
	nuevoSelector("PACIENTE", "NOMBRE", "PACIENTE", "") ;  
?>
	        					</select>
	        				</td>
        			</tr>
        			<tr>
        			<td>TIPO CONSULTA</td>
							<td>
								<select name = "TIPO_CONSULTA">
<?php
	nuevoSelector("TIPO_CONSULTA", "DESCRIPCION", "TIPO_CONSULTA", "") ;  
?>
	        					</select>
	        				</td>
        			</tr>
        			<tr>
        			<td>ENFERMEDAD</td>
							<td>
								<select name = "ENFERMEDAD">
<?php
	nuevoSelector("ENFERMEDAD", "NOMBRE_ENFERMEDAD", "ENFERMEDAD", "") ;  
?>
	        					</select>
	        				</td>
        			</tr>
        			
										
										<button id="entrar" type="submit"></button>
										<button id="borrar" type="reset"></button>
		
		</table>
			</form>
		</tbody>
	</body>
</html>



