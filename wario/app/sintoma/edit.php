<?php
	include("../includes/head.php");
	include("../includes/menu.php");
	
	
	$Id = "";
	$Descripcion = "";
	$Observacion = "";
	$Estatus = "";
	
	
	if(!isset($_GET["Id"])){
		header("Location: index.php");	
	}else{

		$Id = $_GET["Id"];

		if (isset($_POST["boton"])){
			$Id = $_POST["Id"];
			$Descripcion = $_POST["Descripcion"];
			$Observacion = $_POST["Observacion"];
			$Estatus = $_POST["Estatus"];
			
			
			$qryInsert = "update sintoma set descripcion = ?, observacion = ?, estatus = ? where corporacion = ? and id = ?;";
			
			$stmt = $db->prepare($qryInsert);
			$stmt->bind_param('sssii', $Descripcion, $Observacion, $Estatus, $USER_CORPORATION, $Id);
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

		$stmt = $db->prepare("select id, descripcion, observacion, estatus from sintoma where corporacion = ? and id = ?;");
		$stmt->bind_param('ii', $USER_CORPORATION, $Id);
		
		$stmt->execute();
		$result = $stmt->get_result();
		$rowCount = mysqli_num_rows($result);
		$rowArray = mysqli_fetch_array($result);

		$Descripcion = $rowArray["descripcion"];
		$Observacion = $rowArray["observacion"];
		$Estatus = $rowArray["estatus"];

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
						<p>Editar Pais</p>
					</div>
					<div class="box_c_content form_a">
						<div class="tab_pane" style="">
							<form action="" method="post" class="nice custom" style="">
								<input id="Id" name="Id" type="hidden" value="<?php echo $Id; ?>">
								<div class="formRow">
									<label for="nice_text">Descripcion</label>
									<input type="text" id="Descripcion" name="Descripcion" class="input-text" value="<?php echo $Descripcion; ?>">
								</div>

								<div class="formRow">
									<label for="nice_text_oversized">Observacion</label>
									<textarea name="Observacion" id="Observacion" cols="1" rows="1" class="large"><?php echo $Observacion; ?></textarea>
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