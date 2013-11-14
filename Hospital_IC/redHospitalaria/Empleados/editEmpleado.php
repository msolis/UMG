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

					$udatospersonales = $_GET["Id"];
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
								
					$query="update redhospitalaria.datos_personales set nombre= '".$unombre."', apellido= '".$uapellido."', dpi= '".$udpi."',  telefono= '".$utelefono."' , direccion='".$udireccion."', pais=".$upais.", departamento=".$udepartamento.", municipio =".$umunicipio.", titulo=".$utitulo.", genero= '".$ugenero."', fecha_ingreso= '".$ufecha_ingreso."' , status= '".$ustatus."' where  datos_personales= ".$udatospersonales;
					
					mysql_query ($query);
						
					}
					
			if (isset($udatospersonales))
			{   
			$result = mysql_query("select datos_personales, nombre, apellido, dpi, telefono, direccion, pais, departamento, municipio, titulo, genero, fecha_ingreso,status from redhospitalaria.datos_personales where datos_personales = " .$udatospersonales. ";");
			echo mysql_error();
			
			if ($result ==0)
			{
			echo "Error";
			}else
			{
			$row_array = mysql_fetch_array($result);

			
			$udatospersonales=$row_array[0];
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
				<tr>
					<td>Nombre: </td>				
					<td><p><input name ="NOMBRE"  value= "<?php echo $unombre ?>"></p></td>
				</tr>
				
				<tr>
				<td>Apellido: </td>
				<td><p><input name ="APELLIDO" value= "<?php echo $uapellido ?>"></p></td>
				</tr>
				
				<tr>
					<td>DPI: </td>
					<td><p><input name ="DPI" value= "<?php echo $udpi ?>"></p></td>
				</tr>
				
				<tr>
					<td>Telefono: </td>
					<td><p><input name ="TELEFONO" value= "<?php echo $utelefono ?>"></p></td>
				</tr>
				
				<tr>
					<td>Direccion: </td>
					<td><p><input name ="DIRECCION" value= "<?php echo $udireccion ?>"></p></td>
				</tr>
				<tr>
					<td>Fecha de Ingreso: </td>
					<td><p><input name= FECHA_INGRESO value= "<?php echo $ufecha_ingreso ?>"></p></td>
				</tr>
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
				<tr>
					<td>Genero</td>
					
							<td>
								<SELECT name="GENERO"> 
								<OPTION SELECTED VALUE = "F">Femenino
								<OPTION VALUE= "M">Masculino
								</SELECT> 
							</td>
				</tr>
				<tr>
							<td>Status</td>
							<td>
								<SELECT name="STATUS"> 
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

