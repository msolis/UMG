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
		$Nit = $_POST["Nit"];
		$Razon = $_POST["Razon"];
		$Pais = $_POST["Pais"];
		$Departamento = $_POST["Departamento"];
		$Sendmail = $_POST["Sendmail"];
		$Smtp = $_POST["Smtp"];
		$passmail = $_POST["passmail"];
		$Smtpport = $_POST["Smtpport"];
		$Estatus = $_POST["Estatus"];
		$Telefono = $_POST["Telefono"];
		$Ventacorrelativo = $_POST["Ventacorrelativo "];
		$Ventacorrelativoauto = $_POST["Ventacorrelativoauto"];
		$Ventaserie = $_POST["Ventaserie"];
		
		
		$Clave = "12345";
		$error = "";
		
		$stmt = $db->prepare("SELECT corporacion, id from hospital where corporacion = ? and id = ?;");
		$stmt->bind_param('is', $USER_CORPORATION, $Id);
		
		$stmt->execute();
		$result = $stmt->get_result();
		$rowCount = mysqli_num_rows($result);
		
		
		if ($rowCount == 0){
			
			/// get new usuer id
			$stmt = $db->prepare("SELECT ifnull(max(id),0)+1 as id from hospital where corporacion = ?;");
			$stmt->bind_param('i', $USER_CORPORATION);
			$stmt->execute();
			$result = $stmt->get_result();
			$rowArray = mysqli_fetch_array($result);
			
			$Id = $rowArray["Id"];
			
			$stmt = $db->prepare("INSERT INTO hospital (corporacion, id, correo, clave, estatus, nombre, imagen, telefono, direccion) values (?, ?, ?, ?, ?, ?, ?, ?, ?);");
			$stmt->bind_param('iisssssss', $USER_CORPORATION, $Id, $Correo, $Clave, $Estatus, $Nombre, $Imagen, $Telefono, $Direccion);
			$rc = $stmt->execute();
			if (!$rc) {
				$typeError = "error";
				$textError = "NO se pudo guardar el registro. Error: " . $stmt->error;
			}else{
				$typeError = "success";
				$textError = "Información ha sido guardada exitosamente.";
			}
			
		}else{
			$error = "El Correo electronico ya existe";	
		}
		echo $error;
		
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
						<p>Nuevo Hospital</p>
					</div>
					<div class="box_c_content form_a">
						<div class="tab_pane" style="">
							<form action="" method="post" class="nice custom" style="">
								<div class="formRow">
									<label for="nice_text">Nombre</label>
									<input type="text" required id="Nombre" name="Nombre" class="input-text">
								</div>
								<div class="formRow">
									<label for="nice_text_oversized">Correo Electrónico</label>
									<input type="email" required id="Correo" name="Correo" class="input-text large">
								</div>
								<div class="formRow">
									<label for="nice_text_oversized">Confirmación de Correo Electrónico</label>
									<input type="email" required id="Correo_Confirmacion" name="Correo_Confirmacion" class="input-text large">
								</div>
								<div class="formRow">
									<label for="nice_text_small">Telefono</label>
									<input type="text" id="Telefono" name="Telefono" class="input-text large">
								</div>
								<div class="formRow">
									<label for="nice_text_medium">Dirección</label>
									<textarea name="Direccion" id="Direccion" cols="1" rows="1" class="large"></textarea>
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
									
									<script>
										$("form").on("submit", function(){
											var correo = $("#Correo");
											var correo_confirmacion = $("#Correo_Confirmacion");
											var nombre = $("#Nombre");

											if (nombre.val() == ""){
												alert("Debe Introducir el Nombre del Usuario");
												return false;
											}

											if (correo.val() == ""){
												alert("Debe Ingresar un Correo Electrónico");
												return false;
											}

											if (correo.val() != correo_confirmacion.val(){
												alert("Los Correo deben ser identicos");
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