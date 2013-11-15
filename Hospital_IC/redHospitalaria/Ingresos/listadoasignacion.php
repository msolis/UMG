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
				<link rel="stylesheet" href="../css/BoxPaciente.css">
</head>
<body>
<?php include("../includes/menu.php"); ?>
<div class="datagrib">
<table width="1100">
        <thead>
        	<tr>
			    <th>ID.Paciente.</th>
        		<th>Nombre</th>
        		<th>Apellido</th>
        		<th>DPI</th>
			    <th>Direccion</th>
        		<th>Genero</th>
        		<th>Municipio</th>
        		<th>Seguro</th>
        		<th>Hospital</th>	       			
        	</tr>
        </thead>

        <?php
        	$query = "select a.paciente, a.nombre, a.apellido, a.dpi, a.direccion, a.genero, d.nombre_municipio, a.seguro, e.nombre from paciente a,   municipio d, hospital e where  a.municipio= d.municipio and a.hospital= e.hospital;";
            
                	$result = mysql_query($query);	

        			while ($row = mysql_fetch_array($result, MYSQL_NUM)) {
                                
        ?>
		<form>
        		<tr class="alt">
        			<th><?php echo $row[0]; ?></th>
        			<th><?php echo $row[1]; ?></th>
        			<th><?php echo $row[2]; ?></th>      
        			<th><?php echo $row[3]; ?></th>
        			<th><?php echo $row[4]; ?></th>
	        		<th><?php echo $row[5]; ?></th>
	        		<th><?php echo $row[6]; ?></th>
	        		<th><?php echo $row[7]; ?></th>
	        		<th><?php echo $row[8]; ?></th>
	        		<th>
	        		<a href="../Pacientes/editPaciente.php?Id=<?php echo $row[0] ?>" style="color:white">Modificar</a>
	        		</th>
        		</tr>
        	</form>	
       <?php
        	}
	?>


		</table>
	</body>
</html>
