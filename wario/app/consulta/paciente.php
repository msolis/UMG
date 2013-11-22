<?php
	include("../includes/head.php");
	include("../includes/menu.php");
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
                    <p>Consulta Me&eacute;dica</p>
                </div>
                <div class="box_c_content">
                    
                    <form id="simple_wizard" method="GET" action="consulta.php" class="stepy-wizzard nice">
                        <fieldset title="Seleccionar al Paciente" class="well step" id="simple_wizard-step-0" style="display: block;">
                            <legend>Seleccion del paciente a antender</legend>
                            <div class="row">
							    <div class="twelve columns">
							        <div class="box_c">
							            <div class="box_c_heading cf">
							                <p>Seleccione un Pacientes</p>
							            </div>
							            <div class="box_c_content">
							                <div id="dt1_wrapper" class="dataTables_wrapper" role="grid">
							                <div id="dt1_length" class="dataTables_length">
							                </div>
							                <table cellpadding="0" cellspacing="0" border="0" class="display mobile_dt1 dt_act dataTable" id="dt1" aria-describedby="dt1_info">
						                        <thead>
						                            <tr role="row">
						                            	<th class="essential"></th>
						                            	<th class="essential sorting_asc"style="width: 35px; text-aling:center;" style="width: 311px;">#</th>
						                            	<th class="essential sorting">Nombre</th>
						                            	<th class="essential sorting">Correo</th>
						                            	<th class="sorting"style="width: 170px;">Estatus</th>
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
								                	$checkradio = "checked='checked'";
								                	while ($row = $result->fetch_assoc()) {
														if ($clase == "odd")
															$clase == "even";
							            				else
															$clase == "odd";
							            				
							            				
							            				
								                ?>
								                	<tr class="<?= $clase ?>">
								                		<th class=""> <input type="radio" value="<?php echo $row["id"]; ?>" <?php echo $checkradio; ?>  name="paciente" </th>
							                            <td class=""><?php echo $row["id"]; ?></td>
							                            <td class=""><?php echo $row["nombre"]; ?></td>
							                            <td class=""><?php echo $row["correo"]; ?></td>
							                            <td class=""><?php echo $row["estatus"]; ?></td>
							                        </tr>
								                <?php 
								                		$checkradio = "";
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
							
                        
                        </fieldset>
                        <fieldset title="Contact info" class="step" id="simple_wizard-step-1" style="display: none;">
                            <legend>Lorem ipsum dolor…</legend>
                            <div class="row">
                                <div class="twelve columns">
                                    <div class="formRow elVal">
                                        <label for="s_street">Tipo de Consulta</label>
                                        <select id="tipo_consulta_medica" name="tipo_consulta_medica" class="custom dropdown medium" >
											<?php newSelector("tipo_consulta_medica", "id", "descripcion", " where estatus = 'A' and corporacion = $USER_CORPORATION", ""); ?>
										</select>

                                    </div>
                                </div>
                            </div>
                       </fieldset>
                        <button type="submit" class="finish gh_button icon approve primary">Send registration</button>
                        
                    </form>
                </div>
            </div>
        </div>
    </div>

	
</div>
<?php
	include("../includes/footer.php");
?>