<?php
	//$db = mysql_connect("localhost:3306", "root", "sa2010sa");
	//mysql_select_db("hospital");
	$db = new mysqli("localhost:3306", "root", "sa2010sa", "hospital");
	if ($db->connect_errno) {
		header("Location: ../Login/");
	}
	
	
	
?>