<?php
	include("../includes/head.php");
	include("../includes/menu.php");
?>

<?php 

	$error = "";
	$success = "";
	$Id = $_GET["Id"];

	$Nombre = "";
	$Descripcion  = "";
	$Diagnostico = "";
	$Estatus = "";

	if (isset($_POST["boton"])){
		$Id = $_POST["Id"];
		$Nombre = $_POST["Nombre"];
		$Descripcion = $_POST["Descripcion"];
		$Diagnostico = $_POST["Diagnostico"];
		$Estatus = $_POST["Estatus"];
		
		$stmt = $db->prepare("update enfermedad set nombre = ?, descripcion = ?, diagnostrico = ?, estatus = ? where corporacion = ? and  id = ?;");
		$stmt->bind_param('ssssii', $Nombre, $Descripcion, $Diagnostico, $Estatus, $USER_CORPORATION, $Id);
		$rc = $stmt->execute();
		if (!$rc) {
			$typeError = "error";
			$textError = "NO se pudo guardar el registro. Error: " . $stmt->error;
		}else{
			$typeError = "success";
			$textError = "Información ha sido guardada exitosamente.";
		}
	}

	$stmt = $db->prepare('select id, nombre, descripcion, diagnostrico, estatus from enfermedad where corporacion = ? and id = ?;');
	$stmt->bind_param('ii', $USER_CORPORATION, $Id);
	$stmt->execute();
	$result = $stmt->get_result();
	$rowCount = mysqli_num_rows($result);
	$rowArray = mysqli_fetch_array($result);

	$Nombre = $rowArray["nombre"];
	$Descripcion = $rowArray["descripcion"];
	$Diagnostico = $rowArray["diagnostrico"];
	$Estatus = $rowArray["estatus"];

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
						<p>Nueva Enfermedad</p>
					</div>
					<div class="box_c_content form_a">
						<div class="tab_pane" style="">
							<form action="" method="post" class="nice custom" style="">
								<input type="hidden" id="Id" name="Id" value="<?php echo $Id; ?>">
								<div class="formRow">
									<label for="nice_text">Nombre</label>
									<input type="text" required id="Nombre" name="Nombre" class="input-text" value="<?php echo $Nombre; ?>">
								</div>
								<div class="formRow">
									<label for="nice_text_oversized">Descripcion</label>
									<textarea name="Descripcion" id="Descripcion" cols="1" rows="1" class="large"><?php echo $Descripcion ?></textarea>
								</div>
								<div class="formRow">
									<label for="nice_text_oversized">Diagnostico</label>
									<textarea name="Diagnostico" id="Diagnostico" cols="1" rows="1" class="large"><?php echo $Diagnostico ?></textarea>
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