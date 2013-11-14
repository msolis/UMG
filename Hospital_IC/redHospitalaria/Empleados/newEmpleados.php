<?php
include("../Conexion/conexionBD.php");
include("../includes/selectores.php");
include("../Conexion/valius.php");

?>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	
		<title>New Empleado</title>
				<link rel="stylesheet" href="../css/base.css">
				<link rel="stylesheet" href="../css/skeleton.css">
				<link rel="stylesheet" href="../css/layout.css">	
				<link rel="stylesheet" href="../css/principal.css">
</head>
<body>
	<?php include("../includes/menu.php"); ?>
	
	<tbody>
<?php 

		if (isset($_POST["NOMBRE"]))

		{
		
		$unombre = $_POST["NOMBRE"];
		$uapellido = $_POST["APELLIDO"];
		$udpi = $_POST["DPI"];
		$utelefono = $_POST["TELEFONO"];
		$udireccion = $_POST["DIRECCION"];
		$upais = $_POST["PAIS"];
		$udepartamento = $_POST["DEPARTAMENTO"];
		$umunicipio = $_POST["MUNICIPIO"];
		$utitulo = $_POST["TITULO"];
		$ugenero = $_POST["GENERO"];
		$ufecha_ingreso = $_POST["FECHA_INGRESO"];
		$ustatus = $_POST["STATUS"];
		
		
		$query="insert into redhospitalaria.datos_personales( nombre, apellido, dpi, telefono, direccion, pais, departamento, municipio,titulo, genero, fecha_ingreso, status) values( '".$unombre."', '".$uapellido."', '".$udpi."', '".$utelefono."','".$udireccion."',".$upais.", ".$udepartamento.", ".$umunicipio.", ".$utitulo.", '".$ugenero."', '".$ufecha_ingreso."','".$ustatus."');";
		mysql_query ($query);

		}
?>
	<form method="POST">
		<table  width="600"> 
			<h2>Datos del Empleado</h2>
				
				
				<p><input name ="NOMBRE" type="text" placeholder="Nombres" required=""></p>
				<p><input name ="APELLIDO" type="text" placeholder="Apellidos" required=""></p>
				<p><input name ="DPI" type="text" placeholder="DPI o CEDULA" required=""></p>
				<p><input name ="TELEFONO" type="text" placeholder="Telefono" required=""></p>
				<p><input name ="DIRECCION" type="text" placeholder="Direccion" required=""></p>
				
				<tr>
							<td>Fecha de Nacimiento</td>
							<td>
									
									<p><input name ="FECHA_INGRESO" type="date" required=""></p>
							</td>
				</tr>
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
        			<td>Titulo</td>
							<td>
								<select name = "TITULO">
<?php
	nuevoselector("titulo", "nombre_titulo", "titulo", "") ;  
?>
	        					</select>
	        				</td>
        			</tr>
        		
				<td>Genero</td>
							<td>
								<SELECT NAME="GENERO"> 
								<OPTION SELECTED VALUE = "F">Femenino
								<OPTION VALUE= "M">Masculino
								</SELECT> 
							</td>
							</tr>
							<tr>	
							<td>Status</td>
							<td>
								<SELECT NAME="STATUS"> 
								<OPTION SELECTED VALUE = "A">Alta
								<OPTION VALUE= "B">Baja
								</SELECT> 
							</td>
										
				
									</tr>
									
										
										<button name="entrar" type="submit" ></button>
										<button id="borrar" type="reset"></button>
		
		</table>
			</form>
		</tbody>
	</body>
</html>

 