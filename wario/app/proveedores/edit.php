<?php
	include("../includes/head.php");
	include("../includes/menu.php");
	
	
	$Id = "";
	$Nombre = "";
	$Direccion = "";
	$Nit = "";
	$Correo = "";
	$Telefono = "";
	$Celular = "";

	
	if(!isset($_GET["Id"])){
		header("Location: index.php");	
	}else{

		$Id = $_GET["Id"];

		if (isset($_POST["boton"])){
			$Nombre = $_POST["Nombre"];
			$Direccion = $_POST["Direccion"];
			$Nit = $_POST["Nit"];
			$Correo = $_POST["Correo"];
			$Telefono = $_POST["Telefono"];
			$Celular = $_POST["Celular"];
				
			
			$qryInsert = "update proveedor set nombre = ?, direccion = ?, nit = ?, correo = ?, telefono = ?, celucar = ? where corporacion = ? and id = ?;";
			
			$stmt = $db->prepare($qryInsert);
			$stmt->bind_param('ssssssii', $Nombre, $Direccion, $Nit, $Correo, $Telefono, $Celular, $USER_CORPORATION, $Id);
			$rc = $stmt->execute();
			if (!$rc) {
				$typeError = "error";
				$textError = "NO se pudo guardar el registro. Error: " . $stmt->error;
			}else{
				$typeError = "success";
				$textError = "Información Editada Exitosamente.";
			}
			mysqli_stmt_close($stmt);
		}

		$stmt = $db->prepare("select corporacion, id, nombre, direccion, nit, correo, telefono, celucar from proveedor where corporacion = ? and id = ?;");
		$stmt->bind_param('ii', $USER_CORPORATION, $Id);
		
		$stmt->execute();
		$result = $stmt->get_result();
		$rowCount = mysqli_num_rows($result);
		$rowArray = mysqli_fetch_array($result);

		$Id = $rowArray["id"];
		$Nombre = $rowArray["nombre"];
		$Direccion = $rowArray["direccion"];
		$Nit = $rowArray["nit"];
		$Correo = $rowArray["correo"];
		$Telefono = $rowArray["telefono"];
		$Celular = $rowArray["celucar"];

	}

?>

<div class="container" style="padding-bottom: 30px;">
		<?php 
		
			if ($typeError){
				alert($typeError, $textError);
			}
		?>
		<div class="container" style="padding-bottom: 30px;">

		<div class="row">
			<div class="twelve columns">
				<div class="box_c">
					<div class="box_c_heading cf">
						<p>Editar Proveedor</p>
					</div>
					<div class="box_c_content form_a">
						<div class="tab_pane" style="">
							<form action="" method="post" class="nice custom" style="">
								<div class="formRow">
									<label for="nice_text">Nombre</label>
									<input type="text" required id="Nombre" name="Nombre" class="input-text" value="<?php echo $Nombre ?>">
								</div>
								<div class="formRow">
									<label for="nice_text_oversized">Direccion</label>
									<input type="text" required id="Direccion" name="Direccion" class="input-text large" value="<?php echo $Direccion ?>">
								</div>
								<div class="formRow">
									<label for="nice_text_oversized">Nit</label>
									<input type="text" required id="Nit" name="Nit" class="input-text " value="<?php echo $Nit ?>">
								</div>
								<div class="formRow">
									<label for="nice_text_small">Correo</label>
									<input type="email" required id="Correo" name="Correo" class="input-text " value="<?php echo $Correo ?>">
								</div>
								<div class="formRow">
									<label for="nice_text_medium">Telefono</label>
									<input type="text"  id="Telefono" name="Telefono" class="input-text" value="<?php echo $Telefono ?>">
								</div>
								<div class="formRow">
									<label for="nice_text_medium">Celular</label>
									<input type="text"  id="Celular" name="Celular" class="input-text" value="<?php echo $Celular ?>">
								</div>
								
								<div class="formRow">
                                    <button type="submit" name="boton" class="button small nice blue radius">Guardar</button>
									<a href="index.php" class="clear_form">Cancelar</a>
									
									
                                </div>
							</form>
						</div>
										
					</div>
				</div>
			</div>
		</div>
</div>
<?php
	include("../includes/footer.php");
?>