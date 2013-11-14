<?php
include("../Conexion/conexionBD.php");
include("../includes/selectores.php");
include("../Conexion/valius.php");
?>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	
		<title>Editar Paciente</title>
				<link rel="stylesheet" href="../css/base.css">
				<link rel="stylesheet" href="../css/skeleton.css">
				<link rel="stylesheet" href="../css/layout.css">	
				<link rel="stylesheet" href="../css/principal.css">
				
</head>
<body>
	<?php include("../includes/menu.php"); ?>
	
	<tbody>
<?php 
	$ipaciente = $_GET["Id"];				
	$inombre = "";							
	$iapellido = "";						
	$idpi = "";								
	$idireccion = "";						
	$imail = "";							
	$itelefono = "";						
	$init = "";								
	$igenero = "";							
	$ipais = "";							
	$idepartamento = "";					
	$imunicipio = "";						
	$iseguro = "";							
	$ifecha_nacimiento = "";
	$ihospital = "";

		if (isset($_POST["entrar"])) 
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
					
					
				$query="update redhospitalaria.paciente set nombre= '".$inombre."', apellido= '".$iapellido."', dpi= '".$idpi."', direccion= '".$idireccion."', mail= '".$imail."', telefono= '".$itelefono."', nit='".$init."', genero= '".$igenero."', pais= '".$ipais."', departamento= '".$idepartamento."', municipio= '".$imunicipio."', seguro= '".$iseguro."', fecha_nacimiento= '".$ifecha_nacimiento."', hospital= '".$ihospital."' where paciente= ".$ipaciente;	

					mysql_query ($query);	
		}

				if (isset($ipaciente)) 
				{
				$result = mysql_query("select paciente, nombre, apellido, dpi, direccion, mail, telefono, nit, genero, pais, departamento, municipio, seguro, fecha_nacimiento, hospital from redhospitalaria.paciente where paciente =" .$ipaciente. ";");			
				echo mysql_error();

					if ($result ==0) 
					{
						echo "Error";
					}else
					{
						$row_array = mysql_fetch_array($result);

						$ipaciente  = $row_array[0];
						$inombre = $row_array[1];
						$iapellido = $row_array[2];
						$idpi = $row_array[3];
						$idireccion = $row_array[4];
						$imail = $row_array[5];
						$itelefono = $row_array[6];
						$init = $row_array[7];
						$igenero = $row_array[8];
						$ipais = $row_array[9];
						$idepartamento = $row_array[10];
						$imunicipio = $row_array[11];
						$iseguro = $row_array[12];
						$ifecha_nacimiento = $row_array[13];
						$ihospital = $row_array[14];
			}
		}
		
?>
	<form method="POST">
		<table  width="500"> 
			<h4>Editar Paciente:</h4>
			<tr>
				<td>Nombre:</td>
				<td><p><input name="NOMBRE" value="<?php echo $inombre ?>"></p></td>
			</tr>
			<tr>
		    	<td>Apellido:</td>
				<td><p><input name="APELLIDO" value="<?php echo $iapellido ?>"></p></td>
			</tr>
			<tr>
				<td>DPI:</td>
				<td><p><input name="DPI" value="<?php echo $idpi ?>"></p></td>
			</tr>
			<tr>
				<td>Direccion:</td>
				<td><p><input name="DIRECCION" value="<?php echo $idireccion ?>"></p></td>
			</tr>
			<tr>
				<td>MAIL:</td>
				<td><p><input name="MAIL" value="<?php echo $imail ?>"></p></td>
			</tr>	
			<tr>
				<td>Telefono:</td>
				<td><p><input name="TELEFONO" value="<?php echo $itelefono ?>"></p></td>
			</tr>
			<tr>
				<td>NIT:</td>
				<td><p><input name="NIT" value="<?php echo $init ?>"></p></td>
			</tr>
			<tr>
				<td>Genero:</td>
				<td>
					<SELECT name="GENERO"> 
								<OPTION SELECTED VALUE = "F">Femenino
								<OPTION VALUE= "M">Masculino
								</SELECT> 	
				</td>
			</tr>
			<tr>
				<td>Pais:</td>
				<td>
					<select name = "PAIS">
						<?php
							nuevoselector("pais", "nombre_pais", "pais", $ipais); 
						 ?>
					</select>
				</td>
			</tr>
			<tr>
				<td>Departamento:</td>
				<td>
					<select name = "DEPARTAMENTO">
						<?php
							nuevoselector("departamento", "nombre_departamento", "departamento", $idepartamento); 
						 ?>
					</select>
				</td>
			</tr>
			<tr>
				<td>Municipio:</td>
				<td>
					<select name = "MUNICIPIO">
						<?php
							nuevoselector("municipio", "nombre_municipio", "municipio", $imunicipio); 
						 ?>
					</select>
				</td>
			</tr>
			<tr>
				<td>Seguro:</td>
				<td>
					<SELECT name="SEGURO"> 
								<OPTION SELECTED VALUE = "A">Alta
								<OPTION VALUE= "B">Baja
								</SELECT> 
				</td>
			</tr>
			<tr>
				<td>Fecha de nacimiento:</td>
				<td><P><input name="FECHA_NACIMIENTO" value="<?php echo  $ifecha_nacimiento?>"></P></td>
			</tr>
			<tr>
				<td>Hospital:</td>
				<td>
					<select name = "HOSPITAL">
						<?php
							nuevoselector("hospital", "nombre", "hospital", $ihospital); 
						 ?>
					</select>
				</td>
			</tr>						
			
		</table>
			<button name="entrar" type="submit"></button>
			<button id="borrar" type="reset"></button>
		
	</form>
	</tbody>
</body>
</html>