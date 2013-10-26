<?php
	session_start();
	if(!isset($_SESSION["hospital_user"])){
		header("Location: ../secure/");
	}
	else{
		
		$id_usuario = $_SESSION["hospital_user"];
		
		
	}
	 
?>