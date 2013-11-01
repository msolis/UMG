<?php
include("../Conexion/conexionBD.php");
include("../includes/selectores.php");
include("../Conexion/valius.php");

 
 ?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>Login</title>
	
				<link rel="stylesheet" href="../css/base.css">
				<link rel="stylesheet" href="../css/skeleton.css">
				<link rel="stylesheet" href="../css/layout.css">	
				<link rel="stylesheet" href="../css/principal.css">
</head>
<body>


<ul id="nav">
		<li class="current"><a href="../includes/menu.php">Inicio</a></li>
		<li><a href="">Usuario</a>
			<ul>
				<li><a href="../Usuario/usuario.php">Usuarios</a><li>
				<li><a href="../Usuario/newUsuario.php">Nuevo Usuario</a></li>
				
			</ul>
		</li>
		<li><a href="#">Empleados</a>
			<ul>
				<li><a href="../Empleados/Empleados.php">Empleados</a></li>
				<li><a href="../Empleados/newEmpleados.php">Nuevo Empleado</a></li>
				
			</ul>
		</li>
		<li><a href="#">Paciente</a>
			<ul>
				<li><a href="../Pacientes/Pacientes.php">Pacientes</a></li>
				<li><a href="#">Nuevo Paciente</a></li>
				<li><a href="#">Editar Paciente</a></li>
			</ul>
		</li>	
		<li><a href="#">Consulta</a></li>
		<li><a href="#">Ingresos</a></li>
		<li><a href="#">Farmacias</a></li>
		<li><a href="#">Hospitales</a></li>
		
		<li><a href="../Login/salir.php">Salir</a></li>

	</ul>
	</body>
</html>