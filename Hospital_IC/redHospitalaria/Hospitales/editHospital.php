<?php
include("../Conexion/conexionBD.php");
include("../includes/selectores.php");
include("../Conexion/valius.php");
?>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	
		<title>Editar Hospital</title>
				<link rel="stylesheet" href="../css/base.css">
				<link rel="stylesheet" href="../css/skeleton.css">
				<link rel="stylesheet" href="../css/layout.css">	
				<link rel="stylesheet" href="../css/principal.css">
</head>

<body>

<?php include("../includes/menu.php"); ?>

<?php 

					$uhospital = $_GET["Id"];
					$unombre="";
					$udireccion="";
					$utelefono="";
					$umail="";
					$unit="";
					$ustatus="";
					
					if(isset ($_POST["entrar"])){
						
					$unombre= $_POST["NOMBRE"];
					$udireccion= $_POST["DIRECCION"];
					$utelefono= $_POST["TELEFONO"];
					$umail= $_POST["MAIL"];
					$unit= $_POST["NIT"];
					$ustatus= $_POST["ESTATUS"];
						
					$query="UPDATE redhospitalaria.hospital SET NOMBRE='".$unombre."', DIRECCION='".$udireccion."', TELEFONO= '".$utelefono."', MAIL='".$umail."', NIT='".$unit."', ESTATUS='".$ustatus."' WHERE HOSPITAL=".$uhospital;
					
					mysql_query ($query);
					
					}
						
					if (isset($uhospital))
					{
			$result = mysql_query("SELECT HOSPITAL, NOMBRE, DIRECCION, TELEFONO, MAIL, NIT, ESTATUS FROM redhospitalaria.hospital WHERE HOSPITAL = ".$uhospital.";");
			echo mysql_error();
			
			if ($result ==0)
			{
			echo "Error";
			}else
			{
			$row_array = mysql_fetch_array($result);
			
			$uhospital=$row_array[0];
			$unombre=$row_array[1];
			$udireccion=$row_array[2];
			$utelefono=$row_array[3];
			$umail=$row_array[4];
			$unit=$row_array[5];
			$ustatus=$row_array[6];
			
		}
	}
	
?>
	<form method="POST">
		<table  width="900">
				
			<h2>Editar Hospital</h2>
			<tr>
			<td color="white">Nombre: </td>
			<td width="800" ><input size="50" name ="NOMBRE" value= "<?php echo $unombre?>"></td>
			</tr>
		
			<tr>
			<td color="white">Direccion: </td>
			<td><input size="50" name ="DIRECCION" value= "<?php echo $udireccion?>"></td>
			</tr>
		
			<tr>
			<td color="white">Telefono: </td>
			<td><input size="50" name ="TELEFONO" value= "<?php echo $utelefono?>"></td>
			</tr>
			
			<tr>
			<td color="white">Mail: </td>
			<td><input size="50" name ="MAIL" value= "<?php echo $umail?>"></td>
			</tr>
			
			<tr>
			<td color="white">Nit: </td>
			<td><input size="50" name ="NIT" value= "<?php echo $unit?>"></td>
			</tr>				
				<tr>
				<td>Status</td>
							<td>
								<SELECT name="ESTATUS"> 
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