<?php
	include("../includes/head.php");
	include("../includes/menu.php");
	
	
	$Id = $USER_ID;
	$Clave_Actual = "";
	$Clave = "";
	$Clave_Confirmacion = "";
	
	if(!isset($Id)){
		header("Location: index.php");	
	}else{

		if (isset($_POST["boton"])){
			$Clave_Actual = $_POST["$Clave_Actual"];
			$Clave = $_POST["$Clave"];
			$Clave_Confirmacion = $_POST["$Clave_Confirmacion"];
			
			$stmt = $db->prepare("select id from usuario where corporacion = ? and id = ? and clave = ?;");
			$stmt->bind_param('iis', $USER_CORPORATION, $Id, $Clave_Actual);
			
			$stmt->execute();
			$result = $stmt->get_result();
			$rowCount = mysqli_num_rows($result);
			
			if ($rowCount == 0){
				$typeError = "Error";
				$textError = "Clave Invalida.";
			}else{
			
				$qryInsert = "update usuario set clave = ? where corporacion = ? and id = ?;";
				
				$stmt = $db->prepare($qryInsert);
				$stmt->bind_param('sii', $Clave, $USER_CORPORATION, $Id);
				$rc = $stmt->execute();
				
				if (!$rc) {
					$typeError = "error";
					$textError = "NO se pudo cambiar la Clave. Error: " . $stmt->error;
				}else{
					$typeError = "success";
					$textError = "Clave cambiada exitosamente, se redireccionará...";
				}
				mysqli_stmt_close($stmt);
			}
		}

		$stmt = $db->prepare("select corporacion, id, correo, estatus, nombre, imagen, telefono, direccion from usuario where corporacion = ? and id = ?;");
		$stmt->bind_param('ii', $USER_CORPORATION, $Id);
		
		$stmt->execute();
		$result = $stmt->get_result();
		$rowCount = mysqli_num_rows($result);
		$rowArray = mysqli_fetch_array($result);

		$Id = $rowArray["id"];
		$Correo = $rowArray["correo"];
		$Nombre = $rowArray["nombre"];
		$Imagen = $rowArray["imagen"];
		$Telefono = $rowArray["telefono"];
		$Direccion = $rowArray["direccion"];

	}

?>

<div class="container" style="padding-bottom: 30px;">
		<?php 
		
			if ($typeError){
				alert($typeError, $textError);
			}
		?>
		
		<div class="row" id="alerta_js" style="display:none;>
	        <div class="twelve columns">
	            <div class="box_c">
	                <div class="box_c_heading cf">
	                    <p>Alerta</p>
	                </div>
	                <div class="box_c_content">
	                    <div id="texto_msj" class="alert-box warning">
	                        
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
		
		<div class="row">
			<div class="four columns">
				<div class="box_c">
					<div class="box_c_heading cf">
						<div class="box_c_ico"><img src="../images/16-Abacus.png" alt=""></div>
						<p>Opciones</p>
					</div>
					<div class="box_c_content">
						<ul class="overview_list">
							<li>
								<a href="../users/settings.php">
									<img src="../images/blank.gif" style="background-image: url(../images/tag.png)" alt="">
									<span class="ov_nb">Cambiar Información</span>
									<span class="ov_text">Información Personal</span>
								</a>
							</li>
							<li>
								<a href="../users/changepassword.php">
									<img src="../images/blank.gif" style="background-image: url(../images/Change-Password-32.png)" alt="">
									<span class="ov_nb">Cambiar Clave</span>
									<span class="ov_text">Cambio de Contraseña</span>
								</a>
							</li>
							<li>
								<a href="../users/changeimage.php">
									<img src="../images/blank.gif" style="background-image: url(../images/happy-face.png)" alt="">
									<span class="ov_nb">Imagen de Perfil</span>
									<span class="ov_text">Cambiar Imagen de Perfil</span>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="eight columns">
				<div class="box_c">
					<div class="box_c_heading cf">
						<p>Cambiar Clave</p>
					</div>
					<div class="box_c_content">
						<div class="tab_pane" style="">
							<form action="" method="post" class="nice custom" style="">
							<div class="formRow">
									<img src="<?php echo $USER_IMAGE_PATH; ?>" style="height: 100px;" alt="" /> 
								</div>
								<div class="formRow">
									<label for="nice_text">Id</label>
									<input type="text" class="input-text" disabled value="<?php echo $Id ?>" />
									<input type="hidden" id="Id" name="Id" class="input-text" />
								</div>
								<div class="formRow">
									<label for="nice_text">Nombre</label>
									<input type="text" id="Nombre" name="Nombre" disabled class="input-text" value="<?php echo $Nombre ?>">
								</div>
								<div class="formRow">
									<label for="nice_text_oversized">Correo Electrónico</label>
									<input type="text" id="Correo" name="Correo" disabled class="input-text large" value="<?php echo $Correo ?>">
								</div>
								<div class="formRow">
									<label for="nice_text_small">Clave Actual</label>
									<input type="password" id="Clave_Actual" name="Clave_Actual" required class="input-text large" value="">
								</div>
								<div class="formRow">
									<label for="nice_text_small">Clave</label>
									<input type="password" id="Clave" name="Clave" required class="input-text large" value="">
								</div>
								<div class="formRow">
									<label for="nice_text_small">Confirmación de Clave</label>
									<input type="password" id="Clave_Confirmacion" name="Clave_Confirmacion" required class="input-text large" value="">
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