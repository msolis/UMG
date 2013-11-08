<?php
	include("../includes/head.php");
	include("../includes/menu.php");
	include("../includes/conexion.php");
?>

<?php 

	$error = "";
	$success = "";

	$id  = $_GET["Id"];
	
	if (isset($_POST["boton"])){
		$id  = $_POST["Id"];
		$nombre = $_POST["Nombre"];
		$direccion = $_POST["Direccion"];
		$nit = $_POST["Nit"];
		$razonsocial = $_POST["RazonSocial"];
		$pais = $_POST["Pais"];
		$departamento = $_POST["Departamento"];
		$estatus = $_POST["Estatus"];
		$venta_correlativo = $_POST["Venta_Correlativo"];
		$venta_correlativo_autonumerico = $_POST["Venta_Correlativo_Autonumerico"];
		$venta_serie = $_POST["Venta_Serie"];
		
		$stmt = $db->prepare("update hospital set nombre = ?, direccion = ?, nit = ?, razonsocial = ?, pais = ?, departamento = ?, estatus = ?, venta_correlativo = ?, venta_correlativo_autonumerico = ?, venta_serie = ? where corporacion = ? and id = ? ;");
		$stmt->bind_param('ssssiisissii', $nombre, $direccion, $nit, $razonsocial, $pais, $departamento, $estatus, $venta_correlativo, $venta_correlativo_autonumerico, $venta_serie, $USER_CORPORATION, $id);

		$rc = $stmt->execute();
		if (!$rc) {
			$typeError = "error";
			$textError = "NO se pudo guardar el registro. Error: " . $stmt->error;
		}else{
			$typeError = "success";
			$textError = "Información ha sido guardada exitosamente.";
		}
	}

	$stmt = $db->prepare("select corporacion, id, nombre, direccion, nit, razonsocial, pais, departamento, estatus, venta_correlativo, venta_correlativo_autonumerico, venta_serie from hospital where corporacion = ? and id = ?;");
	$stmt->bind_param('ii', $USER_CORPORATION, $id);
	
	$stmt->execute();
	$result = $stmt->get_result();
	$rowCount = mysqli_num_rows($result);
	$rowArray = mysqli_fetch_array($result);

	
	$direccion = $rowArray["direccion"];
	$nit = $rowArray["nit"];
	$razonsocial = $rowArray["razonsocial"];
	$nombre = $rowArray["nombre"];
	$pais = $rowArray["pais"];

	$departamento = $rowArray["departamento"];
	$estatus = $rowArray["estatus"];
	$venta_correlativo = $rowArray["venta_correlativo"];
	$venta_correlativo_autonumerico = $rowArray["venta_correlativo_autonumerico"];
	$venta_serie = $rowArray["venta_serie"];
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

								<input id="Id" name="Id" type="hidden" value="<?php echo $id ?>">

								<div class="formRow">
									<label for="nice_text">Nombre</label>
									<input type="text" required id="Nombre" name="Nombre" class="input-text" value="<?php echo $nombre; ?>">
								</div>
								<div class="formRow">
									<label for="nice_text_medium">Dirección</label>
									<textarea name="Direccion" id="Direccion" cols="1" rows="1" class="large"><?php echo $direccion; ?></textarea>
								</div>
								<div class="formRow">
									<label for="nice_text_oversized">Nit</label>
									<input type="text" required id="Nit" name="Nit" class="input-text large" value="<?php echo $nit; ?>">
								</div>
								<div class="formRow">
									<label for="nice_text_small">Razon Social</label>
									<input type="text" id="RazonSocial" name="RazonSocial" required class="input-text large" value="<?php echo $razonsocial; ?>">
								</div>
								<div class="formRow">
									<label for="nice_text_small">Pais</label>
									<select id="Pais" name="Pais" class="custom dropdown medium" >
										<?php newSelector("pais", "id", "descripcion", " where estatus = 'A'", $pais); ?>
									</select>
								</div>
								<div class="formRow">
									<label for="nice_text_small">Departamento</label>
									<select id="Departamento" name="Departamento" class="custom dropdown medium" >
										<?php newSelector("departamento", "id", "descripcion", " where estatus = 'A' and pais = " . $pais, $departamento); ?>
									</select>
								</div>
								<div class="formRow" style="">
									<label for="nice_select">Estatus</label>
									<select id="Estatus" name="Estatus" class="custom dropdown medium" >
										<option value="A" <?php if ($estatus == "A") echo "selected"; ?>>Alta</option>
										<option value="B" <?php if ($estatus == "B") echo "selected"; ?>>Baja</option>
									</select>
								</div>
								<div class="formRow">
									<label for="nice_text"># Correlativo De Venta Impreso</label>
									<input type="text" required id="Venta_Correlativo" name="Venta_Correlativo" class="input-text" value="<?php echo $venta_correlativo ?>">
								</div>
								<div class="formRow">
									<label for="nice_text">Tipo de Correlativo de Facturación</label>
									<select id="Venta_Correlativo_Autonumerico" name="Venta_Correlativo_Autonumerico" class="custom dropdown medium" >
										<option <?php if ($venta_correlativo_autonumerico == "S") echo "selected"; ?> value="S">Numero de Factura Autonumerico</option>
										<option <?php if ($venta_correlativo_autonumerico == "N") echo "selected"; ?> value="N">Numero de Factura Manual</option>
									</select>
								</div>
								<div class="formRow">
									<label for="nice_text">Serie Para Facturación</label>
									<input type="text" required id="Venta_Serie" name="Venta_Serie" class="input-text" value="<?php echo $venta_serie ?>">
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

									//change_pais();

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