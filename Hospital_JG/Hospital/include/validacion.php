<?php
	session_start();
	if( !isset($_SESSION['inicio_hosp']) ){
		echo "La Session es no valida";
		header("Location: index.php");
	}
?>