<?php
include("../Conexion/conexionBD.php");
include("../includes/selectores.php");
include("../Conexion/valius.php");

 ?>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	
		<title>Listado Hospitales</title>
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
				<th>Id Hospital</th>
				<th>Nombre del Hospital</th>
				<th>Direccion</th>
				<th>Telefono</th>
				<th>Correo</th>
				<th>Nit</th>
				<th>Estatus</th>
				<th>Pais</th>
				<th>Departamento</th>
				<th>Municipio</th>
			</tr>
        </thead>

        <?php
        	$query = "select hospital, nombre, direccion, telefono, mail, nit, estatus, b.nombre_pais, c.nombre_departamento, d.nombre_municipio  from hospital a, pais b, departamento c, municipio d where a.pais=b.pais and a.departamento= c.departamento and a.municipio=d.municipio ;";
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
        			<th><?php echo $row[9]; ?></th>
        			
        			<th>
	        		<a href="../Hospitales/editHospital.php?Id=<?php echo $row[0] ?>" style="color:white">Modificar</a>
	        		</th>
        		</tr>
        	</form>	
       <?php
        	}
		?>
	        </div>
		</table>
	</body>
</html>
