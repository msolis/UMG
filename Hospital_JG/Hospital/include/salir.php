<?php
	session_start();
	//$_SESSION["ot_username"] = "";
	session_destroy();
	header("Location: ../index.php");

?>

