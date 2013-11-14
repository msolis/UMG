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
					$upais="";
					$udepartamento="";
					$umunicipio="";
					
					if(isset ($_POST["entrar"])){
						
					$unombre= $_POST["NOMBRE"];
					$udireccion= $_POST["DIRECCION"];
					$utelefono= $_POST["TELEFONO"];
					$umail= $_POST["MAIL"];
					$unit= $_POST["NIT"];
					$ustatus= $_POST["ESTATUS"];
					$upais= $_POST["PAIS"];
					$udepartamento= $_POST["DEPARTAMENTO"];
					$umunicipio= $_POST["MUNICIPIO"];
						
					$query="update redhospitalaria.hospital set nombre='".$unombre."', direccion='".$udireccion."', telefono= '".$utelefono."', mail='".$umail."', nit='".$unit."', estatus='".$ustatus."', pais=".$upais.", departamento=".$udepartamento.", municipio=".$umunicipio." where hospital=".$uhospital;
					
					mysql_query ($query);
					
					}
						
					if (isset($uhospital))
					{
			$result = mysql_query("select hospital, nombre, direccion, telefono, mail, nit, estatus, pais, departamento, municipio from redhospitalaria.hospital where hospital = ".$uhospital.";");
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
			$upais=$row_array[7];
			$udepartamento=$row_array[8];
			$umunicipio=$row_array[9];
			
		}
	}
	
?>
	<form method="POST">
		<table  width="900">
				
			<h2>Editar Hospital</h2>
			<tr>
			<td color="white">Nombre: </td>
			<td><p><input size="50" name ="NOMBRE" value= "<?php echo $unombre?>"></p></td>
			</tr>
			
			<tr>
			<td color="white">Direccion: </td>
			<td><p><input size="50" name ="DIRECCION" value= "<?php echo $udireccion?>"></p></td>
			</tr>
		
			<tr>
			<td color="white">Telefono: </td>
			<td><p><input size="50" name ="TELEFONO" value= "<?php echo $utelefono?>"></p></td>
			</tr>
			
			<tr>
			<td color="white">Mail: </td>
			<td><p><input size="50" name ="MAIL" value= "<?php echo $umail?>"></p></td>
			</tr>
			
			<tr>
			<td color="white">Nit: </td>
			<td><p><input size="50" name ="NIT" value= "<?php echo $unit?>"></p></td>
			</tr>
							<tr>
							<td>Pais</td>
							<td>
								<select name = "PAIS">
<?php
	nuevoselector("pais", "nombre_pais", "pais",$upais) ;  
?>
	        					</select>
	        				</td>
	        				</tr>
	        				<tr>
	        				<td>Departamento</td>
							<td>
								<select name = "DEPARTAMENTO">
<?php
	nuevoselector("departamento", "nombre_departamento", "departamento",$udepartamento) ;  
?>
	        					</select>
	        				</td>
	        				</tr>
	        				<tr>
	        				<td>Municipio</td>
							<td>
								<select name = "MUNICIPIO">
<?php
	nuevoselector("municipio", "nombre_municipio", "municipio",$umunicipio) ;  
?>
	        					</select>
	        				</td>	
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