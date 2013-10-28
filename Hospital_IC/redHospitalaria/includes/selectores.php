<?php
	function nuevoSelector($nombre_id, $nombre_descripcion, $nombre_tabla, $valor_seleccionado){
		$qry = "SELECT " . $nombre_id . ", " . $nombre_descripcion . " from redhospitalaria." . $nombre_tabla . ";";
		$result = mysql_query($qry);
		while ($row = mysql_fetch_array($result, MYSQL_NUM)){
			
			if ($valor_seleccionado == $row[0]){
?>
		<option selected value= "<?php echo $row[0]; ?>"><?php echo $row[1]; ?>

<?php
			}
			else
			{
?>
		<option value= "<?php echo $row[0]; ?>"><?php echo $row[1]; ?>
<?php			
			}
		}
	}
?>