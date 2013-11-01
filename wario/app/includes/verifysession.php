<?php
	session_start();
	
	if(!isset($_SESSION["hospital_user"])){
		header("Location: ../secure/");
	}
	else{
		
		$USER_CORPORATION = $_SESSION["hospital_corporacion"];
		$USER_ID = $_SESSION["hospital_user"];
		
		
	}
	 
?>