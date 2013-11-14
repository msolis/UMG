<?php
include("../Conexion/conexionBD.php");
include("../includes/selectores.php");
include("../Conexion/valius.php");
?>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	
		<title>Editar Paciente</title>
				<link rel="stylesheet" href="../css/base.css">
				<link rel="stylesheet" href="../css/skeleton.css">
				<link rel="stylesheet" href="../css/layout.css">	
				<link rel="stylesheet" href="../css/principal.css">
				
</head>
<body>
	<?php include("../includes/menu.php"); ?>
	
	<tbody>
<?php 
	$iconsulta = $_GET["Id"];				
	$ifecha_consulta = "";							
	$ifecha_proxima_consulta = "";						
	$ipaciente = "";								
	$itipo_consulta = "";						
	$ienfermedad = "";							

		if (isset($_POST["entrar"])) 
		{
			$ifecha_consulta = $_POST["FECHA_CONSULTA"];							
			$ifecha_proxima_consulta = $_POST["FECHA_PROXIMA_CONSULTA"];						
			$ipaciente = $_POST["PACIENTE"];								
			$itipo_consulta = $_POST["TIPO_CONSULTA"];						
			$ienfermedad = $_POST["ENFERMEDAD"];

				$query = "UPDATE redhospitalaria.consulta SET FECHA_CONSULTA= '".$ifecha_consulta."', FECHA_PROXIMA_CONSULTA= '".$ifecha_proxima_consulta."', PACIENTE= ".$ipaciente.", TIPO_CONSULTA= ".$itipo_consulta.", ENFERMEDAD= ".$ienfermedad." where CONSULTA = ".$iconsulta;	
				
					mysql_query ($query);	
		}

				if (isset($iconsulta)) 
				{
					$result = mysql_query("SELECT CONSULTA, FECHA_CONSULTA, FECHA_PROXIMA_CONSULTA, PACIENTE, TIPO_CONSULTA, ENFERMEDAD FROM redhospitalaria.consulta WHERE CONSULTA= ".$iconsulta.";");
							
				echo mysql_error();

					if ($result ==0) 
					{
						echo "Error";
					}else
					{
						$row_array = mysql_fetch_array($result);
										
							$iconsulta = $row_array[0];
							$ifecha_consulta = $row_array[1];
							$ifecha_proxima_consulta = $row_array[2];
							$ipaciente = $row_array[3];
							$itipo_consulta = $row_array[4];
							$ienfermedad = $row_array[5];
			}
		}
		
?>
	<form method="POST">
		<table  width="500"> 
			<h4>Editar Consulta:</h4>
			<tr>
				<td>FECHA DE CONSULTA:</td>
				<td><p><input name="FECHA_CONSULTA" value="<?php echo $ifecha_consulta ?>"></p></td>
			</tr>
			<tr>
		    	<td>FECHA DE PROXIMA CONSULTA:</td>
				<td><p><input name="FECHA_PROXIMA_CONSULTA" value="<?php echo $ifecha_proxima_consulta ?>"></p></td>
			</tr>
			<tr>
				<td>PACIENTE:</td>
				<td>
					<select name = "PACIENTE">
						<?php
							nuevoSelector("PACIENTE", "NOMBRE", "PACIENTE", $ipaciente); 
						 ?>
					</select>
				</td>
			</tr>
			<tr>
				<td>TIPO DE CONSULTA:</td>
				<td>
					<select name = "TIPO_CONSULTA">
						<?php
							nuevoSelector("TIPO_CONSULTA", "DESCRIPCION", "TIPO_CONSULTA", $itipo_consulta); 
						 ?>
					</select>
				</td>
			</tr>
			<tr>
				<td>ENFERMEDAD:</td>
				<td>
					<select name = "ENFERMEDAD">
						<?php
							nuevoSelector("ENFERMEDAD", "NOMBRE_ENFERMEDAD", "ENFERMEDAD", $ienfermedad); 
						 ?>
					</select>
				</td>
			</tr>
									
			
		</table>
			<button name="entrar" type="submit"></button>
			<button id="borrar" type="reset"></button>
		
	</form>
	</tbody>
</body>
</html>