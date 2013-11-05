<?php 
    
	include("../../include/conexion.php");
	include("../../include/selec.php");
?>
<html>
<head>
	<title>Usuarios de Empleados</title>
</head>
<body>
	<?php 

		if (isset($_POST["USUARIO"]))

		{
		
		$unombre = $_POST["NOMBRE"];
		$unomusuario = $_POST["USUARIO"];
		$uclave = $_POST["CLAVE"];
		$uprivilegios = $_POST["PRIVILEGIOS"];
		$uestatus = $_POST["ESTATUS"];
		
		
		
		$query="INSERT INTO hospitaldb.usuario_empleado( PERSONA, NOM_USUARIO, CLAVE, PRIVILEGIOS, ESTATUS) VALUES( ".$unombre.", '".$unomusuario."',
		 '".$uclave."',' ".$uprivilegios."','".$uestatus."');";
		mysql_query ($query);

		}

?>
	<form action="ingreso.php" method="POST">
		<table>
			<tr>
				<td>Nombre Usuario:</td>
				<td>
					<input name="USUARIO" required type="text" value="">
				</td>
			</tr>
			<tr>
				<td>Contraseña:</td>
				<td>
					<input name="CLAVE" required  type="password" value="">
				</td>
			</tr>
			<tr>
				<td>Estatus:</td>
				<td>
					<SELECT name="ESTATUS"> 
								<OPTION SELECTED VALUE = "A">Alta
								<OPTION VALUE= "B">Baja
					</SELECT> 
				</td>
			</tr>
			<tr>
				<td>Nombre Empleado:</td>
				<td>
					<SELECT name="NOMBRE"> 
<?php
	nuevoSelector("ID_PERSONA", "NOMBRES", "PERSONA", "") ;  
?>
					</SELECT> 
				
				</td>
			</tr>
			
			<tr>
				<td colspan="2" style="text-align: center;">
					<input type="submit" name= "SAVE" value="Guardar">
				    <a href= "ingreso.php">Incio</a> 
				</td>
			</tr>
		</table>
	</form>
	<a href="usuarios.php">Listado de Trabajos</a>
</body>
</html>
