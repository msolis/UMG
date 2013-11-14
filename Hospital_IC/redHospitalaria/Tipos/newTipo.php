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

		if (isset($_POST["NOMBRE"]))

		{
		
		
		$unombre = $_POST["NOMBRE"];
		
				
		$query="insert into redhospitalaria.titulo( nombre_titulo) values( '".$unombre."');";
		mysql_query ($query);

		}
?>
	<form method="POST">
		<table  width="600"> 
			<h2>Nombre del Titulo Obtenido</h2>
				<p><input name ="NOMBRE" type="text" placeholder="Nombre Del Titulo Obtenido" required=""></p>
				
			
        			</tr>
				
										<button name="entrar" type="submit" ></button>
										<button id="borrar" type="reset"></button>
			</table>
		</form>
	</body>
</html>

 