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
        		<th>ID.Consulta</th>
        		<th>Fecha_Consulta</th>
        		<th>Fecha_Proxima_Consulta</th>
        		<th>Paciente</th>
        		<th>Tipo Consulta</th>	
                        <th>Enfermedad</th>		
        	</tr>
        </thead>
        <tbody >
                <?php 
                        $query ="SELECT CONSULTA, CONSULTA, FECHA_CONSULTA, FECHA_PROXIMA_CONSULTA, PACIENTE, TIPO_CONSULTA, ENFERMEDAD from consulta;";
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
