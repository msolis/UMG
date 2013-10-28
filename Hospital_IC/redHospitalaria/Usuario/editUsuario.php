<?php
include("../Conexion/conexionBD.php");
include("../includes/selectores.php");
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
		<li class="current"><a href="../Principal/menu.php">Inicio</a></li>
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
<br>
<br>
<br>
<br>
<br>
	<tbody>
<?php 

					$usuario = $_GET["Id"];
					$unombre = "";
					$password = "";
					$uhospital = "";
					$ustatus= "";
					$upermisos ="";

	if (isset($usuario))


	{   
		
		$result = mysql_query("SELECT USUARIO, NOMBRE, CLAVE, HOSPITAL, STATUS, PERMISOS FROM redhospitalaria.usuario WHERE USUARIO = " . $usuario . " ;");
		echo mysql_error();
		if ($result == 0){
			echo "Error";
		}else{
			$row_array = mysql_fetch_array($result);

			$usuario = $row_array[0];
			$unombre = $row_array[1];
			$password = $row_array[2];
			$uhospital = $row_array[3];
			$ustatus = $row_array[4];
			$upermisos = $row_array[5];
		}
	}
?>
	<form method="POST">
		<table  width="600">
			<h2>EDITAR USUARIO</h2>
				<p><input name ="USUARIO" value= "<?php echo $usuario ?>"</p>
				<p><input name ="NOMBRE"  value= "<?php echo $unombre ?>" required=""></p>
				<p><input name = "CLAVE"  value= "<?php echo $password?>"></p>
				
				<tr>
					<td>Hospital</td>
					<td>
					<select name = "HOSPITAL">
<?php
	nuevoSelector("HOSPITAL", "NOMBRE", "HOSPITAL", $uhospital);   
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
											nuevoSelector("PERMISOS", "NOMBRE_PERMISO", "PERMISOS", $upermisos);   
						        		?>
						        		</select>
										<button id="entrar" type="submit"></button>
										<button id="borrar" type="reset"></button>
									</table>
			</form>
		</tbody>
	</body>
</html>

