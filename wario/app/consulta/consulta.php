<?php
	include("../includes/head.php");
	include("../includes/menu.php");
	
	$PACIENTE = $_GET["paciente"];
	$TIPO_CONSULTA_MEDICA = $_GET["tipo_consulta_medica"];
	
	$resulta_paciente = "";
	
	$stmt = $db->prepare('select paciente.id, paciente.nombre, paciente.fechanacimiento, (select descripcion from genero where genero.corporacion = paciente.corporacion and genero.id = paciente.genero) as genero, (select id from medico where medico.corporacion = paciente.corporacion and medico.usuario = ? limit 1) as medico   from paciente where paciente.corporacion = ? and paciente.id = ? ;');
	$stmt->bind_param("iii", $USER_ID, $USER_CORPORATION, $PACIENTE);
    $stmt->execute();
                	
    $resulta_paciente = $stmt->get_result();
    $row = mysqli_fetch_assoc($resulta_paciente);
    $Nombre = $row["nombre"];
    $FechaNacimiento = $row["fechanacimiento"];
    $genero = $row["nombre"];
    $Medico = $row["medico"];
    
    $stmt = $db->prepare('select ifnull(max(id),0)+1 as id from consulta_medica where corporacion = ? and hospital = 1;');
    $stmt->bind_param("i", $USER_CORPORATION);
    $stmt->execute();
    $result_id = $stmt->get_result();
    $rowid = mysqli_fetch_assoc($result_id);
    $id = $rowid["id"];
    
    $qry = "insert into consulta_medica (corporacion, hospital, id, tipo_consulta, medico, paciente, fecha, estatus) values (?, 1, ?, ?, ?, ?, curdate(), 'A');";
    $stmt = $db->prepare($qry);
    
    $stmt->bind_param('iiiii', $USER_CORPORATION, $id, $TIPO_CONSULTA_MEDICA, $Medico, $PACIENTE);
    $rc = $stmt->execute();
	if (!$rc) {
		header("Location: paciente.php");
	}else{
		$typeError = "success";
		$textError = "Información Editada Exitosamente.";
	}
mysqli_stmt_close($stmt);
    
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
					<p>Paciente</p>
				</div>
				<div class="box_c_content form_a">
					<div class="tab_pane" style="">
						<form action="" method="post" class="nice custom" style="">
							<div class="formRow">
								<label for="nice_text_oversized">Nombre</label>
								<input type="text" id="Nombre" name="Nombre" class="input-text large" disabled value="<?php echo $Nombre ?>">
							</div>
							<div class="formRow">
								<label for="nice_text_oversized">Fecha Nacimiento</label>
								<input type="text" id="Nombre" name="Nombre" class="input-text large" disabled value="<?php echo $FechaNacimiento ?>">
							</div>
							<div class="formRow">
								<label for="nice_text_oversized">Genero</label>
								<input type="text" id="Nombre" name="Nombre" class="input-text large" disabled value="<?php echo $genero ?>">
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
	                <p>Sintomas</p>
	            </div>
	            <div class="box_c_content">
	                <div id="dt1_wrapper" class="dataTables_wrapper" role="grid">
	                <div id="dt1_length" class="dataTables_length">
	                </div>
	                <table cellpadding="0" cellspacing="0" border="0" class="display mobile_dt1 dt_act dataTable" id="dt1" aria-describedby="dt1_info">
                        <thead>
                            <tr role="row">
                            	<th class="essential sorting_asc"style="width: 35px; text-aling:center;" style="width: 311px;">#</th>
                            	<th class="essential sorting">Nombre</th>
                            	<th class="essential sorting">Correo</th>
                            	<th class="sorting"style="width: 170px;">Estatus</th>
                            	<th style="width: 10px;"></th>
                            </tr>
                        </thead>
	                	<tbody role="alert" aria-live="polite" aria-relevant="all">
	                	<?php 
	                	
	                		$clase = "";
	                		
		                	$stmt = $db->prepare('select id, nombre, correo, estatus from paciente where corporacion = ?;');
		                	$stmt->bind_param("i", $USER_CORPORATION);
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
	                            <td class=""><?php echo $row["id"]; ?></td>
	                            <td class=""><?php echo $row["nombre"]; ?></td>
	                            <td class=""><?php echo $row["correo"]; ?></td>
	                            <td class=""><?php echo $row["estatus"]; ?></td>
	                            <td class="" style="text-aling:center;">
	                            	<a href="tipoconsulta.php?paciente=<?php echo $row["id"]; ?>">Seleccionar</a>	                            	
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