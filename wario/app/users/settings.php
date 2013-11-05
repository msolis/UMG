<?php
	include("../includes/head.php");
	include("../includes/menu.php");
	
	
	$Id = $USER_ID;
	$Nombre = "";
	$Correo = "";
	$Estatus = "";
	$Telefono = "";
	$Direccion = "";
	$Clave = "";
	$Imagen = "";
	
	if(!isset($Id)){
		header("Location: index.php");	
	}else{

		if (isset($_POST["boton"])){
			$Nombre = $_POST["Nombre"];
			$Correo = $_POST["Correo"];
			$Telefono = $_POST["Telefono"];
			$Direccion = $_POST["Direccion"];
			
			$qryInsert = "UPDATE usuario set correo = ?, clave = ?, nombre = ?, telefono = ?, direccion = ? where corporacion = ? and id = ?;";
			
			$stmt = $db->prepare($qryInsert);
			$stmt->bind_param('sssssii', $Correo, $Clave, $Nombre, $Telefono, $Direccion, $USER_CORPORATION, $Id);
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

		$stmt = $db->prepare("SELECT corporacion, id, correo, estatus, nombre, imagen, telefono, direccion FROM usuario where corporacion = ? and id = ?;");
		$stmt->bind_param('ii', $USER_CORPORATION, $Id);
		
		$stmt->execute();
		$result = $stmt->get_result();
		$rowCount = mysqli_num_rows($result);
		$rowArray = mysqli_fetch_array($result);

		$Id = $rowArray["id"];
		$Correo = $rowArray["correo"];
		$Estatus = $rowArray["estatus"];
		$Nombre = $rowArray["nombre"];
		$Imagen = $rowArray["imagen"];
		$Telefono = $rowArray["telefono"];
		$Direccion = $rowArray["direccion"];

	}

?>
<script>
                                	$(document).on("ready", function(){
                                    	

                                		$("#usuario").on("submit", function(){
                                    		var alerta_js = $("#alerta_js");

                                    		if ($("#Nombre").val() == "")
                                    		{
                                    			alerta_js.find("#texto_msj").html("Correo es requerido.");
                                        		alerta_js.slideDown(1000).delay(2000).slideUp(1000);
                                        		$("#Nombre").focus();
                                        		return false;
                                    		}
                                    		
                                    		if ($("#Correo").val() == "")
                                    		{
                                    			alerta_js.find("#texto_msj").html("Correo es requerido.");
                                        		alerta_js.slideDown(1000).delay(2000).slideUp(1000);
                                        		$("#Correo").focus();
                                        		return false;
                                    		}

                                    		if ($("#Correo_Confirmacion").val() == "")
                                    		{
                                    			alerta_js.find("#texto_msj").html("Confirmación de Correo es requerido.");
                                        		alerta_js.slideDown(1000).delay(2000).slideUp(1000);
                                        		$("#Correo_Confirmacion").focus();
                                        		return false;
                                    		}

                                    		if ($("#Correo").val() != $("#Correo_Confirmacion").val())
                                    		{
                                    			alerta_js.find("#texto_msj").html("Los Correos no concuerdan.");
                                        		alerta_js.slideDown(1000).delay(2000).slideUp(1000);
                                        		$("#Correo").focus();
                                        		return false;
                                    		}
                                    		return true;
                                		});
                                	
                                	});
                                </script>
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
						<p>Cambiar Información Personal</p>
					</div>
					<div class="box_c_content">
						<div class="tab_pane" style="">
							<form id="usuario" action="settings.php" method="post" class="nice custom" style="">
								<div class="formRow">
									<label for="nice_text">Id</label>
									<input type="text" class="input-text" disabled value="<?php echo $Id ?>" />
									<input type="hidden" id="Id" name="Id" class="input-text" />
								</div>
								<div class="formRow">
									<label for="nice_text">Nombre</label>
									<input type="text" id="Nombre" name="Nombre" required class="input-text" value="<?php echo $Nombre ?>">
								</div>
								<div class="formRow">
									<label for="nice_text_oversized">Correo Electrónico</label>
									<input type="text" id="Correo" name="Correo" required class="input-text large" value="<?php echo $Correo ?>">
								</div>
								<div class="formRow">
									<label for="nice_text_oversized">Confirmación de Correo Electrónico</label>
									<input type="text" id="Correo_Confirmacion" required name="Correo_Confirmacion" class="input-text large" value="">
								</div>
								<div class="formRow">
									<label for="nice_text_small">Telefono</label>
									<input type="text" id="Telefono" name="Telefono" class="input-text large" value="<?php echo $Telefono ?>">
								</div>
								<div class="formRow">
									<label for="nice_text_medium">Dirección</label>
									<textarea name="Direccion" id="Direccion" cols="1" rows="1" class="large"><?php echo $Direccion ?></textarea>
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