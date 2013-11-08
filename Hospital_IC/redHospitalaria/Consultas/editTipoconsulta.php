<?php
include("../Conexion/conexionBD.php");
include("../includes/selectores.php");
include("../Conexion/valius.php");
?>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	
		<title>Editar Tipo Consulta</title>
				<link rel="stylesheet" href="../css/base.css">
				<link rel="stylesheet" href="../css/skeleton.css">
				<link rel="stylesheet" href="../css/layout.css">	
				<link rel="stylesheet" href="../css/principal.css">
				
</head>
<body>
	<?php include("../includes/menu.php"); ?>
	
	<tbody>
<?php 

					$utipo_Consulta = $_GET["Id"];
					$udescripcion = "";					
					$uestatus ="";
						
					if(isset ($_POST["entrar"])){

					$udescripcion = $_POST["DESCRIPCION"];
					$uestatus = $_POST["ESTATUS"];
					
					$query = "UPDATE redhospitalaria.tipo_consulta SET DESCRIPCION = '".$udescripcion."', ESTATUS= '".$uestatus."' where TIPO_CONSULTA = ".$utipo_Consulta;

					
					mysql_query ($query);
						
					}
					
			if (isset($udescripcion))
			{   
				$result = mysql_query("SELECT TIPO_CONSULTA, DESCRIPCION, ESTATUS FROM redhospitalaria.tipo_consulta WHERE TIPO_CONSULTA= ".$utipo_Consulta.";");
			
			echo mysql_error();
			
			if ($result ==0)
			{
			echo "Error";
			}else
			{
			$row_array = mysql_fetch_array($result);

			$utipo_Consulta = $row_array[0];
			$udescripcion =$row_array[1];
			$uestaus =$row_array[2];
			}
		}
		
			
	
?>
	<form method="POST">
		<table  width="600"> 
			<h2>Editar Tipo Consulta</h2>
						<tr>
				<td>Descripcion:</td>
				<td><p><input name="DESCRIPCION" value="<?php echo $udescripcion ?>"></p></td>
			</tr>		

						<td>Status</td>
							<td>
								<SELECT name="ESTATUS"> 
								<OPTION SELECTED VALUE = "A">Alta
								<OPTION VALUE= "B">Baja
								</SELECT> 
							</td>																			
							<button name="entrar" type="submit" ></button>
										<button id="borrar" type="reset"></button>					
										
		
				</table>
				
			</form>
		</tbody>
	</body>
</html>

