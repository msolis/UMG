<?php
include("../Conexion/conexionBD.php");
include("../includes/selectores.php");
include("../Conexion/valius.php");

?>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	
		<title>New Empleado</title>
				<link rel="stylesheet" href="../css/base.css">
				<link rel="stylesheet" href="../css/skeleton.css">
				<link rel="stylesheet" href="../css/layout.css">	
				<link rel="stylesheet" href="../css/principal.css">
</head>
<body>
	<?php include("../includes/menu.php"); ?>
	
	
<?php 

		if (isset($_POST["PAIS"]))
		{
		
		$upais = $_POST["PAIS"];
				
		$query="INSERT INTO redhospitalaria.pais( NOMBRE_PAIS) VALUES( '".$upais."');";
		mysql_query ($query);

		}
?>
	<form method="POST">
		<table  width="600"> 
			<h2>Nombre Pais</h2>
				<p><input name ="PAIS" type="text" placeholder="Nombre De Pais" required=""></p>
										<button name="entrar" type="submit" ></button>
										<button id="borrar" type="reset"></button>
			</table>
		</form>
	</body>
</html>

 