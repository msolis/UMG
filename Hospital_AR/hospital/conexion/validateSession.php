<?php
	session_start();
	
	if( !isset($_SESSION['ru_username']) ){
		echo "La Session es no valida";
		header("Location: ../usuarios/index.php");
	}
?>