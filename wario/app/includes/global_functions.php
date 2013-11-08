<?php 

	// function para crear selectores
	function newSelector($table_name, $value_name, $text_name, $where_qry, $selected_value){

	$db = new mysqli("localhost:3306", "root", "sa2010sa", "hospital");
	if ($db->connect_errno) {
		header("Location: ../Login/");
	}

	$qryselector = "select " . $value_name . ", " . $text_name . " from " . $table_name . " " . $where_qry;
	$stmt = $db->prepare($qryselector);
	$stmt->execute();
	$result = $stmt->get_result();

	$selected = "";
	while ($row = $result->fetch_assoc()) {
		if ($row[$value_name] == $selected_value){
			$selected = " selected ";
		}
		else{
			$selected = " ";
		}
		?>
			<option value="<?php echo $row[$value_name]; ?>" <?php echo $selected; ?>><?php echo $row[$text_name]; ?> </option>
		<?php 
		}
	}
?>