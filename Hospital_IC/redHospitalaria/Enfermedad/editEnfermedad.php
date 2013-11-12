<?php
include("../Conexion/conexionBD.php");
include("../includes/selectores.php");
include("../Conexion/valius.php");
?>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	
		<title>Editar Tipo Consulta</title>
				<link rel="stylesheet" href="../css/base.css">
				<link rel="stylesheet" href="../css/skeleton.css">
				<link rel="stylesheet" href="../css/layout.css">	
				<link rel="stylesheet" href="../css/principal.css">
				
</head>
<body>
	<?php include("../includes/menu.php"); ?>
	
	<tbody>
<?php 

					$uenfermedad = $_GET["Id"];
					$unombre_enfermedad = "";					
					$utratamiento ="";
						
					if(isset ($_POST["entrar"])){

					$unombre_enfermedad = $_POST["NOMBRE_ENFERMEDAD"];
					$utratamiento = $_POST["TRATAMIENTO"];
					
					$query = "UPDATE redhospitalaria.enfermedad SET NOMBRE_ENFERMEDAD = '".$unombre_enfermedad. "', TRATAMIENTO = '".$utratamiento."' where ENFERMEDAD = ".$uenfermedad;
					
					#$query = "UPDATE redhospitalaria.tipo_consulta SET DESCRIPCION = '".$udescripcion."', ESTATUS= '".$uestatus."' where TIPO_CONSULTA = ".$utipo_Consulta;

					
					mysql_query ($query);
						
					}
					
			if (isset($unombre_enfermedad))
			{   
				$result = mysql_query("SELECT ENFERMEDAD, NOMBRE_ENFERMEDAD, TRATAMIENTO FROM redhospitalaria.enfermedad WHERE ENFERMEDAD= ".$uenfermedad.";");
				#$result = mysql_query("SELECT TIPO_CONSULTA, DESCRIPCION, ESTATUS FROM redhospitalaria.tipo_consulta WHERE TIPO_CONSULTA= ".$utipo_Consulta.";");
			
			echo mysql_error();
			
			if ($result ==0)
			{
			echo "Error";
			}else
			{
			$row_array = mysql_fetch_array($result);

			$uenfermedad = $row_array[0];
			$unombre_enfermedad = $row_array[1];
			$utratamiento = $row_array[2];
			
			}
		}
		
			
	
?>
	<form method="POST">
		<table  width="600"> 
			<h2>Editar Tipo Enfermedad</h2>
				<tr>				
					<td>Nombre de Enfermedad:</td>
					<td><p><input name="NOMBRE_ENFERMEDAD" value="<?php echo $unombre_enfermedad ?>"></p></td>
				</tr>
				<tr>				
					<td>Tratamiento:</td>
					<td><p><input name="TRATAMIENTO" value="<?php echo $utratamiento ?>"></p></td>
				</tr>
				

																									
							<button name="entrar" type="submit" ></button>
										<button id="borrar" type="reset"></button>					
										
		
				</table>
				
			</form>
		</tbody>
	</body>
</html>

