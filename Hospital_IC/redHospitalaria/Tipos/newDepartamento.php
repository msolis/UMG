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

		if (isset($_POST["DEPARTAMENTO"]))

		{
		
		$udepartamento = $_POST["DEPARTAMENTO"];
		$upais = $_POST["PAIS"];
		
				
		$query="insert into redhospitalaria.departamento( nombre_departamento, pais) values( '".$udepartamento."', ".$upais.");";
		mysql_query ($query);

		}
?>
	<form method="POST">
		<table  width="600"> 
			<h2>Nombre del Departamento</h2>
				<p><input name ="DEPARTAMENTO" type="text" placeholder="Nombre Del Departamento" required=""></p>
				
				<td>Pais</td>
							<td>
								<select name = "PAIS">
<?php
	nuevoselector("pais", "nombre_pais", "pais","") ;  
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

 