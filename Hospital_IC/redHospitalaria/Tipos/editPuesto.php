<?php
include("../Conexion/conexionBD.php");
include("../includes/selectores.php");
include("../Conexion/valius.php");
?>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	
		<title>Editor de Puesto</title>
				<link rel="stylesheet" href="../css/base.css">
				<link rel="stylesheet" href="../css/skeleton.css">
				<link rel="stylesheet" href="../css/layout.css">	
				<link rel="stylesheet" href="../css/principal.css">
</head>

<body>

<?php include("../includes/menu.php"); ?>

<?php 

					$upuesto = $_GET["Id"];
					$unombre="";
					$ustatus="";
					
					if(isset ($_POST["entrar"])){
						
					$unombre= $_POST["NOMBRE"];
					$ustatus= $_POST["STATUS"];
						
					$query="UPDATE redhospitalaria.puesto SET NOMBRE='".$unombre."', STATUS= '".$ustatus."' WHERE PUESTO=".$upuesto;
					
					mysql_query ($query);
					
					}
						
					if (isset($upuesto))
					{
			$result = mysql_query("SELECT PUESTO, NOMBRE, STATUS FROM redhospitalaria.puesto WHERE PUESTO = ".$upuesto.";");
			echo mysql_error();
			
			if ($result ==0)
			{
			echo "Error";
			}else
			{
			$row_array = mysql_fetch_array($result);
			
			$upuesto=$row_array[0];
			$unombre=$row_array[1];
			$ustatus=$row_array[2];
		}
	}
	
?>
	<form method="POST">
		<table  width="600"> 
			<h2>Editar Puesto</h2>
				
				
				<p><input name ="NOMBRE" value= "<?php echo $unombre?>"></p>
				<tr>
				<td>Status</td>
							<td>
								<SELECT name="STATUS"> 
								<OPTION SELECTED VALUE = "A">Alta
								<OPTION VALUE= "B">Baja
								</SELECT> 
							</td>
				</tr>
				
        								<button name="entrar" type="submit" ></button>
										<button id="borrar" type="reset"></button>
										
										
					</tr>
		</table>
	</form>
</body>
</html>