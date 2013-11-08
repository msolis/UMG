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
		
	<div class="row">
	    <div class="twelve columns">
	        <div class="box_c">
	            <div class="box_c_heading cf">
	                <p>Pacientes asignados al Cliente</p>
	            </div>
	            <div class="box_c_content">
	                <div id="dt1_wrapper" class="dataTables_wrapper" role="grid">
	                <div id="dt1_length" class="dataTables_length">
	                </div>
	                <div class="dataTables_filter" id="dt1_filter">
	                	<button type="button" id="asignar" class="button small nice blue radius">asignar</button>
	                	<script type="text/javascript">
	                		$("#asignar").on("click", function(){
	                			window.location.href = "asignar.php?id=<?php echo $Id; ?>";
	                		});
	                	</script>
	                	<label>Search: <input type="text" aria-controls="dt1"></label>
	               	</div>
	                <table cellpadding="0" cellspacing="0" border="0" class="display mobile_dt1 dt_act dataTable" id="dt1" aria-describedby="dt1_info">
                        <thead>
                            <tr role="row">
                            	<th class="essential sorting_asc" role="columnheader" style="width: 35px; text-aling:center;" style="width: 311px;">#</th>
                            	<th class="essential sorting" role="columnheader" style="">Nombre</th>
                            	<th class="sorting"style="width: 170px;">Estatus</th>
                            </tr>
                        </thead>
	                	<tbody role="alert" aria-live="polite" aria-relevant="all">
	                	<?php 
	                	
	                		$clase = "";
	                		$qry = 	"select cp.cliente, cp.paciente, p.nombre, p.estatus from cliente_paciente cp" .
	                				" inner join paciente p on p.id = cp.paciente and p.corporacion = cp.corporacion" .
	                				" inner join cliente c on c.id = cp.cliente and c.corporacion = cp.corporacion" . 
	                				" where cp.corporacion = ? and cp.cliente = ?";
		                	$stmt = $db->prepare($qry);
		                	$stmt->bind_param("ii", $USER_CORPORATION, $Id);
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
	                            <td class=""><?php echo $row["paciente"]; ?></td>
	                            <td class=""><?php echo $row["nombre"]; ?></td>
	                            <td class=""><?php echo $row["estatus"]; ?></td>
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
	}
	include("../includes/footer.php");
?>