<?php
	include("../includes/head.php");
	include("../includes/menu.php");
?>

<?php 

	$error = "";
	$success = "";
	$typeError = "";
	if (isset($_POST["boton"])){
		$Nombre = $_POST["Nombre"];
		$Descripcion = $_POST["Descripcion"];
		$Estatus = $_POST["Estatus"];
		
		$error = "";
		
		$stmt = $db->prepare("SELECT ifnull(max(id),0)+1 as id from especialidad where corporacion = ?;");
		$stmt->bind_param('i', $USER_CORPORATION);
		$stmt->execute();
		$result = $stmt->get_result();
		$rowArray = mysqli_fetch_array($result);
		
		$Id = $rowArray["id"];
		
		$stmt = $db->prepare("insert into especialidad (corporacion, id, nombre, descripcion, estatus) values (?, ?, ?, ?, ?);");
		$stmt->bind_param('iisss', $USER_CORPORATION, $Id, $Nombre, $Descripcion, $Estatus);
		$rc = $stmt->execute();
		if (!$rc) {
			$typeError = "error";
			$textError = "NO se pudo guardar el registro. Error: " . $stmt->error;
		}else{
			$typeError = "success";
			$textError = "Información ha sido guardada exitosamente.";
		}
		
		
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
						<p>Nueva Especialidad de Medicos</p>
					</div>
					<div class="box_c_content form_a">
						<div class="tab_pane" style="">
							<form action="" method="post" class="nice custom" style="">
								<div class="formRow">
									<label for="nice_text_oversized">Nombre</label>
									<input type="text" required id="Nombre" name="Nombre" required class="input-text large">
								</div>
								<div class="formRow">
									<label for="nice_text_medium">Descripción</label>
									<textarea name="Descripcion" id="Descripcion" required cols="1" rows="1" class="large"></textarea>
								</div>
								<div class="formRow" style="">
									<label for="nice_select">Estatus</label>
									<select id="Estatus" name="Estatus" class="custom dropdown medium" >
										<option value="A">Alta</option>
										<option value="B">Baja</option>
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