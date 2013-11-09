<?php
	include("../includes/head.php");
	include("../includes/menu.php");
?>

<?php 

	$error = "";
	$success = "";
	if (isset($_POST["boton"])){
		$Nombre = $_POST["Nombre"];
		$Descripcion = $_POST["Descripcion"];
		$Diagnostico = $_POST["Diagnostico"];
		$Estatus = $_POST["Estatus"];
		
		
			
			/// get new usuer id
			$stmt = $db->prepare("SELECT ifnull(max(id),0)+1 as id from enfermedad ");
			//$stmt->bind_param('i', $USER_CORPORATION);
			$stmt->execute();
			$result = $stmt->get_result();
			$rowArray = mysqli_fetch_array($result);			
			$Id = $rowArray["id"];
			
			$stmt = $db->prepare("insert into enfermedad (corporacion, id, nombre, descripcion, diagnostrico, fechacreacion, estatus) values (?, ?, ?, ?, ?, curdate(), ?);");
			$stmt->bind_param('iissss', $USER_CORPORATION, $Id, $Nombre, $Descripcion, $Diagnostico, $Estatus);
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
						<p>Nueva Enfermedad</p>
					</div>
					<div class="box_c_content form_a">
						<div class="tab_pane" style="">
							<form action="" method="post" class="nice custom" style="">
								<div class="formRow">
									<label for="nice_text">Nombre</label>
									<input type="text" required id="Nombre" name="Nombre" class="input-text">
								</div>
								<div class="formRow">
									<label for="nice_text_oversized">Descripcion</label>
									<textarea name="Descripcion" id="Descripcion" cols="1" rows="1" class="large"></textarea>
								</div>
								<div class="formRow">
									<label for="nice_text_oversized">Diagnostico</label>
									<textarea name="Diagnostico" id="Diagnostico" cols="1" rows="1" class="large"></textarea>
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