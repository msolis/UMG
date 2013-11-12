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
		$RazonSocial = $_POST["RazonSocial"];
		$Pais = $_POST["Pais"];
		$Departamento = $_POST["Departamento"];
		/*$Sendmail = $_POST["Sendmail"];
		$Smtp = $_POST["Smtp"];
		$Sendmail_password = $_POST["Sendmail_password"];
		$Smtp_port = $_POST["Smtp_port"];*/
		$Estatus = $_POST["Estatus"];
		$Venta_Correlativo = $_POST["Venta_Correlativo"];
		$Venta_Correlativo_Autonumerico = $_POST["Venta_Correlativo_Autonumerico"];
		$Venta_Serie = $_POST["Venta_Serie"];
		
		$stmt = $db->prepare("SELECT ifnull(max(id),0)+1 as id from hospital where corporacion = ?;");
		$stmt->bind_param('i', $USER_CORPORATION);
		$stmt->execute();
		$result = $stmt->get_result();
		$rowArray = mysqli_fetch_array($result);
		
		$Id = $rowArray["id"];
		
		$stmt = $db->prepare("insert into hospital (corporacion, id, nombre, direccion, nit, razonsocial, pais, departamento, estatus, venta_correlativo, venta_correlativo_autonumerico, venta_serie) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);");
		$stmt->bind_param('iissssiisiss', $USER_CORPORATION, $Id, $Nombre, $Direccion, $Nit, $RazonSocial, $Pais, $Departamento, $Estatus, $Venta_Correlativo, $Venta_Correlativo_Autonumerico, $Venta_Serie);

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
									<input type="text" id="RazonSocial" name="RazonSocial" required class="input-text large">
								</div>
								<div class="formRow">
									<label for="nice_text_small">Pais</label>
									<select id="Pais" name="Pais" class="custom dropdown medium" >
										<?php newSelector("pais", "id", "descripcion", " where estatus = 'A'", ""); ?>
									</select>
								</div>
								<div class="formRow">
									<label for="nice_text_small">Departamento</label>
									<select id="Departamento" name="Departamento" class="custom dropdown medium" >
									</select>
								</div>
								<!--div class="formRow">
									<label for="nice_text">Correo Electronico</label>
									<input type="text" id="Sendmail" name="Sendmail" class="input-text">
								</div>
								<div class="formRow">
									<label for="nice_text">SMTP</label>
									<input type="text" id="smtp" name="smtp" class="input-text">
								</div>
								<div class="formRow">
									<label for="nice_text">Contraseña</label>
									<input type="text" id="passmail" name="passmail" class="input-text">
								</div>
								<div class="formRow">
									<label for="nice_text">Puerto SMTP</label>
									<input type="text" id="Smtpport" name="Smtpport" class="input-text">
								</div-->
								<div class="formRow" style="">
									<label for="nice_select">Estatus</label>
									<select id="Estatus" name="Estatus" class="custom dropdown medium" >
										<option value="A">Alta</option>
										<option value="B">Baja</option>
									</select>
								</div>
								<div class="formRow">
									<label for="nice_text"># Correlativo De Venta Impreso</label>
									<input type="text" required id="Venta_Correlativo" name="Venta_Correlativo" class="input-text">
								</div>
								<div class="formRow">
									<label for="nice_text">Tipo de Correlativo de Facturación</label>
									<select id="Venta_Correlativo_Autonumerico" name="Venta_Correlativo_Autonumerico" class="custom dropdown medium" >
										<option value="S">Numero de Factura Autonumerico</option>
										<option value="N">Numero de Factura Manual</option>
									</select>
								</div>
								<div class="formRow">
									<label for="nice_text">Serie Para Facturación</label>
									<input type="text" required id="Venta_Serie" name="Venta_Serie" class="input-text">
								</div>
								<div class="formRow">
                                    <button type="submit" name="boton" class="button small nice blue radius">Guardar</button>
									<a href="index.php" class="clear_form">Cancelar</a>
								</div>
							</form>
							<script>
								$(document).on("ready", function(){
									$("#Pais").on("change", function(){
										change_pais();
									});

									function change_pais(){
										$.post("../ws/departamentos.php", { pais: $("#Pais").val() }, function(data){
											$("#Departamento").empty();
											$( data ).each(function(index, item) {
												$("#Departamento").append($("<option></option>")
														         .attr("value",item.id)
														         .text(item.descripcion));
											});
										}, "json");
									}

									change_pais();

									$("form").on("submit", function(){
										
										if (($("#Departamento").val() == "") || ($("#Departamento").val() == null)){
											alert("Departamento no Valido");
											return false;
										}
										
									});
								});
							</script>
						</div>
										
					</div>
				</div>
			</div>
		</div>
</div>


<?php
	include("../includes/footer.php");
?>