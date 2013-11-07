<?php
	include("../includes/head.php");
	include("../includes/menu.php");
	
	
	$Id = "";
	$Nombre = "";
	$Nit = "";
	$Estatus = "";
	$Telefono = "";
	$Direccion = "";

	if(!isset($_GET["id"])){
		header("Location: index.php?error=Cliente no valido.");	
	}else{

		$Id = $_GET["id"];

		if (isset($_POST["boton"])){
			$Nombre = $_POST["NombreComercial"];
			$Nit = $_POST["Nit"];
			$Telefono = $_POST["Telefono"];
			$Direccion = $_POST["Direccion"];
			$Estatus = $_POST["Estatus"];
			
			$qryInsert = "update cliente set nombrecomercial = ?, nit = ?, telefono = ?, direccion = ?, estatus = ? where corporacion = ? and id = ?;";
			
			$stmt = $db->prepare($qryInsert);
			$stmt->bind_param('sssssii', $Nombre, $Nit, $Telefono, $Direccion, $Estatus, $USER_CORPORATION, $Id);
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

		$stmt = $db->prepare("select corporacion, id, nombrecomercial, nit, estatus, telefono, direccion from cliente where corporacion = ? and id = ?;");
		$stmt->bind_param('ii', $USER_CORPORATION, $Id);
		
		$stmt->execute();
		$result = $stmt->get_result();
		$rowCount = mysqli_num_rows($result);
		$rowArray = mysqli_fetch_array($result);

		$Id = $rowArray["id"];
		$Nit = $rowArray["nit"];
		$Estatus = $rowArray["estatus"];
		$Nombre = $rowArray["nombrecomercial"];
		$Telefono = $rowArray["telefono"];
		$Direccion = $rowArray["direccion"];

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
						<p>Cliente</p>
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
									<label for="nice_text_oversized">Nit</label>
									<input type="text" id="Nit" name="Nit" class="input-text large" value="<?php echo $Nit ?>">
								</div>
								<div class="formRow">
									<label for="nice_text">Nombre</label>
									<input type="text" id="NombreComercial" name="NombreComercial" class="input-text" value="<?php echo $Nombre ?>">
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