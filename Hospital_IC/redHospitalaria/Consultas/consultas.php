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
                        $query ="SELECT CONSULTA, FECHA_CONSULTA, FECHA_PROXIMA_CONSULTA, b.NOMBRE, c.DESCRIPCION, d.NOMBRE_ENFERMEDAD from consulta a, paciente b, tipo_consulta c, enfermedad d where a.paciente = b.paciente and a.tipo_consulta = c.tipo_consulta and a.enfermedad= d.enfermedad;";

                       # $query = "SELECT a.PACIENTE, a.NOMBRE, a.APELLIDO, a.DPI, a.DIRECCION, a.MAIL, a.TELEFONO, a.GENERO, a.NIT, b.NOMBRE_PAIS, c.NOMBRE_DEPARTAMENTO, d.NOMBRE_MUNICIPIO, a.SEGURO, a.FECHA_NACIMIENTO, e.NOMBRE from paciente a, pais b, departamento c, municipio d, hospital e where a.pais= b.pais and a.departamento= c.departamento and a.municipio= d.municipio and a.hospital= e.hospital;";

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
	        				<a href="../Consultas/editConsulta.php?Id=<?php echo $row[0] ?>" style="color:white">Modificar</a>
	        			</th>
        			</tr>
        		</form>
        		
        		<?php
        		}
        		?>

        	</tbody>
        </table>
</body>
