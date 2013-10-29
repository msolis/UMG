<?php
	session_start();
	$_SESSION["hospital_user"] = ""; 
	session_destroy();
	header("Location: index.php");
?>