<?php 
	include("../includes/verifysession.php");
	include("../includes/conexion.php");
	include("../includes/alerts.php");
	include("../includes/global_functions.php");
?>
<!doctype html>

<html lang="es">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Hospital</title>

	<style type="text/css">
	</style>
	<link rel="stylesheet" type="text/css" href="../css/foundation.css">
	<link rel="stylesheet" type="text/css" href="../css/style.css">
	
	<script src="../js/jquery.min.js"></script>
	<script src="../js/s_scripts.js"></script>
    <script src="../js/jquery.validate.min.js"></script>

	
	<!-- Foundation framework -->
		<link rel="stylesheet" href="../css/foundation.css">
	<!-- jquery UI -->
		<link rel="stylesheet" href="../css/Aristo.css" media="all">
	<!-- jQplot (charts) -->
		<link rel="stylesheet" href="../css/jquery.jqplot.css" media="all">
	<!-- fancybox -->
		<link rel="stylesheet" href="../css/jquery.fancybox-1.3.4.css" media="all">
	<!-- colorpicker -->
		<link rel="stylesheet" href="../css/colorpicker.css" media="all">
	<!-- fullcalendar -->
		<link rel="stylesheet" href="../css/fullcalendar.css" media="all">
	<!-- plupload -->
		<link rel="stylesheet" href="../css/jquery.plupload.queue.css" media="all">
	<!-- datatables -->
		<link rel="stylesheet" href="../css/demo_table_jui.css" media="all">
	<!-- file manager -->
		<link rel="stylesheet" href="../css/elfinder.min.css" media="all">
	<!-- chosen (select element extended) -->
		<link rel="stylesheet" href="../css/chosen.css" media="all">
    <!-- ibuttons -->
		<link rel="stylesheet" href="../css/jquery.ibutton.css" media="all">
	<!-- tag handler -->
		<link rel="stylesheet" href="../css/jquery.taghandler.css" media="all">
	<!-- tooltips -->
		<link rel="stylesheet" href="../css/jquery.qtip.min.css">
	<!-- syntax highlighter -->
		<link rel="stylesheet" href="../css/shCoreDefault.css">
	
	<!-- main styles -->
		<link rel="stylesheet" href="../css/style.css">

	<!-- Google fonts -->
		<link href="http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300" rel="stylesheet">
		<link href="http://fonts.googleapis.com/css?family=Terminal+Dosis" rel="stylesheet">

	<!-- Favicons and the like (avoid using transparent .png) -->
		<link rel="shortcut icon" href="favicon.ico">
		<link rel="apple-touch-icon-precomposed" href="icon.png">

	<!--[if lt IE 8]>
		<link rel="stylesheet" href="../css/ie.css" />
	<![endif]-->
	<!--[if lt IE 9]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<script src="../js/excanvas.min.js"></script>
	<![endif]-->
		
	<script src="../js/s_scripts.js"></script>
	<script src="../js/jquery-ui-1.8.18.custom.min.js"></script>
	<script src="../js/jquery.ui.extend.js"></script>
	<script src="../js/jquery.qtip.min.js"></script>
	<script src="../js/jquery.jqplot.min.js"></script>
	<script src="../js/jqplot.plugins.js"></script>
	<script src="../js/fullcalendar.min.js"></script>
	<script src="../js/pertho.js"></script>
	<script src="../js/ui.spinner.js"></script>
	
	<script src="../js/jquery.rwd-table.js"></script>
	<script src="../js/jquery.dataTables.min.js"></script>
	<script src="../js/dataTables.plugins.js"></script>
	<script src="../js/ColVis.min.js"></script>
	<script src="../js/jquery.stepy.min.js"></script>
	
	
	
	

	<script>
		$(document).on("ready", function() {
                //* common functions
				prth_common.init();
                
				//* nested accordion
				//prth_nested_accordion.init();
				//clear form
				//prth_clearForm.init();
							//* full calendar
				//prth_calendar.init();
				//* filterable list
				//prth_flist.init();
				//* smart gallery
				prth_gallery.init();
				//* home page charts resize
				//prth_charts.charts_resize();
				//* home page charts
				//prth_charts.ds_plot1();
				//prth_charts.ds_plot2();
				prth_datatable.dt1();
				prth_datatable.dt2();
				prth_datatable.ct();
				//prth_datatable.dt_actions();
				prth_datatable.dte_1();
				prth_datatable.dte_2();

				prth_wizard.simple();
				prth_wizard.validation();
				prth_wizard.steps_nb();
				
			
				//* horizontal scrollable (charts)
				prth_h_scrollable.init();
						//replace themeforest iframe
			if(jQuery.browser.mobile) {
				if (top !== self) top.location.href = self.location.href;
			}

			$(".bAct_toggle").on("click", function(){
				$(this).parent().parent().find(".box_c_content").slideToggle();
				$(this).find("img").toggleClass(function() {
					  if ( $( this ).is( ".bAct_minus" ) ) {
						    return "bAct_plus";
						  } else {
						    return "bAct_minus";
						  }
						});
			});
		});
	</script>
</head>
<body class="ptrn_a grdnt_a mhover_a" style="min-height: 100%;">

	<header>
		<div class="container head_s_a">