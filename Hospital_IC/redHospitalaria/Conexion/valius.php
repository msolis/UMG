<?php
	session_start();
	if( !isset($_SESSION['iher_username']) ){
		echo "La Session es no valida";
		header("Location: ../Login/Login.php");
	}
?>