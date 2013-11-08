<?php
include("../Conexion/conexionBD.php");
include("../includes/selectores.php");
include("../Conexion/valius.php");

 ?>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	
		<title>Nivel de Estudios</title>
				<link rel="stylesheet" href="../css/base.css">
				<link rel="stylesheet" href="../css/skeleton.css">
				<link rel="stylesheet" href="../css/layout.css">	
				<link rel="stylesheet" href="../css/principal.css">
				<link rel="stylesheet" href="../css/BoxPaciente.css">
</head>
<body>
<?php include("../includes/menu.php"); ?>

<div class="datagrib">
<table width="500">
        <thead>
        	<tr>
				<th>Id Titulo</th>
				<th>Nombre del Nivel de Estudio</th>
				
			</tr>
        </thead>

        <?php
        	$query = "SELECT TITULO, NOMBRE_TITULO from titulo;";
            $result = mysql_query($query);	
			while ($row = mysql_fetch_array($result, MYSQL_NUM)) {
                                
        ?>
		<form>
        		<tr class="alt">
        			<th><?php echo $row[0]; ?></th>
        			<th><?php echo $row[1]; ?></th>
        			
        			<th>
	        		<a href="../Tipos/editTipo.php?Id=<?php echo $row[0] ?>" style="color:white">Modificar</a>
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
