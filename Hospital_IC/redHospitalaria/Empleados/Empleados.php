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
<br><br><br><br>

<div class ="datagrid">
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
						</td>
					</tr>
			</tfoot>

			<tbody>
<?php
	$qry = "SELECT empleado, datos_personales, hospital, depto_area, puesto from empleado;";
	$result = mysql_query($qry);
	while ($row = mysql_fetch_array($result, MYSQL_NUM)) {
?>
        	
					<form>
					<table>
        				<tr class="alt">
	        				<td><h5><?php echo $row[0]; ?></h5></td>
	        				<td><h5><?php echo $row[1]; ?></h5></td>
	        				<td><h5><?php echo $row[2]; ?></h5></td>
	        				<td><h5><?php echo $row[3]; ?></h5></td>
	        				<td><h5><?php echo $row[4]; ?></h5></td>
	        				
			        			<td>
			        </table>
			        				<h5> <a href="../Usuario/editUsuario.php?Id=<?php echo $row[0] ?>" style="color:Black">Modificar</a>
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
</html>