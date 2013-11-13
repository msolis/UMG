<?php
	include("../includes/head.php");
	include("../includes/menu.php");
	
	

		if (isset($_POST["boton"])){
			$Descripcion = $_POST["Descripcion"];
			$Observacion = $_POST["Observacion"];
			$Estatus = $_POST["Estatus"];
			
			$stmt = $db->prepare("SELECT ifnull(max(id),0)+1 as id from sintoma where corporacion = ?;");
			$stmt->bind_param('i', $USER_CORPORATION);
			
			$stmt->execute();
			$result = $stmt->get_result();
			$rowCount = mysqli_num_rows($result);
			$rowArray = mysqli_fetch_array($result);
			$Id = $rowArray["id"];
			
			
			$qryInsert = "insert into sintoma (corporacion, id, descripcion, observacion, estatus) values (?, ?, ?, ?, ?);";
			$stmt = $db->prepare($qryInsert);
			$stmt->bind_param('iisss', $USER_CORPORATION, $Id, $Descripcion, $Observacion, $Estatus);
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
						<p>Nuevo Sintoma</p>
					</div>
					<div class="box_c_content form_a">
						<div class="tab_pane" style="">
							<form action="" method="post" class="nice custom" style="">
								
								<div class="formRow">
									<label for="nice_text">Descripcion</label>
									<input type="text" id="Descripcion" name="Descripcion" class="input-text" value="">
								</div>

								<div class="formRow">
									<label for="nice_text_oversized">Observacion</label>
									<textarea name="Observacion" id="Observacion" cols="1" rows="1" class="large"></textarea>
								</div>
								
								<div class="formRow" style="">
									<label for="nice_select">Estatus</label>
									<select id="Estatus" name="Estatus" class="custom dropdown medium" >
										<option value="A" >Alta</option>
										<option value="B" >Baja</option>
									</select>
								</div>
								<div class="formRow">
                                    <button type="submit" name="boton" class="button small nice blue radius">Guardar</button>
									<a href="index.php" class="clear_form">Listado de Sintomas</a>
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