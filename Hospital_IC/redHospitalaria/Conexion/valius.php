<?php
	session_start();
		if( !isset($_SESSION['username']) ){
		echo "La Session es no valida";
		header("Location: ../Login/login.php");
	}
?>