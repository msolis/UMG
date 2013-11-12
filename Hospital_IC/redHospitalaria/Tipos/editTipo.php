<?php
include("../Conexion/conexionBD.php");
include("../includes/selectores.php");
include("../Conexion/valius.php");
?>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	
		<title>Editor de Asignacion</title>
				<link rel="stylesheet" href="../css/base.css">
				<link rel="stylesheet" href="../css/skeleton.css">
				<link rel="stylesheet" href="../css/layout.css">	
				<link rel="stylesheet" href="../css/principal.css">
</head>

<body>

<?php include("../includes/menu.php"); ?>

<?php 

					$utitulo = $_GET["Id"];
					$unombre="";
				
					
					if(isset ($_POST["entrar"])){
						
					$unombre= $_POST["NOMBRE"];
				
						
					$query="UPDATE redhospitalaria.titulo SET NOMBRE_TITULO='".$unombre."' WHERE TITULO=".$utitulo;
					
					mysql_query ($query);
					
					}
						
					if (isset($utitulo))
					{
			$result = mysql_query("SELECT NOMBRE_TITULO  FROM redhospitalaria.titulo WHERE TITULO = ".$utitulo.";");
			echo mysql_error();
			
			if ($result ==0)
			{
			echo "Error";
			}else
			{
			$row_array = mysql_fetch_array($result);
			
			$unombre=$row_array[0];
			
		}
	}
	
?>
	<form method="POST">
		<table  width="600"> 
			<h2>Editar Titulo Obtenido</h2>
				
				
				<p><input name ="NOMBRE" value= "<?php echo $unombre?>"></p>
										
        								<button name="entrar" type="submit" ></button>
										<button id="borrar" type="reset"></button>
					</tr>
		</table>
	</form>
</body>
</html>