<?php
	include("../includes/head.php");
	include("../includes/menu.php");
	
	$Id = "";
	$Nombre = "";
	$Nit = "";
	$Estatus = "";
	$Telefono = "";
	$Direccion = "";
	
	if(!isset($_GET["id"])){
		header("Location: index.php?error=Cliente no valido.");
	}else{
		
		$Id = $_GET["id"];
		
		if (isset($_POST["boton"])){
			$Paciente = $_POST["Paciente"];
			
			$qryInsert = "insert into cliente_paciente (corporacion, cliente, paciente) values(?, ?, ?);";
			
			$stmt = $db->prepare($qryInsert);
			$stmt->bind_param('iii', $USER_CORPORATION, $Id, $Paciente);
			$rc = $stmt->execute();
			if (!$rc) {
				$typeError = "error";
				$textError = "NO se pudo guardar el registro. Error: " . $stmt->error;
			}else{
				$typeError = "success";
				$textError = "Información Editada Exitosamente.";
				header("Location: pacientes.php?id=" . $Id);
			}
			mysqli_stmt_close($stmt);
		}
	
		
	
		$stmt = $db->prepare("select corporacion, id, nombrecomercial, nit, estatus, telefono, direccion from cliente where corporacion = ? and id = ?;");
		$stmt->bind_param('ii', $USER_CORPORATION, $Id);
	
		$stmt->execute();
		$result = $stmt->get_result();
		$rowCount = mysqli_num_rows($result);
		$rowArray = mysqli_fetch_array($result);
	
		$Id = $rowArray["id"];
		$Nit = $rowArray["nit"];
		$Estatus = $rowArray["estatus"];
		$Nombre = $rowArray["nombrecomercial"];
		$Telefono = $rowArray["telefono"];
		$Direccion = $rowArray["direccion"];
?>
<div class="container" style="padding-bottom: 30px;">
	<?php if(isset($_GET["error"])) { ?>
	<div class="row" id="alerta">
        <div class="twelve columns">
            <div class="box_c">
                <div class="box_c_heading cf">
                    <p>Alerta</p>
                </div>
                <div class="box_c_content">
                    <div class="alert-box warning">
                        <?php echo $_GET["error"]; ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php } ?>
    <script type="text/javascript">
    	$("#alerta").delay(60000).slideUp(1000);
    </script>
    
    <div class="row">
			<div class="twelve columns">
				<div class="box_c">
					<div class="box_c_heading cf">
						<p>Cliente</p>
					</div>
					<div class="box_c_content form_a">
						<div class="tab_pane" style="">
							<form action="" method="post" class="nice custom" style="">
								<div class="formRow">
									<label for="nice_text">Id</label>
									<input type="text" class="input-text" disabled value="<?php echo $Id ?>" />
									<input type="hidden" id="Id" name="Id" class="input-text" />
								</div>
								<div class="formRow">
									<label for="nice_text_oversized">Nit</label>
									<input type="text" id="Nit" name="Nit" disabled class="input-text large" value="<?php echo $Nit ?>">
								</div>
								<div class="formRow">
									<label for="nice_text">Nombre</label>
									<input type="text" id="NombreComercial" disabled name="NombreComercial" class="input-text" value="<?php echo $Nombre ?>">
								</div>
								<div class="formRow">
									<label for="nice_text_small">Telefono</label>
									<input type="text" id="Telefono" name="Telefono" disabled class="input-text large" value="<?php echo $Telefono ?>">
								</div>
								<div class="formRow" style="">
									<label for="nice_select">Estatus</label>
									<select id="Estatus" name="Estatus" disabled class="custom dropdown medium" >
										<option value="A" <?php if($Estatus == "A") echo "selected" ?>>Alta</option>
										<option value="B" <?php if($Estatus == "B") echo "selected" ?>>Baja</option>
									</select>
								</div>
								<div class="formRow">
									<a href="index.php" class="clear_form">Clientes</a>
                                </div>
								
							</form>
						</div>
										
					</div>
				</div>
			</div>
		</div>
		
	<?php 
			if ($typeError){
				alert($typeError, $textError);
			}
		?>
		<div class="row">
			<div class="twelve columns">
				<div class="box_c">
					<div class="box_c_heading cf">
						<p>Asignar paciente al cliente</p>
					</div>
					<div class="box_c_content form_a">
						<div class="tab_pane" style="">
							<form action="" method="post" class="nice custom" style="">
							
								<div class="formRow" style="">
									<label for="nice_select">Paciente</label>
									<select id="Paciente" name="Paciente" class="custom dropdown medium" >
										<?php newSelector("paciente", "id", "nombre", " where estatus = 'A' and corporacion = " . $USER_CORPORATION . " and id not in (select paciente from cliente_paciente where corporacion = " . $USER_CORPORATION . " and cliente = " . $Id . ")", ""); ?>
									</select>
								</div>
								
								<div class="formRow">
                                    <button type="submit" name="boton" class="button small nice blue radius">Asignar</button>
									<a href="pacientes.php?id=<?php echo $Id; ?>" class="clear_form">Cancelar</a>
									<script type="text/javascript">
										if($("#Paciente option").length == 0){
											$("[name=boton]").attr("disabled", "disabled");
										}
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
	}
	include("../includes/footer.php");
?>