<?php
	include("../includes/head.php");
	include("../includes/menu.php");
	
	$Id = "";
	$Nombre = "";
	$Descripcion = "";
	$Diagnostico = "";
	$Estatus = "";
	
	if(!isset($_GET["Id"])){
		header("Location: index.php?error=Enfermedad no valida.");
	}else{
	
		$Id = $_GET["Id"];
	
		$stmt = $db->prepare("select corporacion, id, nombre, descripcion, diagnostrico, estatus from enfermedad where corporacion = ? and id = ?;");
		$stmt->bind_param('ii', $USER_CORPORATION, $Id);
	
		$stmt->execute();
		$result = $stmt->get_result();
		$rowCount = mysqli_num_rows($result);
		$rowArray = mysqli_fetch_array($result);
	
		$Id = $rowArray["id"];
		$Nombre = $rowArray["nombre"];
		$Descripcion = $rowArray["descripcion"];
		$Diagnostico = $rowArray["diagnostrico"];
		$Estatus = $rowArray["estatus"];

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
						<p>Enfermedad</p>
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
									<label for="nice_text">Nombre</label>
									<input type="text" id="Nombre" disabled name="Nombre" class="input-text" value="<?php echo $Nombre ?>">
								</div>
								<div class="formRow">
									<label for="nice_text">Descripcion</label>
									<textarea name="Descripcion" id="Descripcion" disabled cols="1" rows="1" class="large"><?php echo $Descripcion ?></textarea>
								</div>
								<div class="formRow">
									<label for="nice_text">Diagnostico</label>
									<textarea name="Diagnostico" id="Diagnostico" disabled cols="1" rows="1" class="large"><?php echo $Diagnostico ?></textarea>
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
	                <p>Sintomas</p>
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
                            	<th class="essential sorting" role="columnheader" style="">Sintoma</th>
                            	<th class="essential sorting" role="columnheader" style="">Observacion</th>
                            </tr>
                        </thead>
	                	<tbody role="alert" aria-live="polite" aria-relevant="all">
	                	<?php 
	                	
	                		$clase = "";
	                		$qry = 	"select es.corporacion, es.enfermedad, es.sintoma, es.observacion, s.descripcion as nombre_sintoma from enfermedad_sintoma es " .
									"	inner join sintoma s on es.corporacion = s.corporacion and es.sintoma = s.id " .
									" where es.corporacion = ? and es.enfermedad = ?"; 
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
	                            <td class=""><?php echo $row["sintoma"]; ?></td>
	                            <td class=""><?php echo $row["nombre_sintoma"]; ?></td>
	                            <td class=""><?php echo $row["observacion"]; ?></td>
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