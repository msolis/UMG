<?php
include("../Conexion/conexionBD.php");

?>
<!doctype html>
<html lang="en">
<head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
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
			$contra= md5($password);
            
            if (($password !="") && ($username !=""))
            {
                
                $result = mysql_query ("select nombre, clave, status, hospital  from redhospitalaria.usuario where nombre = '".$username."' and clave = '".$contra."';");
                
                
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
                        <form method="POST">
                                <h2>USUARIO</h2>
                                <p><input name ="nombre" type="text" placeholder="Usuario" required=""></p>
                                <p><input name = "CLAVE" type="password" placeholder="Password" required=""></p>
                                
                                <button type="submit"></button>
                        </form>
                        
                </div>
        </div>
        
</body>
</html>