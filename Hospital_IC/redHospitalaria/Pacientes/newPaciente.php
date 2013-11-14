<?php
include("../Conexion/conexionBD.php");
include("../includes/selectores.php");
include("../Conexion/valius.php");

?>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	
		<title>New PACIENTE</title>
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
		
			$inombre = $_POST["NOMBRE"];
			$iapellido = $_POST["APELLIDO"];						
			$idpi = $_POST["DPI"];								
			$idireccion = $_POST["DIRECCION"];						
			$imail = $_POST["MAIL"];							
			$itelefono = $_POST["TELEFONO"];						
			$init = $_POST["NIT"];								
			$igenero = $_POST["GENERO"];							
			$ipais = $_POST["PAIS"];							
			$idepartamento = $_POST["DEPARTAMENTO"];					
			$imunicipio = $_POST["MUNICIPIO"];						
			$iseguro = $_POST["SEGURO"];							
			$ifecha_nacimiento = $_POST["FECHA_NACIMIENTO"];
			$ihospital = $_POST["HOSPITAL"];
		
		$query = "insert into redhospitalaria.paciente( nombre, apellido, dpi, direccion, mail, telefono, nit, genero, pais, departamento, municipio, seguro, fecha_nacimiento, hospital) values ( '".$inombre."', '".$iapellido."', '".$idpi."', '".$idireccion."', '".$imail."' ,'".$itelefono."', '".$init."', '".$igenero."', ".$ipais.", ".$idepartamento.", ".$imunicipio.", '".$iseguro."', '".$ifecha_nacimiento."', ".$ihospital.");";
			
		mysql_query ($query);

		}
?>
	<form method="POST">
		<table  width="600"> 
			<h2>Datos deL PACIENTE</h2>
				
				
				<p><input name ="NOMBRE" type="text" placeholder="Nombres" required=""></p>
				<p><input name ="APELLIDO" type="text" placeholder="Apellidos" required=""></p>
				<p><input name ="DPI" type="text" placeholder="DPI o CEDULA" required=""></p>
				<p><input name ="DIRECCION" type="text" placeholder="Direccion" required=""></p>
				<p><input name ="MAIL" type="text" placeholder="MAIL" required=""></p>
				<p><input name ="TELEFONO" type="text" placeholder="Telefono" required=""></p>
				<p><input name ="NIT" type="text" placeholder="NIT" required=""></p>
				
				<tr>
							<td>Fecha de Nacimiento</td>
							<td>
									
									<p><input name ="FECHA_NACIMIENTO" type="date" placeholder="Fecha de Nacimiento yyyymmdd" required=""></p>
							</td>
				</tr>	
					<tr>
				<td>Genero</td>
							<td>
								<SELECT NAME="GENERO"> 
								<OPTION SELECTED VALUE = "F">Femenino
								<OPTION VALUE= "M">Masculino
								</SELECT> 
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
				<td>SEGURO</td>
							<td>
								<SELECT NAME="SEGURO"> 
								<OPTION SELECTED VALUE = "A">ALTA
								<OPTION VALUE= "B">BAJA
								</SELECT> 
							</td>
							</tr>		
        			<tr>
        			<td>HOSPITAL</td>
							<td>
								<select name = "HOSPITAL">
<?php
	nuevoselector("hospital", "nombre", "hospital", "") ;  
?>
	        					</select>
	        				</td>
        			</tr>
        			
										<button id="entrar" type="submit"></button>
										<button id="borrar" type="reset"></button>
		
		</table>
			</form>
		</tbody>
	</body>
</html>



