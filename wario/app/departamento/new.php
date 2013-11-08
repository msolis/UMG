<?php
	include("../includes/head.php");
	include("../includes/menu.php");
?>

<?php 

	$error = "";
	$success = "";
	if (isset($_POST["boton"])){
		$Nombre = $_POST["Nombre"];
		$Estatus = $_POST["Estatus"];
		$Pais = $_POST["pais"];
		
		$error = "";
		
			
		/// get new usuer id
		$stmt = $db->prepare("SELECT ifnull(max(id),0)+1 as id from departamento;");

		$stmt->execute();
		$result = $stmt->get_result();
		$rowArray = mysqli_fetch_array($result);
		
		$Id = $rowArray["id"];
		
		$stmt = $db->prepare("insert into departamento (pais,id, descripcion, estatus) values (?, ?, ?,?);");
		$stmt->bind_param('isss', $Pais, $Id, $Nombre, $Estatus);
		$rc = $stmt->execute();
		if (!$rc) {
			$typeError = "error";
			$textError = "NO se pudo guardar el registro. Error: " . $stmt->error;
		}else{
			$typeError = "success";
			$textError = "Información ha sido guardada exitosamente.";
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
						<p>Nuevo Departamento</p>
					</div>
					<div class="box_c_content form_a">
						<div class="tab_pane" style="">
							<form action="" method="post" class="nice custom" style="">
								<div class="formRow">
									<label for="nice_text">Nombre</label>
									<input type="text" required id="Nombre" name="Nombre" class="input-text">
								</div>
								<div class="formRow" style="">
									<label for="nice_select">Estatus</label>
									<select id="Estatus" name="Estatus" class="custom dropdown medium" >
										<option value="A">Alta</option>
										<option value="B">Baja</option>
									</select>
								</div>
								<div class="formRow" style="">
									<label for="nice_select">Pais</label>
									<select id="pais" name="pais" class="custom dropdown medium" >
										<?php newSelector("pais", "id", "descripcion", " where estatus = 'A'", ""); ?>
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