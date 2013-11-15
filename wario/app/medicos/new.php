<?php
	include("../includes/head.php");
	include("../includes/menu.php");
?>

<?php 

	$error = "";
	$success = "";
	$typeError = "";
	$Pais = "";
	$Departamento = "";
	$Genero = "";
	$Estado_Civil = "";
	$Usuario = "";
	
	
	if (isset($_POST["boton"])){
		
		$Nombre = $_POST["Nombre"];
		$Direccion = $_POST["Direccion"];
		$Pais = $_POST["Pais"];
		$Departamento = $_POST["Departamento"];
		$Nacionalidad = $_POST["Nacionalidad"];
		$FechaNacimiento = $_POST["FechaNacimiento"];
		$Genero = $_POST["Genero"];
		$Estado_Civil = $_POST["Estado_Civil"];
		$Correo = $_POST["Correo"];
		$Correo_Confirmacion = $_POST["Correo_Confirmacion"];
		$Telefono = $_POST["Telefono"];
		$Estatus = "A";
		$Usuario = $_POST["Usuario"];
		$Clave = $_POST["Clave"];
		
		if ($Correo != $Correo_Confirmacion){
			$textError = "Los correos no coinciden.";
			$typeError = "error";
			return;
		}

		/// get new usuer id

		$stmtusuario = $db->prepare("select id from usuario where corporacion = ? and id = ? and clave = ?;");
		$stmtusuario->bind_param('iis', $USER_CORPORATION, $Usuario, md5($Clave));
		$stmtusuario->execute();
		$result = $stmtusuario->get_result();
		$rowCount = mysqli_num_rows($result);

		if ($rowCount == 0){
			$textError = "La clave del usuario es incorrecta. ";
			$typeError = "error";
		}else{

			$stmt = $db->prepare("select ifnull(max(id),0)+1 as id from medico where corporacion = ?;");
			$stmt->bind_param('i', $USER_CORPORATION);
			$stmt->execute();

			$result = $stmt->get_result();
			$rowArray = mysqli_fetch_array($result);
				
			$Id = $rowArray["id"];

			$qry = "";
			if (isset($_FILES['image']) && $_FILES['image']['size'] > 0) {
				$tmpName = $_FILES['image']['tmp_name'];
				$fp = fopen($tmpName, 'r');
				$data = fread($fp, filesize($tmpName));
				$data = addslashes($data);
				fclose($fp);

				$qry = "insert into medico (corporacion, id, nombre, direccion, pais, depto, nacionalidad, fecharegistro, fechanacimiento, genero, estado_civil, estatus, correo, telefono, usuario, imagen) values (?, ?, ?, ?, ?, ?, ?, curdate(), ?, ?, ?, ?, ?, ?, ?, '$data')";
			}else{
				$qry = "insert into medico (corporacion, id, nombre, direccion, pais, depto, nacionalidad, fecharegistro, fechanacimiento, genero, estado_civil, estatus, correo, telefono, usuario) values (?, ?, ?, ?, ?, ?, ?, curdate(), ?, ?, ?, ?, ?, ?, ?)";
			}
			
			$stmtinsert = $db->prepare($qry);
			$stmtinsert->bind_param('iissiissiisssi', $USER_CORPORATION, $Id, $Nombre, $Direccion, $Pais, $Departamento, $Nacionalidad, $FechaNacimiento, $Genero, $Estado_Civil, $Estatus, $Correo, $Telefono, $Usuario);
			$stmtinsert->execute();

			$result = $stmtinsert->get_result();

			if (!$result){
				header("Location: index.php");
			}else{
				$textError = "Ha ocurrido un Error, No se pudo guardar el Usuario. " . mysqli_stmt_error($stmtinsert) . "asdf";
				$typeError = "error";
			}
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
							<form enctype="multipart/form-data" action="" method="post" class="nice custom" style="">
								<div class="formRow">
									<label for="nice_text">Nombre</label>
									<input type="text" required id="Nombre" name="Nombre" class="input-text" value="<?php echo $Nombre; ?>">
								</div>
								<div class="formRow">
									<label for="nice_text_medium">Dirección</label>
									<textarea name="Direccion" id="Direccion" cols="1" rows="1" class="large"><?php echo $Direccion; ?></textarea>
								</div>
								<div class="formRow" style="">
									<label for="nice_select">Pais</label>
									<select id="Pais" name="Pais" class="custom dropdown medium" >
										<?php newSelector("pais", "id", "descripcion", " where estatus = 'A'", $Pais); ?>
									</select>
								</div>
								<div class="formRow">
									<label for="nice_text_oversized">Departamento</label>
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
											$("#Departamento").val('<?php $Departamento; ?>');
										});
									</script>
								</div>
								<div class="formRow" style="">
									<label for="nice_select">Nacionalidad</label>
									<select id="Nacionalidad" name="Nacionalidad" class="custom dropdown medium" >
										<?php newSelector("pais", "id", "descripcion", " where estatus = 'A'", $Nacionalidad); ?>
									</select>
								</div>
								<div class="formRow">
									<label for="nice_text_oversized">Fecha de Nacimiento</label>
									<input type="date" required id="FechaNacimiento" name="FechaNacimiento" class="input-text medium"  value="<?php echo $FechaNacimiento; ?>">
								</div>
								<div class="formRow" style="">
									<label for="nice_select">Genero</label>
									<select id="Genero" name="Genero" class="custom dropdown medium" >
										<?php newSelector("genero", "id", "descripcion", " where estatus = 'A' and corporacion = $USER_CORPORATION", $Genero); ?>
									</select>
								</div>
								<div class="formRow" style="">
									<label for="nice_select">Estado Civil</label>
									<select id="Estado_Civil" name="Estado_Civil" class="custom dropdown medium" >
										<?php newSelector("estado_civil", "id", "descripcion", " where estatus = 'A' and corporacion = $USER_CORPORATION", $Estado_Civil); ?>
									</select>
								</div>
								<div class="formRow">
									<label for="nice_text_oversized">Correo Electronico</label>
									<input type="email" required id="Correo" name="Correo" class="input-text large" value="<?php echo $Correo; ?>">
								</div>
								<div class="formRow">
									<label for="nice_text_oversized">Confirmaci&oacute;n de Correo Electronico</label>
									<input type="email" required id="Correo_Confirmacion" name="Correo_Confirmacion" class="input-text large">
								</div>
								<div class="formRow">
									<label for="nice_text_small">Telefono</label>
									<input type="text" id="Telefono" name="Telefono" class="input-text large" value="<?php echo $Telefono; ?>">
								</div>
								<div class="formRow" style="">
									<label for="nice_select">Usuario en Uso</label>
									<select id="Usuario" name="Usuario" class="custom dropdown medium" >
										<?php newSelector("usuario", "id", "nombre", " where estatus = 'A' and corporacion = $USER_CORPORATION", $Usuario); ?>
									</select>
								</div>
								<div class="formRow">
									<label for="nice_text_small">Clave del Usuario para la Asignaci&oacute;n</label>
									<input type="password" id="Clave" name="Clave" class="input-text large">
									<label for="Clave" generated="true" class="error">Debe introducir la Clave Actual del Usuario</label>
								</div>
								
								<input name="MAX_FILE_SIZE" value="102400" type="hidden">
								<div class="formRow">
									<label for="nice_text_oversized">Imagen</label>
									<input type="file" required id="image" name="image" accept="image/jpeg" class="input-text large" >
								</div>
								
								<div class="formRow">
                                    <button type="submit" name="boton" class="button small nice blue radius">Guardar</button>
									<a href="index.php" class="clear_form">Cancelar</a>
									
									<script>
										$("form").on("submit", function(){
											var correo = $("#Correo");
											var correo_confirmacion = $("#Correo_Confirmacion");
											var clave = $("#Clave");

											if (correo.val() == ""){
												alert("Debe Ingresar un Correo Electronico");
												return false;
											}

											if (correo.val() != correo_confirmacion.val()){
												alert("Los Correo deben ser identicos");
												return false;
											}

											if (clave.val() == ""){
												alert("Debe Introducir la Clave del Usuario para poder asignarlo.");
												return false;
											}
											
											return true;
										});
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
	include("../includes/footer.php");
?>