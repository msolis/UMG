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
</head>
<body>

<?php include("../includes/menu.php"); ?>

<table width="600">
	       	<thead>
        		<tr>
        			<th>ID.Usuario</th>
        			<th>Nombre</th>
        			<th>Hospital</th>
        			<th>Status</th>
        			<th>Permiso</th>
        		</tr>
        	</thead>
        	<tbody >
        		<?php
        			$qry = "SELECT usuario, nombre, hospital, status, permisos from usuario;";

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
	        			<th>
	        				<a href="../Usuario/editUsuario.php?Id=<?php echo $row[0] ?>" style="color:white">Modificar</a>
	        			</th>
        			</tr>
        		</form>
        		
        		<?php
        		}
        		?>

        	</tbody>
        </table>
</body>
</html>