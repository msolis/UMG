<?php
	include("../includes/head.php");
	include("../includes/menu.php");
	include("../includes/conexion.php");
	
	
	
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
		$Ventacorrelativo = $_POST["Ventacorrelativo "];
		$Ventacorrelativoauto = $_POST["Ventacorrelativoauto"];
		$Ventaserie = $_POST["Ventaserie"];
		$Id= $_POST["Id"];
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
			
			$stmt = $db->prepare("INSERT INTO hospital (corporacion, id, nombre, direccion, nit, razonsocial, pais, departamento, sendmail_from, smtp, sendmail_passwprd, smtp_port, estatus, venta_correlativo, venta_correlativo_autonumerico, ventaserie) values (?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?,?,?,?,?);");
			$stmt->bind_param('iissssiisssisiss', $USER_CORPORATION, $Id, $Nombre, $Direccio, $Nit, $Razon, $Pais, $Departamento, $Sendmail,$Smtp,$passmail,$smtpport,$Estatus,$Estatus,Ventacorrelativo,$Ventacorrelativoauto,$Ventaserie);
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
									<label for="nice_text_medium">Dirección</label>
									<textarea name="Direccion" id="Direccion" cols="1" rows="1" class="large"></textarea>
								</div>
								<div class="formRow">
									<label for="nice_text_oversized">Nit</label>
									<input type="text" required id="Nit" name="Nit" class="input-text large">
								</div>
								<div class="formRow">
									<label for="nice_text_small">Razon Social</label>
									<input type="text" id="Razon" name="Razon" class="input-text large">
								</div>
								<select id="pais" name="pais" class="custom dropdown medium" >
									<?php newSelector("pais", "id", "descripcion", " where estatus = 'A'", ""); ?>
								</select>
								<select id="Departamento" name="Departamento" class="custom dropdown medium" >
									<?php newSelector("departamento", "id", "descripcion", "where estatus = 'A'" ,""); ?>
								</select>
								<div class="formRow">
									<label for="nice_text">Correo Electronico</label>
									<input type="text" required id="Sendmail" name="Sendmail" class="input-text">
								</div>
								<div class="formRow">
									<label for="nice_text">SMTP</label>
									<input type="text" required id="smtp" name="smtp" class="input-text">
								</div>
								<div class="formRow">
									<label for="nice_text">Contraseña</label>
									<input type="text" required id="passmail" name="passmail" class="input-text">
								</div>
								<div class="formRow">
									<label for="nice_text">Puerto SMTP</label>
									<input type="text" required id="Smtpport" name="Smtpport" class="input-text">
								</div>
								<div class="formRow" style="">
									<label for="nice_select">Estatus</label>
									<select id="Estatus" name="Estatus" class="custom dropdown medium" >
										<option value="A">Alta</option>
										<option value="B">Baja</option>
									</select>
								</div>
								<div class="formRow">
									<label for="nice_text">Correlativo De Venta</label>
									<input type="text" required id="Ventacorrelativo" name="Ventacorrelativo" class="input-text">
								</div>
								<div class="formRow">
									<label for="nice_text">Auto Numerico</label>
									<input type="text" required id="Nombre" name="Nombre" class="input-text">
								</div>
								<div class="formRow">
									<label for="nice_text">No de Serie</label>
									<input type="text" required id="Ventaserie" name="Ventaserie" class="input-text">
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