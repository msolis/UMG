<?php
include("../Conexion/conexionBD.php");
include("../includes/selectores.php");
include("../Conexion/valius.php");

?>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	
		<title>New Departamento</title>
				<link rel="stylesheet" href="../css/base.css">
				<link rel="stylesheet" href="../css/skeleton.css">
				<link rel="stylesheet" href="../css/layout.css">	
				<link rel="stylesheet" href="../css/principal.css">
</head>
<body>
	<?php include("../includes/menu.php"); ?>
	
	
<?php 

		if (isset($_POST["NOMBRE"]))

		{
		
		
		$unombre= $_POST["NOMBRE"];
		$udireccion=$_POST["DIRECCION"];
		$utelefono=$_POST["TELEFONO"];
		$umail=$_POST["MAIL"];
		$unit=$_POST["NIT"];
		$ustatus=$_POST["ESTATUS"];
		$upais=$_POST["PAIS"];
		$udepatamento=$_POST["DEPARTAMENTO"];
		$umunicipio=$_POST["MUNICIPIO"];
		
		$query="insert into redhospitalaria.hospital( nombre, direccion, telefono, mail, nit, estatus, pais, departamento, municipio) values( '".$unombre."', '".$udireccion."', '".$utelefono."','".$umail."' ,'".$unit."', '".$ustatus."', ".$upais.", ".$udepatamento.", ".$umunicipio.");";
		mysql_query ($query);

		}
?>
	<form method="POST">
		<table  width="600"> 
			<h2>Nuevo Hosptial</h2>
				<p><input name ="NOMBRE" type="text" placeholder="Nombre Del Hospital" required=""></p>
				<p><input name ="DIRECCION" type="text" placeholder="Direccion" required=""></p>
				<p><input name ="TELEFONO" type="text" placeholder="Telefono" required=""></p>
				<p><input name ="MAIL" type="text" placeholder="Ingrese un Correo" required=""></p>
				<p><input name ="NIT" type="text" placeholder="Ingrese su Nit" required=""></p>
				
				<tr>
						<td>Pais</td>
							<td>
								<select name = "PAIS">
<?php
	nuevoselector("pais", "nombre_pais", "pais", "") ;  
?>
	        					</select>
	        				</td>
        			</tr>
        			<tr>
        			<td>Departamento</td>
							<td>
								<select name = "DEPARTAMENTO">
<?php
	nuevoselector("departamento", "nombre_departamento", "departamento", "") ;  
?>
	        					</select>
	        				</td>
        			</tr>
        			<tr>
        			<td>Municipio</td>
							<td>
								<select name = "MUNICIPIO">
<?php
	nuevoselector("municipio", "nombre_municipio", "municipio", "") ;  
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
			</table>
		</form>
	</body>
</html>

 