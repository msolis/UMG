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
		$uapellido = $_POST["APELLLIDO"];
		$udpi = $_POST["DPI"];
		$utelefono = $_POST["TELEFONO"];
		$udireccion = $_POST["DIRECCION"];
		
		
		
		$query="INSERT INTO redhospitalaria.usuario (usuario.NOMBRE, usuario.CLAVE, usuario.HOSPITAL, usuario.STATUS, usuario.PERMISOS) VALUES( '".$unombre."', '".$password."', ".$uhospital.", '".$ustatus."', ".$upermisos.");";
		mysql_query ($query);

		}

?>
	<form method="POST">
		<table  width="600">
			<h2>Nuevo Usuario</h2>
				
				
				<p><input name ="NOMBRE" type="text" placeholder="nombre" required=""></p>
				<p><input name = "CLAVE" type="password" placeholder="Clave" required=""></p>
				
					<tr>
					<td>Hospital</td>
					<td>
					<select name = "HOSPITAL">
<?php
	nuevoSelector("HOSPITAL", "NOMBRE", "hospital", "") ;  
?>
	        		</select>
	        		</td>
        		</tr>
        		
				<td>Status:</td>
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
	nuevoSelector("PERMISOS", "NOMBRE_PERMISO", "PERMISOS", "");   
?>
						        		</select>
						        		
										<button id="entrar" type="submit"></button>
										<button id="borrar" type="reset"></button>
									</tr>
		</table>
			</form>
		</tbody>
	</body>
</html>

