<?php
	$image_name = $_POST["name_image"];
	$allowedExts = array("gif", "jpeg", "jpg", "png");
	$temp = explode(".", $_FILES["file"]["name"]);
	$extension = end($temp);
	if ((($_FILES["file"]["type"] == "image/gif")
			|| ($_FILES["file"]["type"] == "image/jpeg")
			|| ($_FILES["file"]["type"] == "image/jpg")
			|| ($_FILES["file"]["type"] == "image/pjpeg")
			|| ($_FILES["file"]["type"] == "image/x-png")
			|| ($_FILES["file"]["type"] == "image/png"))
			&& ($_FILES["file"]["size"] < 200000)
			&& in_array($extension, $allowedExts))
	{
		if ($_FILES["file"]["error"] > 0)
		{
			echo "Return Code: " . $_FILES["file"]["error"] . "<br>";
		}
		else
		{
			echo "Upload: " . $_FILES["file"]["name"] . "<br>";
			echo "Type: " . $_FILES["file"]["type"] . "<br>";
			echo "Size: " . ($_FILES["file"]["size"] / 1024) . " kB<br>";
			echo "Temp file: " . $_FILES["file"]["tmp_name"] . "<br>";
			/*if (file_exists("../data/" . $_POST["folder"] . "/" . $image_name))
			{
				echo $_FILES["file"]["name"] . " already exists. ";
			}
			else
			{*/
				chmod("../data/" . $_POST["folder"] . "/" . $image_name, 0755);
				move_uploaded_file($_FILES["file"]["tmp_name"],
				"../data/" . $_POST["folder"] . "/" . $image_name);
				
				echo "Stored in: " . "../data/" . $_POST["folder"] . "/" .  $image_name;
			//}
				//header("Location: " . $_POST["redirect_to"]);
		}
	}
	else
	{
		echo "Invalid file";
		//header("Location: " . $_POST["redirect_to"] . "?error=No se pudo guardar la imagen");
	}
	
	
?>