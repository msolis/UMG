<?php
	include("../includes/head.php");
	include("../includes/menu.php");
?>
<div class="container" style="padding-bottom: 30px;">
	<div class="row">
	    <div class="twelve columns">
	        <div class="box_c">
	            <div class="box_c_heading cf box_actions">
	                <p>Usuarios</p>
	            	<span class="bAct_hide"><img src="../images/blank.gif" class="bAct_x" alt=""></span>
	            	<span class="bAct_toggle"><img src="../images/blank.gif" class="bAct_minus" alt=""></span>
	            </div>
	            <div class="box_c_content">
	                <div id="dt1_wrapper" class="dataTables_wrapper" role="grid">
	                <div id="dt1_length" class="dataTables_length"><label>Show
	                <select size="1" name="dt1_length" aria-controls="dt1">
		                <option value="10" selected="selected">10</option>
		                <option value="25">25</option>
		                <option value="50">50</option>
		                <option value="100">100</option>
	                </select> entries</label>
	                </div>
	                <div class="dataTables_filter" id="dt1_filter"><label>Search: <input type="text" aria-controls="dt1"></label></div><div style="clear:both;position:relative;top:5px" class="medium table_act"><a href="javascript:void(0)" class="delete_all_rows">Delete selected rows</a></div><table cellpadding="0" cellspacing="0" border="0" class="display mobile_dt1 dt_act dataTable" id="dt1" aria-describedby="dt1_info">
                        <thead>
                            <tr role="row">
                            	<th class="essential sorting_asc" role="columnheader" tabindex="0" aria-controls="dt1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 311px;">Name</th><th class="essential sorting" role="columnheader" tabindex="0" aria-controls="dt1" rowspan="1" colspan="1" aria-label="Capital: activate to sort column ascending" style="width: 206px;">Capital</th><th class="sorting" role="columnheader" tabindex="0" aria-controls="dt1" rowspan="1" colspan="1" aria-label="Population: activate to sort column ascending" style="width: 170px;">Population</th><th class="sorting" role="columnheader" tabindex="0" aria-controls="dt1" rowspan="1" colspan="1" aria-label="Area (km&lt;sup&gt;2&lt;/sup&gt;): activate to sort column ascending" style="width: 157px;">Area (km<sup>2</sup>)</th></tr>
                        </thead>
	                    
	                <tbody role="alert" aria-live="polite" aria-relevant="all">
	                		<tr class="odd">
	                            <td class=" sorting_1">Albania</td>
	                            <td class=" ">Tirana</td>
	                            <td class=" ">2,986,952</td>
	                            <td class=" ">28,748</td>
	                        </tr><tr class="even">
	                            <td class=" sorting_1">Andora</td>
	                            <td class=" ">Andorra la Vella</td>
	                            <td class=" ">84,525</td>
	                            <td class=" ">468</td>
	                        </tr><tr class="odd">
	                            <td class=" sorting_1">Armenia</td>
	                            <td class=" ">Yerevan</td>
	                            <td class=" ">2,966,802</td>
	                            <td class=" ">29,743</td>
	                        </tr>
					</tbody>
					</table>
					<div class="dataTables_info" id="dt1_info">Showing 1 to 9 of 9 entries</div>
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