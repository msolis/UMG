

<?php include("include/conexion.php") ?>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="css/styles.css" />
	<title>Login</title>
</head>
<body>
	<?php

		if (isset($_POST["USUARIO"]))
		{
			$usuario = $_POST["USUARIO"];
			$clave = $_POST["CLAVE"];

			if (($clave == "") || ($usuario == ""))
				{
				header("Location: index.php");
				exit();
				}

			$result = mysql_query("select  count(*) as campo from usuario_paciente where usuario_paciente = '".$usuario."' and clave = '".$clave."';");
						
			if ($result == 0)
				echo "Base de Datos No existe";
			else{
			
						$row_array = mysql_fetch_array($result);
						$conteo = $row_array[0];
						if ($conteo == 0)
						{

							 $result2 = mysql_query("select  count(*) as campo from usuario_empleado where nom_usuario = '".$usuario."' and clave = '".$clave."';");
						
			                 if ($result2 == 0)
				                 echo "Base de Datos No existe";
			                 
					           else{
					
									  $row_array = mysql_fetch_array($result2);
									  $conteo1 = $row_array[0];
									  
									  if ($conteo1 == 0)
										{

										echo "USUARIO O CLAVE NO VALIDO MIERDA";
										}
						
										else
											{
																
																	 $result3 = mysql_query("select  count(*) as campo from usuario_empleado where nom_usuario = '".$usuario."' and clave = '".$clave."' and privilegios = 'a';");
						
			                  										 if ($result3 == 0)
				               										  echo "Base de Datos No existe";
			                 
					           											else{
					
																				  $row_array = mysql_fetch_array($result3);
																				  $conteo2 = $row_array[0];
									  
																				  if ($conteo2 == 0)
																					{
																							session_start();
																							$_SESSION["inicio_hosp"] = $usuario;
																							header("Location: js/menu2.php");	
																					
																					}
																	
																					else
																						{
																							session_start();
																							$_SESSION["admin"] = $usuario;
																							header("Location: js/menu3.php");
																										


																						
																										
																											
																						}
																				}

		
																
											}
									}
								}

						
					
					else
						{
							session_start();
							$_SESSION["inicio_pasientes"] = $usuario;
							header("Location: js/menu.php");
							
						}	
				
				}
			
		}
		?>
	<form method="POST" alin >

		<table id="tabla" width="270" height="171" border="0" text-color="black" ;>
			<style type="text/css">
            


        </style>
			<tr>
				<td>Usuario:</td>
				<td>
					<input name="USUARIO" required type="text" value="">
				</td>
			</tr>
			<tr>
				<td>Clave:</td>
				<td>
					<input name="CLAVE" required  type="password" value="">
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
					<input type="submit" value="Iniciar Sesion" alingn="center">
				</td>
			</tr>
		</table>
	</form>

</body>
</html>

