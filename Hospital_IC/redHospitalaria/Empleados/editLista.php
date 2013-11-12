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

						$uempleado = $_GET["Id"];
						$unombre="";
						$uhospital= "";
						$udeptoarea="";
						$upuesto="";
					
						if(isset ($_POST["entrar"])){
						
						$unombre= $_POST["NOMBRE"];
						$uhospital= $_POST["HOSPITAL"];
						$udeptoarea= $_POST["AREA"];
						$upuesto=$_POST["PUESTO"];
				
					$query="UPDATE redhospitalaria.empleado SET DATOS_PERSONALES=".$unombre.", HOSPITAL=".$uhospital.", DEPTO_AREA= ".$udeptoarea.", PUESTO=".$upuesto." WHERE EMPLEADO =".$uempleado;
					
					mysql_query ($query);
					
					}
						
					if (isset($uempleado))
					{
			$result = mysql_query("SELECT EMPLEADO, DATOS_PERSONALES, HOSPITAL, DEPTO_AREA, PUESTO FROM redhospitalaria.empleado WHERE EMPLEADO = ".$uempleado.";");
			echo mysql_error();
			
			if ($result ==0)
			{
			echo "Error";
			}else
			{
			$row_array = mysql_fetch_array($result);
			
			$uempleado=$row_array[0];
			$unombre=$row_array[1];
			$uhospital=$row_array[2];
			$udeptoarea=$row_array[3];
			$upuesto=$row_array[4];
		}
	}
	
?>>
	<form method="POST">
		<table  width="600"> 
			<h2>Editar Asignacion</h2>
				
				
				<p><input name ="NOMBRE" value= "<?php echo $unombre ?>"></p>
				<tr>
				<td>HOSPITAL</td>
							<td>
								<select name = "HOSPITAL">
<?php
	nuevoSelector("HOSPITAL", "NOMBRE", "HOSPITAL", $uhospital) ;  
?>
	        					</select>
	        				</td>
	        	</tr>
	        	<tr>
	        	<td>AREA DE TRABAJO</td>
							<td>
								<select name = "AREA">
<?php
	nuevoSelector("DEPTO_AREA", "NOMBRE", "DEPTO_AREA", $udeptoarea) ;  
?>
	        					</select>
	        				</td>
	        	</tr>
	        	<tr>
	        	<td>NOMBRE DEL PUESTO</td>
							<td>
								<select name = "PUESTO">
<?php
	nuevoSelector("PUESTO", "NOMBRE", "PUESTO", $upuesto);  
?>
	        					</select>
	        				</td>
	        		</tr>		
	        		<td>
        								<button name="entrar" type="submit" ></button>
										<button id="borrar" type="reset"></button>
					</tr>
		</table>
	</form>
</body>
</html>