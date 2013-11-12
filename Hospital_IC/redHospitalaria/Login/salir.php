<?php
	session_start();
	$_SESSION["username"] = "";
	$_SESSION["hospital"] = "";
		
	session_destroy();
    header("location: ../Login/login.php")
?>