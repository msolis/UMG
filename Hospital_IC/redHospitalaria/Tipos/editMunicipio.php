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

					$umunicipio = $_GET["Id"];
					$unombre="";
					$udepartamento="";
					
					if(isset ($_POST["entrar"])){
						
					$unombre= $_POST["NOMBRE"];
					$udepartamento= $_POST["DEPARTAMENTO"];
						
					$query="UPDATE redhospitalaria.municipio SET NOMBRE_MUNICIPIO='".$unombre."', DEPARTAMENTO= ".$udepartamento." WHERE MUNICIPIO=".$umunicipio;
					
					mysql_query ($query);
					
					}
						
					if (isset($umunicipio))
					{
			$result = mysql_query("SELECT MUNICIPIO, NOMBRE_MUNICIPIO, DEPARTAMENTO FROM redhospitalaria.municipio WHERE MUNICIPIO = ".$umunicipio.";");
			echo mysql_error();
			
			if ($result ==0)
			{
			echo "Error";
			}else
			{
			$row_array = mysql_fetch_array($result);
			
			$umunicipio=$row_array[0];
			$unombre=$row_array[1];
			$udepartamento=$row_array[2];
		}
	}
	
?>
	<form method="POST">
		<table  width="600"> 
			<h2>Editar Municipio</h2>
				
				
				<p><input name ="NOMBRE" value= "<?php echo $unombre?>"></p>
				
				<td>DEPARTAMENTO</td>
							<td>
								<select name = "DEPARTAMENTO">
<?php
	nuevoSelector("DEPARTAMENTO", "NOMBRE_DEPARTAMENTO", "DEPARTAMENTO",$udepartamento) ;  
?>
	        					</select>
	        				</td>
        			</tr>
				
        								<button name="entrar" type="submit" ></button>
										<button id="borrar" type="reset"></button>
					</tr>
		</table>
	</form>
</body>
</html>