<?php
include("../Conexion/conexionBD.php");
include("../includes/selectores.php");
include("../Conexion/valius.php");
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
						
					if(isset ($_POST["entrar"])){
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
								
					$query="UPDATE redhospitalaria.datos_personales SET NOMBRE= '".$unombre."', APELLIDO= '".$uapellido."', DPI= '".$udpi."',  TELEFONO= '".$utelefono."' , DIRECCION='".$udireccion."', PAIS=".$upais.", DEPARTAMENTO=".$udepartamento.", MUNICIPIO =".$umunicipio.", TITULO=".$utitulo.", GENERO= '".$ugenero."', FECHA_INGRESO= '".$ufecha_ingreso."' , STATUS= '".$ustatus."' where  DATOS_PERSONALES= ".$udatosPersonales;
					
					mysql_query ($query);
						
					}
					
			if (isset($udatosPersonales))
			{   
			$result = mysql_query("SELECT DATOS_PERSONALES, NOMBRE, APELLIDO, DPI, TELEFONO, DIRECCION, PAIS, DEPARTAMENTO, MUNICIPIO, TITULO, GENERO, FECHA_INGRESO,STATUS FROM redhospitalaria.datos_personales WHERE DATOS_PERSONALES = " .$udatosPersonales. ";");
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
			$ufecha_ingreso =$row_array[11];
			$ustaus =$row_array[12];
			}
		}
		
			
	
?>
	<form method="POST">
		<table  width="600"> 
			<h2>Editar Empleado</h2>
				
				
				<p><input name ="NOMBRE"  value= "<?php echo $unombre ?>"></p>
				<p><input name ="APELLIDO" value= "<?php echo $uapellido ?>"></p>
				<p><input name ="DPI" value= "<?php echo $udpi ?>"></p>
				<p><input name ="TELEFONO" value= "<?php echo $utelefono ?>"></p>
				<p><input name ="DIRECCION" value= "<?php echo $udireccion ?>"></p>
				
					<tr>
						<td>Pais</td>
							<td>
								<select name = "PAIS">
<?php
	nuevoSelector("PAIS", "NOMBRE_PAIS", "PAIS", $upais) ;  
?>
	        					</select>
	        				</td>
        			</tr>
        			<tr>
        			<td>Departamento</td>
							<td>
								<select name = "DEPARTAMENTO">
<?php
	nuevoSelector("DEPARTAMENTO", "NOMBRE_DEPARTAMENTO", "DEPARTAMENTO", $udepartamento) ;  
?>
	        					</select>
	        				</td>
        			</tr>
        			<tr>
        			<td>Municipio</td>
							<td>
								<select name = "MUNICIPIO">
<?php
	nuevoSelector("MUNICIPIO", "NOMBRE_MUNICIPIO", "MUNICIPIO", $umunicipio);  
?>
	        					</select>
	        				</td>
        			</tr>
        			<tr>
        			<td>Titulo</td>
							<td>
								<select name = "TITULO">
<?php
	nuevoSelector("TITULO", "NOMBRE_TITULO", "TITULO", $utitulo);  
?>
	        					</select>
	        				</td>
        			</tr>
        		
				<td>Genero</td>
							<td>
								<SELECT name="GENERO"> 
								<OPTION SELECTED VALUE = "F">Femenino
								<OPTION VALUE= "M">Masculino
								</SELECT> 
							</td>
							<td>Status</td>
							<td>
								<SELECT name="STATUS"> 
								<OPTION SELECTED VALUE = "A">Alta
								<OPTION VALUE= "B">Baja
								</SELECT> 
							</td>
										
				
							</tr>
									
									<p><input name= FECHA_INGRESO value= "<?php echo $ufecha_ingreso ?>"></p>
										
										<button name="entrar" type="submit"></button>
										<button id="borrar" type="reset"></button>
		
				</table>
			</form>
		</tbody>
	</body>
</html>

