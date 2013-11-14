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
		$Telefono = $_POST["Telefono"];
		$Celular = $_POST["Celular"];
		$Direccion = $_POST["Direccion"];
		$Nit = $_POST["Nit"];
		$error = "";
		
		$stmt = $db->prepare("select corporacion, id from proveedor where corporacion = ? and id = ?;");
		$stmt->bind_param('ii', $USER_CORPORATION, $id);
		
		$stmt->execute();
		$result = $stmt->get_result();
		$rowCount = mysqli_num_rows($result);
		
		
		if ($rowCount == 0){
			
	
			$stmt = $db->prepare("select ifnull(max(id),0)+1 as id from proveedor where corporacion = ? ;");
			$stmt->bind_param('i', $USER_CORPORATION);
			$stmt->execute();
			$result = $stmt->get_result();
			$rowArray = mysqli_fetch_array($result);
			
			$Id = $rowArray["id"];
			
			$stmt = $db->prepare("insert into proveedor (corporacion, id, nombre, direccion, nit,correo,telefono,celucar) values (?,?, ?, ?, ?, ?, ?, ?);");
			$stmt->bind_param('iissssss' , $USER_CORPORATION, $Id, $Nombre, $Direccion, $Nit, $Correo,$Telefono,$Celular);
			$rc = $stmt->execute();
			
		if (!$rc) {
				$typeError = "error";
				$textError = "NO se pudo guardar el registro. Error: " . $stmt->error;
			}else{
				$typeError = "success";
				$textError = "Información ha sido guardada exitosamente.";
			}
		}
	}
?>

<div class="container" style="padding-bottom: 30px;">

		<div class="row">
			<div class="twelve columns">
				<div class="box_c">
					<div class="box_c_heading cf">
						<p>Nuevo Proveedor</p>
					</div>
					<div class="box_c_content form_a">
						<div class="tab_pane" style="">
							<form action="" method="post" class="nice custom" style="">
								<div class="formRow">
									<label for="nice_text">Nombre</label>
									<input type="text" required id="Nombre" name="Nombre" class="input-text">
								</div>
								<div class="formRow">
									<label for="nice_text_oversized">Direccion</label>
									<input type="text" required id="Direccion" name="Direccion" class="input-text large">
								</div>
								<div class="formRow">
									<label for="nice_text_oversized">Nit</label>
									<input type="text" required id="Nit" name="Nit" class="input-text large">
								</div>
								<div class="formRow">
									<label for="nice_text_small">Correo</label>
									<input type="email" required id="Correo" name="Correo" class="input-text large">
								</div>
								<div class="formRow">
									<label for="nice_text_medium">Telefono</label>
									<input type="text"  id="Telefono" name="Telefono" class="input-text">
								</div>
								<div class="formRow">
									<label for="nice_text_medium">Celular</label>
									<input type="text"  id="Celular" name="Celular" class="input-text">
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