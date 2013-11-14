<?php
include("../Conexion/conexionBD.php");
include("../includes/selectores.php");
include("../Conexion/valius.php");

?>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	
		<title>New Departamento</title>
				<link rel="stylesheet" href="../css/base.css">
				<link rel="stylesheet" href="../css/skeleton.css">
				<link rel="stylesheet" href="../css/layout.css">	
				<link rel="stylesheet" href="../css/principal.css">
</head>
<body>
	<?php include("../includes/menu.php"); ?>
	
	
<?php 

		if (isset($_POST["MUNICIPIO"]))
		{
		
		$umunicipio = $_POST["MUNICIPIO"];
		$udepartamento = $_POST["DEPARTAMENTO"];
		
				
		$query="insert into redhospitalaria.municipio( nombre_municipio, departamento) values( '".$umunicipio."', ".$udepartamento.");";
		mysql_query ($query);

		}
?>
	<form method="POST">
		<table  width="600"> 
			<h2>Nombre del Municipio</h2>
				<p><input name ="MUNICIPIO" type="text" placeholder="Nombre Del Municipio" required=""></p>
				
				<td>Departamento</td>
							<td>
								<select name = "DEPARTAMENTO">
<?php
	nuevoselector("departamento", "nombre_departamento", "departamento","") ;  
?>
	        					</select>
	        				</td>
        			</tr>
				
				
										<button name="entrar" type="submit" ></button>
										<button id="borrar" type="reset"></button>
			</table>
		</form>
	</body>
</html>

 