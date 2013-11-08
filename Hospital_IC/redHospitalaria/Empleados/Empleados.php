<<<<<<< HEAD
<?php
include("../Conexion/conexionBD.php");
include("../includes/selectores.php");
include("../Conexion/valius.php");

 
 ?>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	
		<title>Usuarios</title>
				<link rel="stylesheet" href="../css/base.css">
				<link rel="stylesheet" href="../css/skeleton.css">
				<link rel="stylesheet" href="../css/layout.css">	
				<link rel="stylesheet" href="../css/principal.css">
				<link rel="stylesheet" href="../css/Boxusuarios.css">
</head>
<body>
<?php include("../includes/menu.php"); ?>
<table width="1000">
	       	<thead>
        		<tr>
        			<th>ID.Empleado</th>
        			<th>Nombre</th>
        			<th>Apellido</th>
        			<th>DPI</th>
        			<th>Telefono</th>
        			<th>Direccion</th>
        			<th>Pais</th>
        			<th>Departamento</th>
        			<th>Municipio</th>
        			<th>Titulo</th>
        			<th>Genero</th>
        			<th>Fecha de Ingreso</th>
        			<th>Status</th>
        			       			
        		</tr>
        	</thead>
        	<tbody >
        		<?php
        			$qry = "SELECT DATOS_PERSONALES, NOMBRE, APELLIDO, DPI, TELEFONO, DIRECCION, PAIS, b.NOMBRE_DEPARTAMENTO
		, MUNICIPIO, TITULO, GENERO, FECHA_INGRESO, STATUS from datos_personales a, departamento b
		where a.departamento = b.departamento;";
        			

        			$result = mysql_query($qry);
        			
        			while ($row = mysql_fetch_array($result, MYSQL_NUM)) {
					   
        		?>
        	
				<form>
        			<tr>
        				<th><?php echo $row[0]; ?></th>
        				<th><?php echo $row[1]; ?></th>
        				<th><?php echo $row[2]; ?></th>
        				<th><?php echo $row[3]; ?></th>
        				<th><?php echo $row[4]; ?></th>
	        			<th><?php echo $row[5]; ?></th>
	        			<th><?php echo $row[6]; ?></th>
	        			<th><?php echo $row[7]; ?></th>
	        			<th><?php echo $row[8]; ?></th>
	        			<th><?php echo $row[9]; ?></th>
	        			<th><?php echo $row[10]; ?></th>
	        			<th><?php echo $row[11]; ?></th>
	        			<th><?php echo $row[12]; ?></th>
	        			
	        			
	        			
	        			<th>
	        				<a href="../Empleados/editEmpleado.php?Id=<?php echo $row[0] ?>" style="color:white">Modificar</a>
	        			</th>
        			</tr>
        		</form>
        		
        		<?php
        		}
        		?>

        	</tbody>
        </table>
</body>
=======
<<<<<<< HEAD
<?php
 include ("../Conexion/conexionBD.php");
?>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	
		<title>Usuarios</title>
				<link rel="stylesheet" href="../css/base.css">
				<link rel="stylesheet" href="../css/skeleton.css">
				<link rel="stylesheet" href="../css/layout.css">	
				<link rel="stylesheet" href="../css/principal.css">
				<link rel="stylesheet" href="../css/Boxusuarios.css">
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
				<li><a href="../Empleados/Empleados.php">Empleados</a></li>
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
<br><br><br><br>
<div class="datagrid">
	<table>
		<thead>
			<tr>
				<th>ID.Empleado</th>
        		<th>Codigo de datos P.</th>
        		<th>Hospital Asignado</th>
        		<th>Departamento Area.</th>
       			<th>Puesto</th>
       			<th>Modificar</th>
			</tr>
		</thead>
<tfoot>
	<tr>
	<td colspan="4">
		<div id="paging">
			<ul>
			<li><span>-----------------------------------------------------------------------------
			---------------------------------------------------------------------------------
			-----</span></li>
			</ul>
			</div>
	</tr>
