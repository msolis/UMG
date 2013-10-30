<?php 
	include("../includes/verifysession.php");
?>
<!doctype html public "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
<head>
	<meta charset="utf-8">
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
	<script src="../js/jquery.list.min.js"></script>
	<script src="../js/pertho.js"></script>
	

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
				//prth_gallery.init();
				//* home page charts resize
				//prth_charts.charts_resize();
				//* home page charts
				//prth_charts.ds_plot1();
				//prth_charts.ds_plot2();
				if(!jQuery.browser.mobile) {
					// create image from visible chart
					prth_charts.makeImage();
				}
				//* horizontal scrollable (charts)
				prth_h_scrollable.init();
						//replace themeforest iframe
			if(jQuery.browser.mobile) {
				if (top !== self) top.location.href = self.location.href;
			}
		});
	</script>
</head>
<body class="ptrn_a grdnt_a mhover_a" style="min-height: 100%;">

	<header>
		<div class="container head_s_a">