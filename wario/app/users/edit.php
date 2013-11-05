<?php
	include("../includes/head.php");
	include("../includes/menu.php");
	
	
	$Id = "";
	$Nombre = "";
	$Correo = "";
	$Estatus = "";
	$Telefono = "";
	$Direccion = "";
	$Clave = "";
	$Imagen = "";
	
	if(!isset($_GET["Id"])){
		header("Location: index.php");	
	}else{

		$Id = $_GET["Id"];

		if (isset($_POST["boton"])){
			$Nombre = $_POST["Nombre"];
			$Correo = $_POST["Correo"];
			$Estatus = $_POST["Estatus"];
			$Telefono = $_POST["Telefono"];
			$Direccion = $_POST["Direccion"];
			
			$qryInsert = "UPDATE Usuario set Correo = ?, Clave = ?, Estatus = ?, Nombre = ?, Telefono = ?, Direccion = ? where Corporacion = ? and Id = ?;";
			
			$stmt = $db->prepare($qryInsert);
			$stmt->bind_param('ssssssii', $Correo, $Clave, $Estatus, $Nombre, $Telefono, $Direccion, $USER_CORPORATION, $Id);
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

		$stmt = $db->prepare("SELECT Corporacion, Id, Correo, Estatus, Nombre, Imagen, Telefono, Direccion FROM Usuario where Corporacion = ? and Id = ?;");
		$stmt->bind_param('ii', $USER_CORPORATION, $Id);
		
		$stmt->execute();
		$result = $stmt->get_result();
		$rowCount = mysqli_num_rows($result);
		$rowArray = mysqli_fetch_array($result);

		$Id = $rowArray["Id"];
		$Correo = $rowArray["Correo"];
		$Estatus = $rowArray["Estatus"];
		$Nombre = $rowArray["Nombre"];
		$Imagen = $rowArray["Imagen"];
		$Telefono = $rowArray["Telefono"];
		$Direccion = $rowArray["Direccion"];

	}

?>

<div class="container" style="padding-bottom: 30px;">
		<?php 
		
			if ($typeError){
				alert($typeError, $textError);
			}
		?>
		<div class="row">
			<div class="twelve columns">
				<div class="box_c">
					<div class="box_c_heading cf">
						<p>Editar Usuario</p>
					</div>
					<div class="box_c_content form_a">
						<div class="tab_pane" style="">
							<form action="" method="post" class="nice custom" style="">
								<div class="formRow">
									<label for="nice_text">Id</label>
									<input type="text" class="input-text" disabled value="<?php echo $Id ?>" />
									<input type="hidden" id="Id" name="Id" class="input-text" />
								</div>
								<div class="formRow">
									<label for="nice_text">Nombre</label>
									<input type="text" id="Nombre" name="Nombre" class="input-text" value="<?php echo $Nombre ?>">
								</div>
								<div class="formRow">
									<label for="nice_text_oversized">Correo Electrónico</label>
									<input type="text" id="Correo" name="Correo" class="input-text large" value="<?php echo $Correo ?>">
								</div>
								<div class="formRow">
									<label for="nice_text_small">Telefono</label>
									<input type="text" id="Telefono" name="Telefono" class="input-text large" value="<?php echo $Telefono ?>">
								</div>
								<div class="formRow">
									<label for="nice_text_medium">Dirección</label>
									<textarea name="Direccion" id="Direccion" cols="1" rows="1" class="large"><?php echo $Direccion ?></textarea>
								</div>
								<div class="formRow" style="">
									<label for="nice_select">Estatus</label>
									<select id="Estatus" name="Estatus" class="custom dropdown medium" >
										<option value="A" <?php if($Estatus == "A") echo "selected" ?>>Alta</option>
										<option value="B" <?php if($Estatus == "B") echo "selected" ?>>Baja</option>
									</select>
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