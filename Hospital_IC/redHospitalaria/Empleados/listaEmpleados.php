<?php
include("../Conexion/conexionBD.php");
include("../includes/selectores.php");
include("../Conexion/valius.php");
?>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	
		<title>Lista de Empleados</title>
				<link rel="stylesheet" href="../css/base.css">
				<link rel="stylesheet" href="../css/skeleton.css">
				<link rel="stylesheet" href="../css/layout.css">	
				<link rel="stylesheet" href="../css/principal.css">
				<link rel="stylesheet" href="../css/Boxusuarios.css">
</head>
<body>
<?php include("../includes/menu.php"); ?>
<table width="800">
	       	<thead>
        		<tr>
        			<th>Numero de Empleado</th>
        			<th>Nombre</th>
        			<th>Apellido</th>
        			<th>Hospital</th>
        			<th>Depto. de Trabajo</th>
        			<th>Puesto</th>
        			
        			       			
        		</tr>
        	</thead>
        	<tbody >
        		<?php
        			$query = "SELECT EMPLEADO, b.NOMBRE, f.APELLIDO, c.NOMBRE, d.NOMBRE, e.NOMBRE from empleado a, datos_personales b, hospital c, depto_area d, puesto e, datos_personales f where a.datos_personales = b.datos_personales and a.datos_personales = f.datos_personales  and a.hospital = c.hospital and a.depto_area = d.depto_area and a.puesto= e.puesto;";
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
	        			 
	        			<th>
	        				<a href="../Empleados/editLista.php?Id=<?php echo $row[0] ?>" style="color:white">Modificar</a>
	        			</th>
        			</tr>
        		</form>
        		
        		<?php
        		}
        		?>
        	</tbody>
        </table>
</body>

