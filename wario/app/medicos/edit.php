<?php
	include("../includes/head.php");
	include("../includes/menu.php");
?>

<?php 

	$error = "";
	$success = "";
	$typeError = "";
	
	$Nombre = "";
	$Direccion = "";
	$Pais = "";
	$Departamento = "";
	$Nacionalidad = "";
	$FechaNacimiento = "";
	$Genero = "";
	$Estado_Civil = "";
	$Correo = "";
	$Telefono = "";
	$Estatus = "";
	$Usuario = "";
	
	if(!isset($_GET["id"])){
		header("Location: index.php?error=Especialidad de Medico no valido.");
	}

	$Id = $_GET["id"];
	
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
		$Estatus = $_POST["Estatus"];
		
		if ($Correo != $Correo_Confirmacion){
			$textError = "Los correos no coinciden.";
			$typeError = "error";
			return;
		}

		$qry = "";
		
		if (isset($_FILES['image']) && $_FILES['image']['size'] > 0) {
			$tmpName = $_FILES['image']['tmp_name'];
			$fp = fopen($tmpName, 'r');
			$data = fread($fp, filesize($tmpName));
			$data = addslashes($data);
			fclose($fp);

			$qry = "update medico set nombre = ?, direccion = ?, pais = ?, depto = ?, nacionalidad = ?, fechanacimiento = ?, genero = ?, estado_civil = ?, estatus = ?, correo = ?, telefono = ?, imagen = '$data' where corporacion = ? and id = ?;";
		}else{
			$qry = "update medico set nombre = ?, direccion = ?, pais = ?, depto = ?, nacionalidad = ?, fechanacimiento = ?, genero = ?, estado_civil = ?, estatus = ?, correo = ?, telefono = ? where corporacion = ? and id = ?;";
		}
		
		$stmtinsert = $db->prepare($qry);
		$stmtinsert->bind_param('ssiiisiisssii', $Nombre, $Direccion, $Pais, $Departamento, $Nacionalidad, $FechaNacimiento, $Genero, $Estado_Civil, $Estatus, $Correo, $Telefono, $USER_CORPORATION, $Id);
		$stmtinsert->execute();

		$result = $stmtinsert->get_result();

		if (!$result){
			//header("Location: index.php");
		}else{
			$textError = "Ha ocurrido un Error, No se pudo guardar el Usuario. ";
			$typeError = "error";
		}		
	}

	$qry = "select corporacion, id, nombre, direccion, pais, depto, nacionalidad, fechanacimiento, genero, estado_civil, estatus, correo, telefono, usuario from medico where corporacion = ? and id = ?;";
	$stmt = $db->prepare($qry);
	$stmt->bind_param('ii', $USER_CORPORATION, $Id);
	
	$stmt->execute();
	$result = $stmt->get_result();
	$rowCount = mysqli_num_rows($result);
	$rowArray = mysqli_fetch_array($result);

	$Nombre = $rowArray["nombre"];
	$Direccion = $rowArray["direccion"];
	$Pais = $rowArray["pais"];
	$Departamento = $rowArray["depto"];
	$Nacionalidad = $rowArray["nacionalidad"];
	$FechaNacimiento = $rowArray["fechanacimiento"];
	$Genero = $rowArray["genero"];
	$Estado_Civil = $rowArray["estado_civil"];
	$Correo = $rowArray["correo"];
	$Telefono = $rowArray["telefono"];
	$Estatus = $rowArray["estatus"];
	$Usuario = $rowArray["usuario"];

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
									<label for="nice_text_medium">Direcci&oacute;n</label>
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
									<input type="date" required id="FechaNacimiento" name="FechaNacimiento" class="input-text medium"   value="<?php echo $FechaNacimiento; ?>">
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
									<label for="nice_select">Estatus</label>
									<select id="Estatus" name="Estatus" class="custom dropdown medium" >
										<option value="A" <?php if($Estatus == "A") echo " selected " ?>>Alta</option>
										<option value="B" <?php if($Estatus == "B") echo " selected " ?>>Baja</option>
									</select>
								</div>

								<div class="formRow" style="">
									<label for="nice_select">Usuario en Uso</label>
									<select id="Usuario" name="Usuario" class="custom dropdown medium" disabled >
										<?php newSelector("usuario", "id", "nombre", " where estatus = 'A' and corporacion = $USER_CORPORATION", $Usuario); ?>
									</select>
								</div>
								
								<input name="MAX_FILE_SIZE" value="102400" type="hidden">

								<div class="formRow">
									<label for="nice_text_oversized">Imagen</label>
									<br>
									<img src="../includes/showimage.php?table=2&id=<?php echo $Id; ?>" style="height:250px;" />
									<input type="file" id="image" name="image" accept="image/jpeg" class="input-text large">
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

		<div class="row">
	    <div class="twelve columns">
	        <div class="box_c">
	            <div class="box_c_heading cf">
	                <p>Especialidades del M&eacute;dico</p>
	               
	            </div>
	            <div class="box_c_content form_a">
						<div class="tab_pane" style="">
							<form enctype="multipart/form-data" action="especialidad.php" method="post" class="nice custom" style="">
								<?php

								$Especialidad = "";
								$Medico = $Id;
								$Fecha = "";
								$Observacion = "";
								$Pais = "";
								$Lugar = "";

								if ( isset($_GET["Especialidad"]) ){

									
									$Especialidad = $_GET["Especialidad"];

									$stmt = $db->prepare("select corporacion, medico, especialidad, fecha, observacion, pais, lugar from medico_especialidad where corporacion = ? and medico = ? and especialidad = ?;");
									$stmt->bind_param('iii', $USER_CORPORATION, $Id, $Especialidad);
									
									$stmt->execute();
									$result = $stmt->get_result();
									$rowCount = mysqli_num_rows($result);
									$rowArray = mysqli_fetch_array($result);

									$Fecha = $rowArray["fecha"];
									$Observacion = $rowArray["observacion"];
									$Lugar = $rowArray["lugar"];

								}

								?>
								<input name="Medico" type="hidden" value="<?php echo $Medico; ?>">
								<input name="Especialidad" id="Especialidad" type="hidden" value="<?php echo $Especialidad; ?>">
								<div class="formRow" style="">
									<label for="nice_select">Especialidad</label>
									<select id="Especialidadn" name="Especialidadn" class="custom dropdown medium" >
										<?php newSelector("especialidad", "id", "nombre", " where estatus = 'A' and corporacion = $USER_CORPORATION", $Especialidad); ?>
									</select>
								</div>

								<div class="formRow">
									<label for="nice_text_oversized">Fecha de obtenci&oacute;n</label>
									<input type="date" required id="Fecha" name="Fecha" class="input-text medium" value="<?php echo $Fecha; ?>">
								</div>

								<div class="formRow">
									<label for="nice_text_medium">Observaci&oacute;n</label>
									<textarea name="Observacion" id="Observacion" cols="1" rows="1" class="expand"><?php echo $Observacion; ?></textarea>
								</div>

								<div class="formRow" style="">
									<label for="nice_select">Pais</label>
									<select id="Pais" name="Pais" class="custom dropdown medium" >
										<?php newSelector("pais", "id", "descripcion", " where estatus = 'A'", $Pais); ?>
									</select>
								</div>

								<div class="formRow">
									<label for="nice_text">Lugar</label>
									<input type="text" required id="Lugar" name="Lugar" class="input-text expand" value="<?php echo $Lugar; ?>">
								</div>

								<div class="formRow">
                                    <button type="submit" name="boton" class="button small nice blue radius">Guardar</button>
									<a href="index.php" class="clear_form">Cancelar</a>
                                </div>
							</form>
						</div>
										
					</div>
	            <div class="box_c_content">

	                <div id="dt1_wrapper" class="dataTables_wrapper" role="grid">
	                <div id="dt1_length" class="dataTables_length">
	                </div>
	                <div class="dataTables_filter" id="dt1_filter">
	                	<button type="button" id="nuevo" class="button small nice blue radius">Nuevo</button>
	                	<script type="text/javascript">
	                		$(document).on("ready", function(){
		                		$("#nuevo").on("click", function(){
		                			window.location.href = "edit.php?id=<?php echo $Id ?>&option=especialidad";
		                		});
		                		<?php 
		                			if (isset($_GET["option"])){
		                			?>
		                				//window.location.href = "edit.php?id=<?php echo $Id ?>#Especialidad";
		                				//$("#Especialidad").focus();
		                				$(document).delay(1000, function(){

		                				$("#Especialidadn").focus();
		                			});
		                			<?php
		                			}
		                		?>
		                	});
	                	</script>
	                	<label>Buscar: <input type="text" aria-controls="dt1"></label>
	               	</div>
	                <table cellpadding="0" cellspacing="0" border="0" class="display mobile_dt1 dt_act dataTable" id="dt1" aria-describedby="dt1_info">
                        <thead>
                            <tr role="row">
                            	<th class="essential sorting_asc" role="columnheader">Fecha</th>
                            	<th class="essential">Especialidad</th>
                            	<th class="essential">Observaci&oacute;n</th>
                            	<th class="sorting" style="width: 170px;">Pais</th>
                            	<th style="width: 10px;"></th>
                            </tr>
                        </thead>
	                	<tbody role="alert" aria-live="polite" aria-relevant="all">
	                	<?php 
	                	
	                		$clase = "";
	                		$qry = "select me.corporacion, me.medico, me.especialidad, me.fecha, me.observacion, p.descripcion as pais, e.descripcion, me.especialidad from medico_especialidad me inner join especialidad e on me.especialidad = e.id inner join pais p on me.pais = p.id where me.corporacion = ? and me.medico = ?";
		                	$stmt = $db->prepare($qry);
		                	$stmt->bind_param('ii', $USER_CORPORATION, $Id);
		                	
		                	$stmt->execute();
		                	
		                	$result = $stmt->get_result();
		                	$contador = mysqli_num_rows($result);
		                	while ($row = $result->fetch_assoc()) {
								if ($clase == "odd")
									$clase == "even";
	            				else
									$clase == "odd";
		                ?>
		                	<tr class="<?= $clase ?>">
	                            <td class=""><?php echo $row["fecha"]; ?></td>
	                            <td class=""><?php echo $row["especialidad"]; ?></td>
	                            <td class=""><?php echo $row["observacion"]; ?></td>
	                            <td class=""><?php echo $row["pais"]; ?></td>
	                            <td class="" style="text-aling:center;">
	                            	<a href="edit.php?<?php echo "id=" . $Id . "&Especialidad=" . $row["especialidad"]; ?>">Editar</a>
	                            </td>
	                        </tr>
		                <?php 
		                	}
	                	?>
	                		
						</tbody>
					</table>
					<div class="dataTables_info" id="dt1_info">Total <?php echo $contador; ?></div>
						<div class="dataTables_paginate paging_two_button" id="dt1_paginate">
							<a class="paginate_disabled_previous" tabindex="0" role="button" id="dt1_previous" aria-controls="dt1">Previous</a>
							<a class="paginate_disabled_next" tabindex="0" role="button" id="dt1_next" aria-controls="dt1">Next</a>
						</div>
					</div>
	            </div>
	        </div>
	    </div>
	</div>
</div>


<?php
	include("../includes/footer.php");
?>