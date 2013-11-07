<?php
	include("../includes/head.php");
	include("../includes/menu.php");
	
	
	$Id = "";
	$Nombre = "";
	$Descripcion = "";
	$Estatus = "";

	if(!isset($_GET["id"])){
		header("Location: index.php?error=Especialidad de Medico no valido.");	
	}else{

		$Id = $_GET["id"];

		if (isset($_POST["boton"])){
			$Nombre = $_POST["Nombre"];
			$Descripcion = $_POST["Descripcion"];
			$Estatus = $_POST["Estatus"];
			
			$qryInsert = "update especialidad set nombre = ?, descripcion = ?, estatus = ? where corporacion = ? and id = ?;";
			
			$stmt = $db->prepare($qryInsert);
			$stmt->bind_param('sssii', $Nombre, $Descripcion, $Estatus, $USER_CORPORATION, $Id);
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

		$stmt = $db->prepare("select corporacion, id, nombre, descripcion, estatus from especialidad where corporacion = ? and id = ?;");
		$stmt->bind_param('ii', $USER_CORPORATION, $Id);
		
		$stmt->execute();
		$result = $stmt->get_result();
		$rowCount = mysqli_num_rows($result);
		$rowArray = mysqli_fetch_array($result);

		$Id = $rowArray["id"];
		$Nombre = $rowArray["nombre"];
		$Estatus = $rowArray["estatus"];
		$Descripcion = $rowArray["descripcion"];

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
						<p>Edicion de Especialidad</p>
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
									<label for="nice_text_oversized">Nombre de la Especialidad</label>
									<input type="text" id="Nombre" name="Nombre" class="input-text large" value="<?php echo $Nombre ?>">
								</div>
								<div class="formRow">
									<label for="nice_text_medium">Descripción</label>
									<textarea name="Descripcion" id="Descripcion" cols="1" rows="1" class="large"><?php echo $Descripcion ?></textarea>
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