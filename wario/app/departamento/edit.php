<?php
	include("../includes/head.php");
	include("../includes/menu.php");
	
	
	$Pais = "";
	$NombrePais = "";
	$Id = "";
	$Descripcion = "";
	$Estatus = "";
	
	
	
	if(!isset($_GET["Id"])){
		header("Location: index.php");	
	}else{

		$Pais = $_GET["Pais"];
		$Id = $_GET["Id"];

		if (isset($_POST["boton"])){
			$Descripcion = $_POST["Descripcion"];
			$Estatus = $_POST["Estatus"];
			$Pais = $_POST["Pais"]; 
			$Id = $_POST["Id"]; 

			
			$qryInsert = "update departamento set Estatus = ?, Descripcion = ?  where pais = ? and id = ?;";
			
			$stmt = $db->prepare($qryInsert);
			$stmt->bind_param('sssi',  $Estatus, $Descripcion ,$Pais ,$Id);
			$rc = $stmt->execute();
			if (!$rc) {
				$typeError = "error";
				$textError = "NO se pudo guardar el registro. Error: " . $stmt->error;
			}else{
				$typeError = "success";
				$textError = "Información Editada Exitosamente.";
			}
			mysqli_stmt_close($stmt);
		}

		$stmt = $db->prepare("select d.pais, d.id, d.descripcion, d.estatus, p.descripcion as nombre_pais from departamento d inner join pais p on p.id = d.pais where d.pais = ? and d.id = ?;");
		$stmt->bind_param('ii', $Pais, $Id);
		
		$stmt->execute();
		$result = $stmt->get_result();
		$rowCount = mysqli_num_rows($result);
		$rowArray = mysqli_fetch_array($result);

		
		$Estatus = $rowArray["estatus"];
		$Descripcion = $rowArray["descripcion"];
		$Pais = $rowArray["pais"];
		$NombrePais = $rowArray["nombre_pais"];

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
						<p>Editar Pais</p>
					</div>
					<div class="box_c_content form_a">
						<div class="tab_pane" style="">
							<form action="" method="post" class="nice custom" style="">
								
								<input id="Pais" name="Pais" type="hidden" value="<?php echo $Pais; ?>">
								<input id="Id" name="Id" type="hidden" value="<?php echo $Id; ?>">

								<div class="formRow">
									<label for="nice_text">Pais</label>
									<input type="text" disabled class="input-text" value="<?php echo $NombrePais; ?>">
								</div>

								<div class="formRow">
									<label for="nice_text">Nombre</label>
									<input type="text" id="Descripcion" name="Descripcion" class="input-text" value="<?php echo $Descripcion ?>">
								</div>
								
								<div class="formRow" style="">
									<label for="nice_select">Estatus</label>
									<select id="Estatus" name="Estatus" class="custom dropdown medium" >
										<option value="A" <?php if($Estatus == "A") echo "selected" ?>>Alta</option>
										<option value="B" <?php if($Estatus == "B") echo "selected" ?>>Baja</option>
									</select>
								</div>
								    <div class="formRow" style="">
									<label for="nice_select">Estatus</label>
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