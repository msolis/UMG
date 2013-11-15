<?php
include("../Conexion/conexionBD.php");
include("../includes/selectores.php");
include("../Conexion/valius.php");
?>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	
		<title>New Usuario</title>
				<link rel="stylesheet" href="../css/base.css">
				<link rel="stylesheet" href="../css/skeleton.css">
				<link rel="stylesheet" href="../css/layout.css">	
				<link rel="stylesheet" href="../css/principal.css">
				
</head>
<body>
	<?php include("../includes/menu.php"); ?>
	<tbody>
<?php 

		if (isset($_POST["NOMBRE"]))

		{
		
		$unombre = $_POST["NOMBRE"];
		$password = $_POST["CLAVE"];
		$uhospital = $_POST["HOSPITAL"];
		$ustatus= $_POST["STATUS"];
		$upermisos = $_POST["PERMISOS"];
		
		$contra= md5 ($password);
			
		$query="insert into redhospitalaria.usuario(nombre, clave, hospital, status, permisos) values( '".$unombre."', '".$contra."', ".$uhospital.", '".$ustatus."', ".$upermisos.");";
		mysql_query ($query);
		echo "qry";
		}

?>

	<form method= "POST">
		<table width="600">
			<h2>Nuevo Usuario</h2>
				<p><input name = "NOMBRE" type = "text" placeholder= "nombre" requierd></p>
				<p><input name = "CLAVE" type= "password" placeholder="clave" required=""></p>
					<tr>
					<td>Hospital</td>
					<td>
					<select name = "HOSPITAL">
<?php
	nuevoselector("hospital", "nombre", "hospital", "") ;  
?>
	        		</select>
	        		</td>
        		</tr>
        		<td>Status</td>
        					<td>
        						<SELECT NAME="STATUS"> 
								<OPTION SELECTED VALUE = "A">Alta
								<OPTION VALUE= "B">Baja
								</SELECT> 
							</td>
									<tr>
										<td>Permisos</td>
										<td>
										<select name = "PERMISOS">
<?php
	nuevoselector("permisos", "nombre_permiso", "permisos", "");   
?>
						        		</select>
						        </tr>		
								 <button name="entrar" type="submit" ></button>
								 <button id="borrar" type="reset"></button>
									
				</table>
			</form>
		</tbody>
	</body>
</html>

