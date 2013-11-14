<?php
include("../Conexion/conexionBD.php");
include("../includes/selectores.php");
include("../Conexion/valius.php");

?>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	
		<title>New Puesto</title>
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
		$ustatus = $_POST["STATUS"];
				
		$query="insert into redhospitalaria.puesto( nombre, status) values( '".$unombre."', '".$ustatus."');";
		mysql_query ($query);

		}
?>
	<form method="POST">
		<table  width="600"> 
			<h2>Nombre del Puesto</h2>
				<p><input name ="NOMBRE" type="text" placeholder="Nombre Del Puesto" required=""></p>
				
				<tr>
				<td>Status</td>
							<td>
								<SELECT name="STATUS"> 
								<OPTION SELECTED VALUE = "A">Alta
								<OPTION VALUE= "B">Baja
								</SELECT> 
							</td>
				</tr>
        			</tr>
				
										<button name="entrar" type="submit" ></button>
										<button id="borrar" type="reset"></button>
			</table>
		</form>
	</body>
</html>

 