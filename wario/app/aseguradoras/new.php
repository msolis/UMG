<?php
	include("../includes/head.php");
	include("../includes/menu.php");
?>

<?php 

	$error = "";
	$success = "";
	if (isset($_POST["boton"])){
		$Nombre = $_POST["Nombre"];
		$Observacion = $_POST["Observacion"];
		$Estatus = $_POST["Estatus"];
		
		
		$stmt = $db->prepare("select corporacion, id from aseguradora where corporacion = ? and id = ?;");
		$stmt->bind_param('ii', $USER_CORPORATION, $Id);
		
		$stmt->execute();
		$result = $stmt->get_result();
		$rowCount = mysqli_num_rows($result);
		
		
		if ($rowCount == 0){
			
			$stmt = $db->prepare("select ifnull(max(id),0)+1 as id from aseguradora where corporacion = ?;");
			$stmt->bind_param('i', $USER_CORPORATION);
			$stmt->execute();
			$result = $stmt->get_result();
			$rowArray = mysqli_fetch_array($result);
			
			$Id = $rowArray["id"];
			
			$stmt = $db->prepare("insert into aseguradora (corporacion, id, nombre, observacion, estatus) values (?, ?, ?, ?, ?);");
			$stmt->bind_param('iisss', $USER_CORPORATION, $Id, $Nombre, $Observacion, $Estatus);
			$stmt->execute();
			$result = $stmt->get_result();
			if ($result == 0){
				header("Location: index.php");
			}else{
				$error = "Ha ocurrido un Error, No se pudo guardar el Usuario.";
			}
		}else{
			$error = "La Consulta Ya Existe";	
		}
		echo $error;
		
	}

?>

<div class="container" style="padding-bottom: 30px;">

		<div class="row">
			<div class="twelve columns">
				<div class="box_c">
					<div class="box_c_heading cf">
						<p>Nueva Aseguradora</p>
					</div>
					<div class="box_c_content form_a">
						<div class="tab_pane" style="">
							<form action="" method="post" class="nice custom" style="">
								<div class="formRow">
									<label for="nice_text">Nombre</label>
									<input type="text" required id="Nombre" name="Nombre" class="input-text">
								</div>
								<div class="formRow">
									<label for="nice_text_small">Observacion</label>
									<input type="text" id="Observacion" name="Observacion" class="input-text large">
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