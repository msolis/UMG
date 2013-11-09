<?php
	include("../includes/head.php");
	include("../includes/menu.php");
	
	$Id = "";
	$Nombre = "";
	$Descripcion = "";
	$Diagnostico = "";
	$Estatus = "";
	
	if(!isset($_GET["id"])){
		header("Location: index.php?error=Enfermedad no valida.");
	}else{
		
		$Id = $_GET["id"];
		
		if (isset($_POST["boton"])){
			$Sintoma = $_POST["Sintoma"];
			$Observacion = $_POST["Observacion"];
			
			$qryInsert = "insert into enfermedad_sintoma (corporacion, enfermedad, sintoma, observacion, fecha_creacion) values(?, ?, ?, ?, curdate());";
			
			$stmt = $db->prepare($qryInsert);
			$stmt->bind_param('iiis', $USER_CORPORATION, $Id, $Sintoma, $Observacion);
			$rc = $stmt->execute();
			if (!$rc) {
				$typeError = "error";
				$textError = "NO se pudo guardar el registro. Error: " . $stmt->error;
			}else{
				$typeError = "success";
				$textError = "Información Editada Exitosamente.";
				header("Location: sintomas.php?id=" . $Id);
			}
			mysqli_stmt_close($stmt);
		}
	
		
	
		$stmt = $db->prepare("select corporacion, id, nombre, descripcion, diagnostrico, estatus from enfermedad where corporacion = ? and id = ?;");
		$stmt->bind_param('ii', $USER_CORPORATION, $Id);
	
		$stmt->execute();
		$result = $stmt->get_result();
		$rowCount = mysqli_num_rows($result);
		$rowArray = mysqli_fetch_array($result);
	
		$Id = $rowArray["id"];
		$Nombre = $rowArray["nombre"];
		$Descripcion = $rowArray["descripcion"];
		$Diagnostico = $rowArray["diagnostrico"];
		$Estatus = $rowArray["estatus"];
?>
<div class="container" style="padding-bottom: 30px;">
	<?php if(isset($_GET["error"])) { ?>
	<div class="row" id="alerta">
        <div class="twelve columns">
            <div class="box_c">
                <div class="box_c_heading cf">
                    <p>Alerta</p>
                </div>
                <div class="box_c_content">
                    <div class="alert-box warning">
                        <?php echo $_GET["error"]; ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php } ?>
    <script type="text/javascript">
    	$("#alerta").delay(60000).slideUp(1000);
    </script>
    
    <div class="row">
			<div class="twelve columns">
				<div class="box_c">
					<div class="box_c_heading cf">
						<p>Enfermedad</p>
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
									<input type="text" id="Nombre" disabled name="Nombre" class="input-text" value="<?php echo $Nombre ?>">
								</div>
								<div class="formRow">
									<label for="nice_text">Descripcion</label>
									<textarea name="Descripcion" id="Descripcion" disabled cols="1" rows="1" class="large"><?php echo $Descripcion ?></textarea>
								</div>
								<div class="formRow">
									<label for="nice_text">Diagnostico</label>
									<textarea name="Diagnostico" id="Diagnostico" disabled cols="1" rows="1" class="large"><?php echo $Diagnostico ?></textarea>
								</div>
								<div class="formRow" style="">
									<label for="nice_select">Estatus</label>
									<select id="Estatus" name="Estatus" disabled class="custom dropdown medium" >
										<option value="A" <?php if($Estatus == "A") echo "selected" ?>>Alta</option>
										<option value="B" <?php if($Estatus == "B") echo "selected" ?>>Baja</option>
									</select>
								</div>
								<div class="formRow">
									<a href="index.php" class="clear_form">Listado de Enfermedades</a>
                                </div>
							</form>
						</div>										
					</div>
				</div>
				</div>
			</div>
		</div>
		
	<?php 
			if ($typeError){
				alert($typeError, $textError);
			}
		?>
		<div class="row">
			<div class="twelve columns">
				<div class="box_c">
					<div class="box_c_heading cf">
						<p>Asignar sintomas</p>
					</div>
					<div class="box_c_content form_a">
						<div class="tab_pane" style="">
							<form action="" method="post" class="nice custom" style="">
							
								<div class="formRow" style="">
									<label for="nice_select">Sintoma</label>
									<select id="Sintoma" name="Sintoma" class="custom dropdown medium" >
										<?php newSelector("sintoma", "id", "descripcion", " where estatus = 'A' and corporacion = " . $USER_CORPORATION . " and id not in (select sintoma from enfermedad_sintoma where corporacion = " . $USER_CORPORATION . " and enfermedad = " . $Id . ");", ""); ?>
									</select>
								</div>
								
								<div class="formRow">
									<label for="nice_text">Observacion</label>
									<textarea name="Observacion" id="Observacion" cols="1" rows="1" class="large"></textarea>
								</div>

								<div class="formRow">
                                    <button type="submit" name="boton" class="button small nice blue radius">Asignar</button>
									<a href="sintomas.php?Id=<?php echo $Id; ?>" class="clear_form">Cancelar</a>
									<script type="text/javascript">
										if($("#Sintoma option").length == 0){
											$("[name=boton]").attr("disabled", "disabled");
										}
									</script>
                                </div>
							</form>
						</div>
										
					</div>
				</div>
			</div>
		</div>
</div>
<?php
	}
	include("../includes/footer.php");
?>