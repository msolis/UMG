<?php
include("../Conexion/conexionBD.php")
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

		     if (isset($_POST["nombre"]))

           {
					
					$unombre = $_POST["nombre"];
					$password = $_POST["CLAVE"];
					$uhospital = $_POST["Hospital"];
					$ustatus= $_POST["Status"];
					$upermisos = $_POST["permisos"];
				

					mysql_query ("INSERT INTO redHospitalaria.USUARIO( usuario.nombre, usuario.clave, usuario.hospital, usuario.status, usuario.permisos) VALUES('".$unombre."', '".$password."', '".$uhospital."', '".$ustatus."', '".$upermisos."');");
					
			
			}

?>

	<form method="POST">
		<table  width="600">
			<h2>Nuevo Usuario</h2>
				
				<p><input name ="nombre" type="text" placeholder="nombre" required=""></p>
				<p><input name = "CLAVE" type="password" placeholder="Clave" required=""></p>
				
				<tr>
				<td>Hospital</td>
				<td>
				<select name = "Hospital">
				<?php
        			$qry = "SELECT hospital, nombre from HOSPITAL;";

        			$result = mysql_query($qry);
        			
        			while ($row = mysql_fetch_array($result, MYSQL_NUM)){
					   
        		?>

        		<option value="<?php echo $row[0]; ?>"><?php echo $row[1]; ?>

        			<?php
					}
					?>
        		</select>
        		</td>
        	</tr>
        	<tr>
				<td>Status:</td>
				<td>
					<SELECT NAME="Status"> 
					<OPTION SELECTED VALUE = "A">Alta
					<OPTION VALUE= "B">Baja
					</SELECT> 
				</td>
						<tr>
							<td>Permisos</td>
							<td>
							<select name = "permisos">
							<?php
			        			$qry = "SELECT permisos, nombre_permiso from PERMISOS;";

			        			$result = mysql_query($qry);
			        			
			        			while ($row = mysql_fetch_array($result, MYSQL_NUM)){
								   
			        		?>

			        		<option value="<?php echo $row[0]; ?>"><?php echo $row[1]; ?>

			        			<?php
								}
								?>
			        		</select>
							<button id="entrar" type="submit"></button>
							<button id="borrar" type="reset"></button>
						</table>
			</form>
		</tbody>
	</body>
</html>

