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

					$udepartamento = $_GET["Id"];
					$unombre="";
					$upais="";
					
					if(isset ($_POST["entrar"])){
						
					$unombre= $_POST["NOMBRE"];
					$upais= $_POST["PAIS"];
						
					$query="UPDATE redhospitalaria.departamento SET NOMBRE_DEPARTAMENTO='".$unombre."', PAIS= ".$upais." WHERE DEPARTAMENTO=".$udepartamento;
					
					mysql_query ($query);
					
					}
						
					if (isset($udepartamento))
					{
			$result = mysql_query("SELECT DEPARTAMENTO, NOMBRE_DEPARTAMENTO, PAIS FROM redhospitalaria.departamento WHERE DEPARTAMENTO = ".$udepartamento.";");
			echo mysql_error();
			
			if ($result ==0)
			{
			echo "Error";
			}else
			{
			$row_array = mysql_fetch_array($result);
			
			$udepartamento=$row_array[0];
			$unombre=$row_array[1];
			$upais=$row_array[2];
		}
	}
	
?>
	<form method="POST">
		<table  width="600"> 
			<h2>Editar Departamento</h2>
				
				
				<p><input name ="NOMBRE" value= "<?php echo $unombre?>"></p>
				
				<td>Pais</td>
							<td>
								<select name = "PAIS">
<?php
	nuevoSelector("PAIS", "NOMBRE_PAIS", "PAIS",$upais) ;  
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