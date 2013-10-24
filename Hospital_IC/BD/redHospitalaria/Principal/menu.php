<?php
include("../Conexion/conexionBD.php")
?>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	
		<title>Menu</title>
				<link rel="stylesheet" href="../css/base.css">
				<link rel="stylesheet" href="../css/skeleton.css">
				<link rel="stylesheet" href="../css/layout.css">	
				<link rel="stylesheet" href="../css/principal.css">
</head>
<body>
	<ul id="nav">
		<li class="current"><a href="menu.php">Inicio</a></li>
		<li><a href="">Usuario</a>
			<ul>
				<li><a href="../Usuario/usuario.php">Usuarios</a><li>
				<li><a href="../Usuario/newUsuario.php">Nuevo Usuario</a></li>
				<li><a href="../Usuario/editUsuario.php">Edit Usuario.</a></li>
			</ul>
		</li>
		<li><a href="#">Empleados</a>
			<ul>
				<li><a href="#">Empleados</a></li>
				<li><a href="#">Nuevo Empleado</a></li>
				<li><a href="#">Editar Empleado</a></li>
			</ul>
		</li>
		<li><a href="#">Paciente</a>
			<ul>
				<li><a href="#">Pacientes</a></li>
				<li><a href="#">Nuevo Paciente</a></li>
				<li><a href="#">Editar Paciente</a></li>
			</ul>
		</li>	
		<li><a href="#">Consulta</a></li>
		<li><a href="#">Ingresos</a></li>
		<li><a href="#">Farmacias</a></li>
		<li><a href="#">Hospitales</a></li>
		
		<li><a href="../Login/login.php">Salir</a></li>

	</ul>
</body>
</html>