<?php 

	$typeError = "";
	$textError = "";

	function alert($type, $text){
		
		
?>
	<div class="row" id="alerta">
        <div class="twelve columns">
            <div class="box_c">
                <div class="box_c_heading cf">
                    <p>Alerta</p>
                </div>
                <div class="box_c_content">
                    <div class="alert-box <?php echo $type; ?>">
                        <?php echo $text; ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
    	$("#alerta").delay(60000).slideUp(1000);
    </script>
 <?php 
	}
?>