<?php
	include("../includes/head.php");
	include("../includes/menu.php");
	
?>

<div class="container" style="padding-bottom: 30px;">

		<div class="row">
			<div class="twelve columns">
				<div class="box_c">
					<div class="box_c_heading cf">
						<p>Nuevo Pais</p>
					</div>
					<div class="box_c_content form_a">
						<div class="tab_pane" style="">
							<form action="" method="post" class="nice custom" style="">
								<div class="formRow">
									<label for="nice_text">Descripcion</label>
									<input type="text" id="Nombre" name="Nombre" class="input-text" value="">
								</div>
								<div class="formRow" style="">
									<label for="nice_select">Estatus</label>
									<select id="Estatus" name="Estatus" class="custom dropdown medium" >
										<option value="A">Alta</option>
										<option value="B">Baja</option>
									</select>
								</div>
								<div class="formRow">
									<button type="submit" name="boton" style="display:none;" class="button small nice blue radius">Guardar</button>
									<a href="index_pais.php" class="clear_form">Cancelar</a>
								<div>
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