</tfoot>
<tbody>
<tbody >
        		<?php
        			$qry = "SELECT empleado, datos_personales, hospital, depto_area, puesto from empleado;";

        			$result = mysql_query($qry);
        			
        			while ($row = mysql_fetch_array($result, MYSQL_NUM)) {
					   
        		?>
        	
				<form>
        			<tr class="alt">
        				<td><h5><?php echo $row[0]; ?></td>
        				<td><h5><?php echo $row[1]; ?></td>
        				<td><h5><?php echo $row[2]; ?></td>
        				<td><h5><?php echo $row[3]; ?></td>
        				<td><h5><?php echo $row[4]; ?></td>
        				
	        			<td>
	        				<h5><a href="../Usuario/editUsuario.php?Id=<?php echo $row[0] ?>" style="color:Black">Modificar</a>
	        			</td>
        			</tr>
        		</form>
        		<?php
        		}
        		?>
        	</tbody>
	</div>
</table>
</body>
=======
<?php
include("../Conexion/conexionBD.php");
include("../includes/selectores.php");
include("../Conexion/valius.php");

 
 ?>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	
		<title>Usuarios</title>
				<link rel="stylesheet" href="../css/base.css">
				<link rel="stylesheet" href="../css/skeleton.css">
				<link rel="stylesheet" href="../css/layout.css">	
				<link rel="stylesheet" href="../css/principal.css">
				<link rel="stylesheet" href="../css/Boxusuarios.css">
</head>
<body>
<?php include("../includes/menu.php"); ?>
<table width="900">
	       	<thead>
        		<tr>
        			<th>ID.Empleado</th>
        			<th>Nombre</th>
        			<th>Apellido</th>
        			<th>DPI</th>
        			<th>Telefono</th>
        			<th>Direccion</th>
        			<th>Pais</th>
        			<th>Departamento</th>
        			<th>Municipio</th>
        			<th>Titulo</th>
        			<th>Genero</th>
        			<th>Fecha de Ingreso</th>
        			<th>Status</th>
        			       			
        		</tr>
        	</thead>
        	<tbody >
        		<?php
        			$qry = "SELECT DATOS_PERSONALES, NOMBRE, APELLIDO, DPI, TELEFONO, DIRECCION,PAIS, DEPARTAMENTO, MUNICIPIO,TITULO, GENERO,FECHA_INGRESO, STATUS from datos_personales;";

        			$result = mysql_query($qry);
        			
        			while ($row = mysql_fetch_array($result, MYSQL_NUM)) {
					   
        		?>
        	
				<form>
        			<tr>
        				<th><?php echo $row[0]; ?></th>
        				<th><?php echo $row[1]; ?></th>
        				<th><?php echo $row[2]; ?></th>
        				<th><?php echo $row[3]; ?></th>
        				<th><?php echo $row[4]; ?></th>
	        			<th><?php echo $row[5]; ?></th>
	        			<th><?php echo $row[6]; ?></th>
	        			<th><?php echo $row[7]; ?></th>
	        			<th><?php echo $row[8]; ?></th>
	        			<th><?php echo $row[9]; ?></th>
	        			<th><?php echo $row[10]; ?></th>
	        			<th><?php echo $row[11]; ?></th>
	        			<th><?php echo $row[12]; ?></th>
	        			
	        			
	        			<th>
	        				<a href="../Empleados/editEmpleado.php?Id=<?php echo $row[0] ?>" style="color:white">Modificar</a>
	        			</th>
        			</tr>
        		</form>
        		
        		<?php
        		}
        		?>

        	</tbody>
        </table>
</body>
>>>>>>> f16a4fa19c827b0ceba789ef7e71027acdb928e8
>>>>>>> branch 'master' of https://github.com/msolis/UMG.git
</html>
