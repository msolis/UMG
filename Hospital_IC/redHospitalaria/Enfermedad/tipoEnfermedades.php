<?php
include("../Conexion/conexionBD.php");
include("../includes/selectores.php");
include("../Conexion/valius.php");

 
 ?>
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        
                <title>Usuarios</title>
                                <link rel="stylesheet" href="../css/base.css">
                                <link rel="stylesheet" href="../css/skeleton.css">
                                <link rel="stylesheet" href="../css/layout.css">        
                                <link rel="stylesheet" href="../css/principal.css">
                                <link rel="stylesheet" href="../css/Boxusuarios.css">
</head>
<body>
<?php include("../includes/menu.php"); ?>
<table width="1000">
        <thead>
                <tr>
                        <th>Enfermedad</th>
                        <th>Nombre_Enfermedad</th>
                        <th>Tratamiento</th>    
                        
                        
                </tr>
        </thead>
        <tbody >
                <?php 
                        $query = "SELECT ENFERMEDAD, NOMBRE_ENFERMEDAD, TRATAMIENTO from enfermedad;";
                        #$query = "SELECT TIPO_CONSULTA, DESCRIPCION, ESTATUS from tipo_consulta;";
                        #$query = "SELECT CONSULTA, CONSULTA, FECHA_CONSULTA, FECHA_PROXIMA_CONSULTA, PACIENTE, TIPO_CONSULTA, ENFERMEDAD from consulta;";
                        $result = mysql_query($query);
                        while ($row = mysql_fetch_array($result, MYSQL_NUM)){

                        ?>              
                                <form>
                                <tr>
                                        <th><?php echo $row[0]; ?></th>
                                        <th><?php echo $row[1]; ?></th>
                                        <th><?php echo $row[2]; ?></th>
                                        <th>
                                                <a href="../Enfermedad/editEnfermedad.php?Id=<?php echo $row[0] ?>" style="color:white">Modificar</a>
                                        </th>
                                </tr>
                        </form>
                        
                        <?php
                        }
                        ?>

                </tbody>
        </table>
</body>
