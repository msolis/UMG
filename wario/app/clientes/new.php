<?php
	include("../includes/head.php");
	include("../includes/menu.php");
?>

<?php 

	$error = "";
	$success = "";
	if (isset($_POST["boton"])){
		$Nombre = $_POST["NombreComercial"];
		$Nit = $_POST["Nit"];
		$Estatus = $_POST["Estatus"];
		$Telefono = $_POST["Telefono"];
		$Direccion = $_POST["Direccion"];
		$error = "";
		
		$stmt = $db->prepare("select corporacion, id from cliente where corporacion = ? and nit = ?;");
		$stmt->bind_param('is', $USER_CORPORATION, $Nit);
		
		$stmt->execute();
		$result = $stmt->get_result();
		$rowCount = mysqli_num_rows($result);
		$rowArray = mysqli_fetch_array($result);
		$Id = $rowArray["id"];
		
		if ($rowCount == 0){
			
			/// get new usuer id
			$stmt = $db->prepare("SELECT ifnull(max(id),0)+1 as id from cliente where corporacion = ?;");
			$stmt->bind_param('i', $USER_CORPORATION);
			$stmt->execute();
			$result = $stmt->get_result();
			$rowArray = mysqli_fetch_array($result);
			
			$Id = $rowArray["id"];
			
			$stmt = $db->prepare("insert into cliente (corporacion, id, nombrecomercial, nit, direccion, fechacreacion, telefono, estatus) values (?, ?, ?, ?, ?, curdate(), ?, ?);");
			$stmt->bind_param('iisssss', $USER_CORPORATION, $Id, $Nombre, $Nit, $Direccion, $Telefono, $Estatus);
			$rc = $stmt->execute();
			if (!$rc) {
				$typeError = "error";
				$textError = "NO se pudo guardar el registro. Error: " . $stmt->error;
			}else{
				$typeError = "success";
				$textError = "Información ha sido guardada exitosamente.";
			}
			
		}else{
			$typeError = "error";
			$textError = 'El Nit ya existe. &nbsp;&nbsp;&nbsp;<a href="edit.php?id=' . $Id. '" style="color:yellow; text-decoration:underline;">Click Aqui para ver el Cliente</a>';	
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
						<p>Nuevo Cliente</p>
					</div>
					<div class="box_c_content form_a">
						<div class="tab_pane" style="">
							<form action="" method="post" class="nice custom" style="">
								<div class="formRow">
									<label for="nice_text_oversized">Nit</label>
									<input type="text" required id="Nit" name="Nit" required class="input-text large">
								</div>
								<div class="formRow">
									<label for="nice_text">Nombre Comercial</label>
									<input type="text" required id="NombreComercial" required name="NombreComercial" class="input-text">
								</div>
								<div class="formRow">
									<label for="nice_text_small">Telefono</label>
									<input type="text" id="Telefono" name="Telefono" class="input-text large">
								</div>
								<div class="formRow">
									<label for="nice_text_medium">Dirección</label>
									<textarea name="Direccion" id="Direccion" required cols="1" rows="1" class="large"></textarea>
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