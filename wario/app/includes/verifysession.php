<?php
	session_start();
	$USER_CORPORATION = "";
	if(!isset($_SESSION["hospital_user"])){
		header("Location: ../secure/index.php?error=test");
	}
	else{
		$_SESSION["hospital_corporacion"];
		$USER_CORPORATION = $_SESSION["hospital_corporacion"];
		$USER_ID = $_SESSION["hospital_user"];
		
		
	}
	 
?>