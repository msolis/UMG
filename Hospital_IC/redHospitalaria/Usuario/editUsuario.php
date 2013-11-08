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
$usuario = $_GET["Id"];
$unombre = "";
$password = "";
$uhospital = "";
$ustatus= "";
$upermisos ="";

if(isset ($_POST ["entrar"])){

	$unombre = $_POST["NOMBRE"];
	$password = $_POST["CLAVE"];
	$uhospital = $_POST["HOSPITAL"];
	$ustatus= $_POST["STATUS"];
	$upermisos = $_POST["PERMISOS"];
		
	$query="UPDATE redhospitalaria.usuario SET NOMBRE='".$unombre."', CLAVE= '".$password."', HOSPITAL= ".$uhospital.",
			 STATUS= '".$ustatus."', PERMISOS= ".$upermisos."  where  USUARIO= ".$usuario;
	mysql_query ($query);

}
	
if (isset($usuario))
{
	$result = mysql_query("SELECT USUARIO, NOMBRE, CLAVE, HOSPITAL, STATUS, PERMISOS FROM redhospitalaria.usuario
							WHERE USUARIO = " . $usuario . ";");
	echo mysql_error();
		
	if ($result ==0)
	{
		echo "Error";
	}else
	{
		$row_array = mysql_fetch_array($result);

		$usuario = $row_array[0];
		$unombre = $row_array[1];
		$password = $row_array[2];
		$uhospital = $row_array[3];
		$ustatus = $row_array[4];
		$upermisos = $row_array[5];
			
	}
}

?>
<form method="POST">
		<table  width="600">
			<h2>EDITAR USUARIO</h2>
				<p><input name= "NOMBRE" value= "<?php echo $unombre?>"></p>
				<p><input name= "CLAVE" value= "<?php echo $password?>" </p><tr>
					<td>Hospital</td>
					<td>
						<select name = "HOSPITAL">
<?php
	nuevoSelector("HOSPITAL", "NOMBRE", "HOSPITAL", $uhospital);   
?>
	        			</select>
	        		</td>
        		</tr>
        		
				<td>Status</td>
					<td>
							<SELECT NAME="STATUS"> 
								<OPTION SELECTED VALUE = "A">Alta
								<OPTION VALUE= "B">Baja
								</SELECT> 
							</td>
									<tr>
										<td>Permisos</td>
										<td>
										<select name = "PERMISOS">
		<?php
						nuevoSelector("PERMISOS", "NOMBRE_PERMISO", "PERMISOS", $upermisos);   
	    ?>
						        		</select>
										<button name="entrar" type="submit"></button>
										<button id="borrar" type="reset"></button>
									</table>
			</form>
		</tbody>
		<body>
</html>

