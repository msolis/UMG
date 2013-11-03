<?php
include("../Conexion/conexionBD.php");

?>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>Login</title>
	
				<link rel="stylesheet" href="../css/base.css">
				<link rel="stylesheet" href="../css/skeleton.css">
				<link rel="stylesheet" href="../css/layout.css">	
				<link rel="stylesheet" href="../css/principal.css">
</head>
<body>
	<?php

        if (isset($_POST["nombre"])){
            $username = $_POST["nombre"];
            $password = $_POST["CLAVE"];

            if (($password !="") && ($username !=""))
            {
                
                $result = mysql_query ("SELECT nombre, clave, status, hospital  from redHospitalaria.usuario where nombre = '".$username."' and clave = '".$password."';");
                
                
                if ($result == 0)
                    echo "Ha ocurrido un error" . mysql_error();
                else{

                    $row_array = mysql_fetch_array($result);

                    $row_count = mysql_num_rows($result);

                    if ($row_count == 0){
                        header("Location: login.php");
                    }
                    else{
                        $nombre = $row_array[0];
                        $clave= $row_array[1];
                        $status = $row_array[2];
                        $uhospital = $row_array[3];
                        if ($status == "A"){

                            session_start();

                            $_SESSION ["username"] = $username;
                            $_SESSION ["datos_personales"] = $udatosPersonales;
                            $_SESSION ["hospital"] = $uhospital;
                        
                            header("Location: ../Principal/menu.php");
                        
                        }
                        else{
                            echo "El usuario esta de Baja Estatus = " . $status;
                        }
                    }
                }
            }
        }

    ?>
<div class="container">
	<div class="form-bg">
			<from method="POST">
				<h2>USUARIO</h2>
					<p><imput name = "nombre" type= "text" placeholder= "Usuario" required =""></p>
					<p><imput name = "CLAVE" type = "password" placeholder= Password" requiered= ""></p>
					<button type = "submit"></button>
					</from>
	</div>
</div>
</body>
</html>