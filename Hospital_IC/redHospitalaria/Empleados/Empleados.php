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
        			$query = "SELECT DATOS_PERSONALES, NOMBRE, APELLIDO, DPI, TELEFONO, DIRECCION, b.NOMBRE_PAIS, c.NOMBRE_DEPARTAMENTO , d.NOMBRE_MUNICIPIO, e.NOMBRE_TITULO, GENERO, FECHA_INGRESO, STATUS 
								from datos_personales a, pais b, departamento c, municipio d, titulo e
								where a.pais = b.pais and a.departamento = c.departamento and a.municipio = d.municipio and a.titulo= e.titulo;";
        			
        			$result = mysql_query($query);
        			
        			while ($row = mysql_fetch_array($result, MYSQL_NUM)){
					   
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
