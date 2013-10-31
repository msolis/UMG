<?php
include("../Conexion/conexionBD.php");
include("../includes/selectores.php");
?>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	
		<title>Editar Usuario</title>
				<link rel="stylesheet" href="../css/base.css">
				<link rel="stylesheet" href="../css/skeleton.css">
				<link rel="stylesheet" href="../css/layout.css">	
				<link rel="stylesheet" href="../css/principal.css">
				
</head>
<body>
	<?php include("../includes/menu.php"); ?>
	
	<tbody>
<?php 

					$udatosPersonales = $_GET["Id"];
					$unombre = "";
					$uapellido = "";
					$udpi = "";
					$utelefono ="";
					$udireccion = "";
					$upais = "";
					$udepartamento ="";
					$umunicipio = "";
					$utitulo = "";
					$ugenero = "";
					$ufecha_ingreso ="";
					$ustatus ="";
						
					if(isset ($_POST ["entrar"])){
						
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
					$ustatus =$_POST["Status"];
								
					$query="UPDATE redhospitalaria.datos_personales SET NOMBRE='".$unombre."', APELLIDO= '".$uapellido."', DIPL= '".$udpi."', STATUS= '".$ustatus."', TELEFONO= ".$utelefono." , DIRECCION='".$udireccion."', PAIS= ".$upais.", DEPARTAMENTO= ".$udepartamento.", MUNICIPIO = ".$umunicipio.", TITULO= ".$utitulo.", GENERO= '".$ugenero."', FECHA_INGRESO= ".$ufecha_ingreso.", Status= '".$ustatus."' where  DATOS_USUARIO= ".$udatosPersonales;
					mysql_query ($query);
						
					}
					
			if (isset($unombre))
			{   
			$result = mysql_query("SELECT DATOS_PERSONALES, NOMBRE, APELLIDO, DPI, TELEFONO, DIRECCION,PAIS, DEPARTAMENTO, MUNICIPIO, TITULO, GENERO, FECHA_INGRESO, STATUS FROM redhospitalaria.datos_personales WHERE DATOS_PERSONALES = " .$udatosPersonales. ";");
			echo mysql_error();
			
			if ($result ==0)
			{
			echo "Error";
			}else
			{
			$row_array = mysql_fetch_array($result);

			
			$udatosPersonales=$row_array[0];
			$unombre = $row_array[1];
			$uapellido = $row_array[2];
			$udpi = $row_array[3];
			$utelefono = $row_array[4];
			$udireccion = $row_array[5];
			$upais = $row_array[6];
			$udepartamento = $row_array[7];
			$umunicipio = $row_array[8];
			$utitulo = $row_array[9];
			$ugenero = $row_array[10];
			$ufecha_ingreso = $row_array[11];
			$ustatus =$row_array[12];
				
			}
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
						<td>Pais</td>
							<td>
								<select name = "PAIS">
<?php
	nuevoSelector("PAIS", "NOMBRE_PAIS", "PAIS", "") ;  
?>
	        					</select>
	        				</td>
        			</tr>
        			<tr>
        			<td>Departamento</td>
							<td>
								<select name = "DEPARTAMENTO">
<?php
	nuevoSelector("DEPARTAMENTO", "NOMBRE_DEPARTAMENTO", "DEPARTAMENTO", "") ;  
?>
	        					</select>
	        				</td>
        			</tr>
        			<tr>
        			<td>Municipio</td>
							<td>
								<select name = "MUNICIPIO">
<?php
	nuevoSelector("MUNICIPIO", "NOMBRE_MUNICIPIO", "MUNICIPIO", "") ;  
?>
	        					</select>
	        				</td>
        			</tr>
        			<tr>
        			<td>Titulo</td>
							<td>
								<select name = "TITULO">
<?php
	nuevoSelector("TITULO", "NOMBRE_TITULO", "TITULO", "") ;  
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
										
				<td>Status</td>
							<td>
								<SELECT NAME="Status"> 
								<OPTION SELECTED VALUE = "A">Alta
								<OPTION VALUE= "B">Baja
								</SELECT> 
							</td>
				
									</tr>
									
									<p><input name ="FECHA_INGRESO" type="text" placeholder="Fecha Ingreso yyyymmdd" required=""></p>
														        		
										<button id="entrar" type="submit"></button>
										<button id="borrar" type="reset"></button>
		
		</table>
			</form>
		</tbody>
	</body>
</html>

