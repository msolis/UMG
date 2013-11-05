<?php
	include("../includes/head.php");
	include("../includes/menu.php");
?>
<div class="container" style="padding-bottom: 30px;">
	<div class="row">
	    <div class="twelve columns">
	        <div class="box_c">
	            <div class="box_c_heading cf box_actions">
	                <p>Medicos</p>

	            </div>
	            <div class="box_c_content">
	                <div id="dt1_wrapper" class="dataTables_wrapper" role="grid">
	                <div id="dt1_length" class="dataTables_length">
	                </div>
	                <div class="dataTables_filter" id="dt1_filter">
	                	<button type="button" name="boton" class="button small nice blue radius">Nuevo</button>
	                	<label>Buscar: <input type="text" aria-controls="dt1"></label>
	               	</div>
	                <table cellpadding="0" cellspacing="0" border="0" class="display mobile_dt1 dt_act dataTable" id="dt1" aria-describedby="dt1_info">
                        <thead>
                            <tr role="row">
                            	<th class="essential sorting_asc" role="columnheader" style="width: 35px; text-aling:center;" tabindex="0" aria-controls="dt1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 35px;">#</th>
                            	<th class="essential sorting_asc" role="columnheader" style="width: text-aling:center;" tabindex="0" aria-controls="dt1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 311px;">Nombre</th>
                            	<th class="essential" role="columnheader" tabindex="0" aria-controls="dt1" rowspan="1" colspan="1" aria-label="Capital: activate to sort column ascending" style="width: 206px;">Correo</th>
                            	<th class="essential" role="columnheader" tabindex="0" aria-controls="dt1" rowspan="1" colspan="1" aria-label="Capital: activate to sort column ascending" style="width: 100px;">Telefono</th>
                            	<th class="sorting" role="columnheader" tabindex="0" aria-controls="dt1" rowspan="1" colspan="1" aria-label="Population: activate to sort column ascending" style="width: 170px;">Estatus</th>
                            	<th style="width: 10px;"></th>
                            </tr>
                        </thead>
	                	<tbody role="alert" aria-live="polite" aria-relevant="all">
	                	<?php 
	                	
	                		$clase = "";
	                		
		                	$stmt = $db->prepare('select Id, Nombre, Correo, Telefono, Imagen, Estatus from MEDICO where Corporacion = ?;');
		                	$stmt->bind_param('i', $USER_CORPORATION);
		                	
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
		                		<td class=""><img src="../data/medicos/<?php echo $row["Imagen"]; ?>" style="height:25px;" /></td>
	                            <td class=""><?php echo $row["Nombre"]; ?></td>
	                            <td class=""><?php echo $row["Correo"]; ?></td>
	                            <td class=""><?php echo $row["Telefono"]; ?></td>
	                            <td class=""><?php echo $row["Estatus"]; ?></td>
	                            <td class="" style="text-aling:center;"><a href="edit.php?Id=<?php echo $row["Id"]; ?>">Editar</a></td>
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