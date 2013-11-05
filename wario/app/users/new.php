<?php
	include("../includes/head.php");
	include("../includes/menu.php");
?>

<?php 

	$error = "";
	$success = "";
	if (isset($_POST["boton"])){
		$Nombre = $_POST["Nombre"];
		$Correo = $_POST["Correo"];
		$Estatus = $_POST["Estatus"];
		$Telefono = $_POST["Telefono"];
		$Direccion = $_POST["Direccion"];
		$Clave = "12345";
		$error = "";
		
		$stmt = $db->prepare("SELECT Corporacion, Id from USUARIO where Corporacion = ? and Correo = ?;");
		$stmt->bind_param('is', $USER_CORPORATION, $Correo);
		
		$stmt->execute();
		$result = $stmt->get_result();
		$rowCount = mysqli_num_rows($result);
		
		
		if ($rowCount == 0){
			
			/// get new usuer id
			$stmt = $db->prepare("SELECT ifnull(max(Id),0)+1 as Id from USUARIO where Corporacion = ?;");
			$stmt->bind_param('i', $USER_CORPORATION);
			$stmt->execute();
			$result = $stmt->get_result();
			$rowArray = mysqli_fetch_array($result);
			
			$Id = $rowArray["Id"];
			
			$stmt = $db->prepare("INSERT INTO Usuario (Corporacion, Id, Correo, Clave, Estatus, Nombre, Imagen, Telefono, Direccion) values (?, ?, ?, ?, ?, ?, ?, ?, ?);");
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
						<p>Nuevo Usuario</p>
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