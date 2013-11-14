<?php
	include("../includes/head.php");
	include("../includes/menu.php");
?>

<?php 

	$error = "";
	$success = "";
	
	$Nombre = "";
	$Direccion = "";
	$Dpi = "";
	$FechaNacimiento = "";
	$Pais = "";
	$Departamento = "";
	$EstadoCivil = "";
	$Genero = "";
	$Correo = "";
	$Clave = "";
	$Estatus = "";
	$Aseguradora = "";
	$Poliza = "";
	$Poliza_Expiracion = "";
	$Poliza_Certificado = "";
	
	if(!isset($_GET["id"])){
		header("Location: index.php?error=Especialidad de Medico no valido.");
	}
	
	$Id = $_GET["id"];
	
	if (isset($_POST["boton"])){
		
		$Nombre = $_POST["Nombre"];
		$Direccion = $_POST["Direccion"];
		$Dpi = $_POST["Dpi"];
		$FechaNacimiento = $_POST["FechaNacimiento"];
		$Pais = $_POST["Pais"];
		$Departamento = $_POST["Departamento"];
		$EstadoCivil = $_POST["EstadoCivil"];
		$Genero = $_POST["Genero"];
		$Correo = $_POST["Correo"];
		$Clave = "23";
		$Estatus = $_POST["Estatus"];
		$Aseguradora = $_POST["Aseguradora"];
		$Poliza = $_POST["Poliza"];
		$Poliza_Expiracion = $_POST["Poliza_Expiracion"];
		$Poliza_Certificado = $_POST["Poliza_Certificado"];
		if ($Poliza_Expiracion == ""){
			$Poliza_Expiracion  = "1900-01-01";
		}
		$Poliza_Observacion = $_POST["Poliza_Observacion"];
		$Id = $_POST["Id"];

		$qry = "update paciente set nombre = ?, direccion = ?, dpi = ?, fechanacimiento = ?, pais = ?, departamento = ?, estado_civil = ?, correo = ?, clave = ?" . 
			", genero = ?, estatus = ?, aseguradora = ?, poliza = ?, poliza_expiracion = ?, poliza_certificado = ?, poliza_observacion = ? where corporacion = ? and id  = ?; ";

		$stmt = $db->prepare($qry);
		$stmt->bind_param('ssssiiissisissssii', $Nombre, $Direccion, $Dpi, $FechaNacimiento, $Pais, $Departamento, $EstadoCivil, $Correo, $Clave, $Genero, $Estatus, $Aseguradora, $Poliza, $Poliza_Expiracion, $Poliza_Certificado, $Poliza_Observacion, $USER_CORPORATION, $Id);

		$rc = $stmt->execute();
		if (!$rc) {
			$typeError = "error";
			$textError = "NO se pudo guardar el registro. Error: " . $stmt->error;
		}else{
			$typeError = "success";
			$textError = "Información ha sido guardada exitosamente.";
		}
	}
	
	$stmt = $db->prepare("select fecharegistro, corporacion, id, nombre, direccion, dpi, fechanacimiento, pais, departamento, estado_civil, correo, clave, genero, estatus, aseguradora, poliza, poliza_expiracion, poliza_certificado, poliza_observacion from paciente where corporacion = ? and id = ?;");
	$stmt->bind_param('ii', $USER_CORPORATION, $Id);
	
	$stmt->execute();
	$result = $stmt->get_result();
	$rowCount = mysqli_num_rows($result);
	$rowArray = mysqli_fetch_array($result);

	$Nombre = $rowArray["nombre"];
	$Direccion = $rowArray["direccion"];
	$Dpi = $rowArray["dpi"];
	$FechaNacimiento = $rowArray["fechanacimiento"];
	$Pais = $rowArray["pais"];
	$Departamento = $rowArray["departamento"];
	$EstadoCivil = $rowArray["estado_civil"];
	$Genero = $rowArray["genero"];
	$Correo = $rowArray["correo"];
	$Estatus = $rowArray["estatus"];
	$Aseguradora = $rowArray["aseguradora"];
	$Poliza = $rowArray["poliza"];
	$Poliza_Expiracion = $rowArray["poliza_expiracion"];
	$Poliza_Certificado = $rowArray["poliza_certificado"];
	$Poliza_Observacion = $rowArray["poliza_observacion"];

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
						<p>Editar Paciente</p>
						<span class="bAct_toggle"><img src="../images/blank.gif" class="bAct_minus" alt=""></span>
					</div>
					<div class="box_c_content form_a">
						<div class="tab_pane" style="">
							<form action="" method="post" class="nice custom" style="">
								<input type="hidden" id="Id" name="Id" value="<?php echo $Id; ?>">
								<div class="formRow">
									<label for="nice_text_oversized">Nombre</label>
									<input type="text" required id="Nombre" name="Nombre" required class="input-text large" value="<?php echo $Nombre; ?>">
								</div>
								<div class="formRow">
									<label for="nice_text_medium">Dirección</label>
									<textarea name="Direccion" id="Direccion" required cols="1" rows="1" class="large"><?php echo $Direccion; ?></textarea>
								</div>
								<div class="formRow">
									<label for="nice_text_oversized">DPI</label>
									<input type="text" required id="Dpi" name="Dpi" required class="input-text large" value="<?php echo $Dpi; ?>">
								</div>
								<div class="formRow">
									<label for="nice_text_oversized">Fecha de Nacimiento</label>
									<input type="date" required id="FechaNacimiento" name="FechaNacimiento" required class="input-text medium" value="<?php echo $FechaNacimiento; ?>">
								</div>
								<div class="formRow">
									<label for="nice_text_oversized">Pais de Nacimiento</label>
									<select id="Pais" name="Pais" class="custom dropdown medium" >
										<?php newSelector("pais", "id", "descripcion", " where estatus = 'A'", $Pais); ?>
									</select>
								</div>
								<div class="formRow">
									<label for="nice_text_oversized">Departamento de Nacimiento</label>
									<select id="Departamento" name="Departamento" class="custom dropdown medium" >
									</select>
									<script type="text/javascript">
										$(document).on("ready", function(){
											$("#Pais").on("change", function(){
												$("#Departamento").empty();
												$.post("../ws/departamentos.php", {
													pais: $("#Pais").val()
												}, function(data){
													if (data == null)
														return;
													$.each(data, function( key, value ) {
														console.log(key);
														console.log(value);
														$('#Departamento')
														.append($("<option></option>")
															.attr("value",value.id)
															.text(value.descripcion)); 
													});
												}, "json");
											});
											$("#Pais").change();
											$("#Departamento").val('<?php echo $Departamento; ?>');
										});
									</script>
								</div>
								<div class="formRow">
									<label for="nice_text_oversized">Estado Civil</label>
									<select id="EstadoCivil" name="EstadoCivil" class="custom dropdown medium" >
										<?php newSelector("estado_civil", "id", "descripcion", " where estatus = 'A' and corporacion = " . $USER_CORPORATION, $EstadoCivil); ?>
									</select>
								</div>
								<div class="formRow">
									<label for="nice_text_oversized">Genero</label>
									<select id="Genero" name="Genero" class="custom dropdown medium" >
										<?php newSelector("genero", "id", "descripcion", " where estatus = 'A' and corporacion = " . $USER_CORPORATION, $Genero); ?>
									</select>
								</div>

								<div class="formRow">
									<label for="nice_text_oversized">Aseguradora</label>
									<select id="Aseguradora" name="Aseguradora" class="custom dropdown medium" >
										<?php newSelector("aseguradora", "id", "nombre", " where estatus = 'A' and corporacion = " . $USER_CORPORATION, $Aseguradora); ?>
									</select>
									<script type="text/javascript">
										$(document).on("ready", function(){
											$("#Aseguradora").on("change", function(){
												if ($("#Aseguradora option:selected").index()!= 0){
													$("#datos_poliza").slideDown("fast");
												}else{
													$("#datos_poliza").slideUp("fast");
													$("#datos_poliza").find("#Poliza").val('');
													$("#datos_poliza").find("#Poliza_Expiracion").val('');
													$("#datos_poliza").find("#Poliza_Certificado").val('');
													$("#datos_poliza").find("#Poliza_Observacion").val('');
												}
											});
											$("#Aseguradora").change();
										});
									</script>
								</div>
								<div id="datos_poliza" style="display:none;">
									<div class="box_c_heading cf">
										<p>Datos de la Poliza</p>
									</div>
									<div class="formRow">
										<label for="nice_text_oversized"># Poliza</label>
										<input type="text" id="Poliza" name="Poliza" class="input-text large"  value="<?php echo $Poliza; ?>">
									</div>

									<div class="formRow">
										<label for="nice_text_oversized">Fecha de Expiracion de la Poliza</label>
										<input type="date" id="Poliza_Expiracion" name="Poliza_Expiracion" class="input-text large" value="<?php echo $Poliza_Expiracion; ?>">
									</div>

									<div class="formRow">
										<label for="nice_text_oversized">Certificado de la Poliza</label>
										<input type="text" id="Poliza_Certificado" name="Poliza_Certificado" class="input-text large"  value="<?php echo $Poliza_Certificado; ?>">
									</div>

									<div class="formRow">
										<label for="nice_text_medium">Observación de la P&oacute;liza</label>
										<textarea name="Poliza_Observacion" id="Poliza_Observacion" cols="1" rows="1" class="large"><?php echo $Poliza_Observacion; ?></textarea>
									</div>
								</div>

								<div class="formRow">
									<label for="nice_text_oversized">Correo Electrónico</label>
									<input type="email" id="Correo" name="Correo" required class="input-text large" value="<?php echo $Correo; ?>">
								</div>
								<div class="formRow" style="">
									<label for="nice_select">Estatus</label>
									<select id="Estatus" name="Estatus" class="custom dropdown medium" >
										<option value="A" <?php if($Estatus == "A") echo " selected " ?>>Alta</option>
										<option value="B" <?php if($Estatus == "B") echo " selected " ?>>Baja</option>
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
		
		<div class="row">
			<div class="twelve columns">
				<div class="box_c">
					<div class="box_c_heading cf">
						<p>Fotografías</p>
						<span class="bAct_toggle"><img src="../images/blank.gif" class="bAct_minus" alt=""></span>
					</div>
					<div class="box_c_content">
						<div class="gal_scrollable h_scrollable sepH_a sw_resizedEL" style="height: 334px;">
							<div class="items" style="left: 0px; width: 100%;">
								<ul class="gallery_list left cf" style="width: 100%;">
									<?php 
	                	
									$stmt = $db->prepare("select id from paciente_foto where corporacion = ? and paciente = ? and estatus = 'A';");
					                	$stmt->bind_param("ii", $USER_CORPORATION, $Id);
					                	$stmt->execute();
					                	
					                	$result = $stmt->get_result();
					                	$contador = mysqli_num_rows($result);
					                	
					                	while ($row = $result->fetch_assoc()) {
												
					                ?>
									<li style="width: 15%;">
										<a href="../includes/showimage.php?table=1&paciente=<?php echo $Id; ?>&id=<?php echo $row["id"]; ?>" class="fancybox img_wrapper" rel="gallery">
											<img style="width: 100%; height: 100%;" src="../includes/showimage.php?table=1&paciente=<?php echo $Id; ?>&id=<?php echo $row["id"]; ?>" alt="">
										</a>
									</li>
									<?php 
									}
									?>
								</ul>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="twelve columns">
				<div class="box_c">
					<div class="box_c_heading cf">
						<p>Agregar Fotografía</p>
						<span class="bAct_toggle"><img src="../images/blank.gif" class="bAct_minus" alt=""></span>
					</div>
					<div class="box_c_content form_a">
						<div class="tab_pane" style="">
							<form enctype="multipart/form-data" action="subirfotopaciente.php" method="post" class="nice custom" style="">
								<input name="MAX_FILE_SIZE" value="102400" type="hidden">
								<input type="hidden" id="Id" name="Id" value="<?php echo $Id; ?>">
								<input type="hidden" id="table" name="table" value="1">
								<div class="formRow">
									<label for="nice_text_oversized">Imagen</label>
									<input type="file" required id="image" name="image" accept="image/jpeg" class="input-text large" value="<?php echo $Nombre; ?>">
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