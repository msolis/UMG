<?php
	session_start();
	if( !isset($_SESSION['admin']) ){
		echo "La Session es no valida";
		header("Location: ../menu2.php");
	}
?>