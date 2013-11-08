<?php
	include("../includes/head.php");
	include("../includes/menu.php");
?>
<div class="container" style="padding-bottom: 30px;">
	<div class="row">
	    <div class="twelve columns">
	        <div class="box_c">
	            <div class="box_c_heading cf">
	                <p>Departamentos</p>
	            </div>
	            <div class="box_c_content">
	                <div id="dt1_wrapper" class="dataTables_wrapper" role="grid">
	                <div id="dt1_length" class="dataTables_length">
	                </div>
	                <div class="dataTables_filter" id="dt1_filter">
	                	<button type="button" id="nuevo" class="button small nice blue radius">Nuevo</button>
	                	<script type="text/javascript">
	                		$("#nuevo").on("click", function(){
	                			window.location.href = "new.php";
	                		});
	                	</script>
	                	<label>Search: <input type="text" aria-controls="dt1"></label>
	               	</div>
	                <table cellpadding="0" cellspacing="0" border="0" class="display mobile_dt1 dt_act dataTable" id="dt1" aria-describedby="dt1_info">
                        <thead>
                            <tr role="row">
                            	<th class="essential sorting" role="columnheader">Pais</th>
                            	<th class="essential sorting_asc" role="columnheader" style="width: 35px; text-aling:center;" >#</th>
                            	<th class="essential sorting" role="columnheader" >Departamento</th>
                            	<th class="sorting" role="columnheader" tabindex="0" aria-controls="dt1" rowspan="1" colspan="1" aria-label="Population: activate to sort column ascending" style="width: 170px;">Estatus</th>
                            	<th style="width: 10px;"></th>
                            </tr>
                        </thead>
	                	<tbody role="alert" aria-live="polite" aria-relevant="all">
	                	<?php 
	                	
	                		$clase = "";
	                		
		                	$stmt = $db->prepare('select d.pais, d.id, d.descripcion as departamento, p.descripcion as nombre_pais, d.estatus from departamento d inner join pais p on p.id = d.pais order by p.descripcion asc, d.descripcion asc;');
		                	
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
		                	    <td class=""><?php echo $row["nombre_pais"]; ?></td>
	                            <td class=""><?php echo $row["id"]; ?></td>
	                            <td class=""><?php echo $row["departamento"]; ?></td>
	                            <td class=""><?php echo $row["estatus"]; ?></td> 
	                            <td class="" style="text-aling:center;"><a href="edit.php?Pais=<?php echo $row["pais"] ?>&Id=<?php echo $row["id"]; ?>">Editar</a></td>
	                            
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