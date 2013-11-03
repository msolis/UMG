<?php
	include("../includes/head.php");
	include("../includes/menu.php");
	
?>

<div class="container" style="padding-bottom: 30px;">

		<div class="row">
			<div class="twelve columns">
				<div class="box_c">
					<div class="box_c_heading cf">
						<p>Corporacion</p>
					</div>
					<div class="box_c_content form_a">
						<div class="tab_pane" style="">
							<form action="" method="post" class="nice custom" style="">
								<div class="formRow">
									<label for="nice_text">Id</label>
									<input type="text" id="id_" class="input-text" disabled value="" />
									<input type="hidden" id="Id" name="Id" class="input-text" />
								</div>
								<div class="formRow">
									<label for="nice_text">Nombre</label>
									<input type="text" id="Nombre" name="Nombre" disabled class="input-text" value="">
								</div>
								<div class="formRow">
									<label for="nice_text_medium">Direcci&oacute;n</label>
									<textarea name="Direccion" id="Direccion" cols="1" rows="1" disabled class="large"></textarea>
								</div>
								<div class="formRow">
									<label for="nice_text_oversized">Correo Electr&oacute;nico</label>
									<input type="text" id="Correo" name="Correo" disabled class="input-text large" value="">
								</div>
								<div class="formRow">
									<label for="nice_text_small">Smtp Port</label>
									<input type="text" id="Telefono" name="Telefono" disabled class="input-text large" value="">
								</div>
								<div class="formRow">
									<label for="nice_text_small">Correo Electr&oacute;nico de Envio de Email</label>
									<input type="text" id="Telefono" name="Telefono" disabled class="input-text large" value="">
								</div>
								<div class="formRow" style="">
									<label for="nice_select">Pais</label>
									<select id="Estatus" name="Estatus" disabled class="custom dropdown medium" >
										<option value="A">Alta</option>
										<option value="B">Baja</option>
										<option value="A">Alta</option>
										<option value="B">Baja</option>
										<option value="A">Alta</option>
										<option value="B">Baja</option>
										<option value="A">Alta</option>
										<option value="B">Baja</option>
									</select>
								</div>
								<div class="formRow" style="">
									<label for="nice_select">Departamento</label>
									<select id="Estatus" name="Estatus" disabled class="custom dropdown medium" >
										<option value="A">Alta</option>
										<option value="B">Baja</option>
										<option value="A">Alta</option>
										<option value="B">Baja</option>
										<option value="A">Alta</option>
										<option value="B">Baja</option>
										<option value="A">Alta</option>
										<option value="B">Baja</option>
									</select>
								</div>
								<div class="formRow" style="">
									<label for="nice_select">Municipio</label>
									<select id="Estatus" name="Estatus" disabled class="custom dropdown medium" >
										<option value="A">Alta</option>
										<option value="B">Baja</option>
										<option value="A">Alta</option>
										<option value="B">Baja</option>
										<option value="A">Alta</option>
										<option value="B">Baja</option>
										<option value="A">Alta</option>
										<option value="B">Baja</option>
									</select>
								</div>
								<div class="formRow">
									<label for="nice_text_small">Telefono</label>
									<input type="text" id="Telefono" name="Telefono" disabled class="input-text large" value="">
								</div>
								<div class="formRow">
									<label for="nice_text_small">Telefono</label>
									<input type="text" id="Telefono" name="Telefono" disabled class="input-text large" value="">
								</div>
								<div class="formRow" style="">
									<label for="nice_select">Estatus</label>
									<select id="Estatus" name="Estatus" disabled class="custom dropdown medium" >
										<option value="A">Alta</option>
										<option value="B">Baja</option>
									</select>
								</div>
								<div class="formRow">
									<a style="cursor:pointer;" name="editar" class="clear_form">Editar</a>
                                    <button type="submit" name="boton" style="display:none;" class="button small nice blue radius">Guardar</button>
									<a href="index.php" class="clear_form">Cancelar</a>
									<script type="text/javascript">
										$("[name=editar]").on("click", function(){
											$("form").find("input").removeAttr("disabled");
											$("form").find("textarea").removeAttr("disabled");
											$("form").find("#id_").attr("disabled", "disabled");
											$(this).hide();
											$("[name=boton]").show();
										});
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
	include("../includes/footer.php");
?>