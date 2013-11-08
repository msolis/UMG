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

					$upais = $_GET["Id"];
					$unombre="";
						
					if(isset ($_POST["entrar"])){
						
					$unombre= $_POST["NOMBRE"];
						
					$query="UPDATE redhospitalaria.pais SET NOMBRE_PAIS='".$unombre."' WHERE PAIS=".$upais;
					
					mysql_query ($query);
					
					}
						
					if (isset($upais))
					{
			$result = mysql_query("SELECT PAIS, NOMBRE_PAIS FROM redhospitalaria.pais WHERE PAIS = ".$upais.";");
			echo mysql_error();
			
			if ($result ==0)
			{
			echo "Error";
			}else
			{
			$row_array = mysql_fetch_array($result);
			
			$upais=$row_array[0];
			$unombre=$row_array[1];
		}
	}
	
?>
	<form method="POST">
		<table  width="600"> 
			<h2>Editar Pais</h2>
				
				
				<p><input name ="NOMBRE" value= "<?php echo $unombre?>"></p>
				
        								<button name="entrar" type="submit" ></button>
										<button id="borrar" type="reset"></button>
					</tr>
		</table>
	</form>
</body>
</html>