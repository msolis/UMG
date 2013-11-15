<?php
	include("../includes/head.php");
	include("../includes/menu.php");
?>

<?php 

	$error = "";
	$success = "";
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
		$Estatus = "A";
		$Aseguradora = $_POST["Aseguradora"];
		$Poliza = $_POST["Poliza"];
		$Poliza_Expiracion = $_POST["Poliza_Expiracion"];
		$Poliza_Certificado = $_POST["Poliza_Certificado"];
		if ($Poliza_Expiracion == ""){
			$Poliza_Expiracion  = "1900-01-01";
		}
		$Poliza_Observacion = $_POST["Poliza_Observacion"];
		
		$stmt = $db->prepare("select ifnull(max(id),0)+1 as id from paciente where corporacion = ?;");
		$stmt->bind_param('i', $USER_CORPORATION);
		$stmt->execute();
		$result = $stmt->get_result();
		$rowArray = mysqli_fetch_array($result);

		$Id = $rowArray["id"];
		$qry = "insert into paciente (fecharegistro, corporacion, id, nombre, direccion, dpi, fechanacimiento, pais, departamento, estado_civil, correo, clave, genero, estatus, aseguradora, poliza, poliza_expiracion, poliza_certificado, poliza_observacion) " .
		 " values (curdate(), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?); ";
		$stmt = $db->prepare($qry);
		$stmt->bind_param('iissssiiissisissss', $USER_CORPORATION, $Id, $Nombre, $Direccion, $Dpi, $FechaNacimiento, $Pais, $Departamento, $EstadoCivil, $Correo, $Clave, $Genero, $Estatus, $Aseguradora, $Poliza, $Poliza_Expiracion, $Poliza_Certificado, $Poliza_Observacion);
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
						<p>Nuevo Paciente</p>
					</div>
					<div class="box_c_content form_a">
						<div class="tab_pane" style="">
							<form action="" method="post" class="nice custom" style="">
								<div class="formRow">
									<label for="nice_text_oversized">Nombre</label>
									<input type="text" required id="Nombre" name="Nombre" required class="input-text large">
								</div>
								<div class="formRow">
									<label for="nice_text_medium">Dirección</label>
									<textarea name="Direccion" id="Direccion" required cols="1" rows="1" class="large"></textarea>
								</div>
								<div class="formRow">
									<label for="nice_text_oversized">DPI</label>
									<input type="text" required id="Dpi" name="Dpi" required class="input-text large">
								</div>
								<div class="formRow">
									<label for="nice_text_oversized">Fecha de Nacimiento</label>
									<input type="date" required id="FechaNacimiento" name="FechaNacimiento" required class="input-text medium">
								</div>
								<div class="formRow">
									<label for="nice_text_oversized">Pais de Nacimiento</label>
									<select id="Pais" name="Pais" class="custom dropdown medium" >
										<?php newSelector("pais", "id", "descripcion", " where estatus = 'A'", ""); ?>
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
													console.log(data);
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
										});
									</script>
								</div>
								<div class="formRow">
									<label for="nice_text_oversized">Estado Civil</label>
									<select id="EstadoCivil" name="EstadoCivil" class="custom dropdown medium" >
										<?php newSelector("estado_civil", "id", "descripcion", " where estatus = 'A' and corporacion = " . $USER_CORPORATION, ""); ?>
									</select>
								</div>
								<div class="formRow">
									<label for="nice_text_oversized">Genero</label>
									<select id="Genero" name="Genero" class="custom dropdown medium" >
										<?php newSelector("genero", "id", "descripcion", " where estatus = 'A' and corporacion = " . $USER_CORPORATION, ""); ?>
									</select>
								</div>

								<div class="formRow">
									<label for="nice_text_oversized">Aseguradora</label>
									<select id="Aseguradora" name="Aseguradora" class="custom dropdown medium" >
										<?php newSelector("aseguradora", "id", "nombre", " where estatus = 'A' and corporacion = " . $USER_CORPORATION, ""); ?>
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
										});
									</script>
								</div>
								<div id="datos_poliza" style="display:none;">
									<div class="box_c_heading cf">
										<p>Datos de la Poliza</p>
									</div>
									<div class="formRow">
										<label for="nice_text_oversized"># Poliza</label>
										<input type="text" id="Poliza" name="Poliza" class="input-text large">
									</div>

									<div class="formRow">
										<label for="nice_text_oversized">Fecha de Expiracion de la Poliza</label>
										<input type="date" id="Poliza_Expiracion" name="Poliza_Expiracion" class="input-text large">
									</div>

									<div class="formRow">
										<label for="nice_text_oversized">Certificado de la Poliza</label>
										<input type="text" id="Poliza_Certificado" name="Poliza_Certificado" class="input-text large">
									</div>

									<div class="formRow">
										<label for="nice_text_medium">Observación de la P&oacute;liza</label>
										<textarea name="Poliza_Observacion" id="Poliza_Observacion" cols="1" rows="1" class="large"></textarea>
									</div>
								</div>

								<div class="formRow">
									<label for="nice_text_oversized">Correo Electrónico</label>
									<input type="email" id="Correo" name="Correo" required class="input-text large">
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