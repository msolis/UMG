<?php  // include("../conexion/validateSession.php") //?>
<html>
<head>
  <title>Menu Usuario</title>
 <style type="text/css">
  body {
    padding-left: 11em;
    font-family: Georgia, "Times New Roman",
          Times, serif;
    color: purple;
    background-color: #ADD8E6 }
  ul.navbar {
    list-style-type: none;
    padding: 0;
    margin: 0;
    position: absolute;
    top: 2em;
    left: 1em;
    width: 9em }  
  h1 {
    font-family: Helvetica, Geneva, Arial,
          SunSans-Regular, sans-serif }
  ul.navbar li {
    background: white;
    margin: 0.5em 0;
    padding: 0.3em;
    border-right: 1em solid black }
  ul.navbar a {
    text-decoration: none }
  a:link {
    color: blue }
  a:visited {
    color: purple }
  address {
    margin-top: 1em;
    padding-top: 1em;
    border-top: thin dotted }
  </style>
</head>

<body>

<?
    if(isset($_POST['Usuario'])){
      
      $id = $_POST['idUsuario'];
      $Usuario = $_POST['Usuario'];
      $Contrasena = $_POST['Contrasena'];
      $Hospital = $_POST['Hospital'];
      $estatus = $_POST['estatus'];
      


      include  "../includes/conexion.php";
      $qry = "select max(idUsuario)+1 as id from Usuario;";
      $result = mysql_query($qry);
      $rowarray = mysql_fetch_array($result);

      $id = $rowarray["id"];
      $insert = "insert into usuario (idUsuario, Usuario, Contrasena, Hospital_idhospital)";
      $insert .= " values ($id,'$Usuario', '$Contrasena', '$Hospital')";

      $result = mysql_query($insert) or die(mysql_error());

      if ($result == true){

        echo "<script>alert('Usuario ingresado con exito');</script>";  

      }

      else{

        echo "<script>alert('Intente de nuevo');</script>";
      }




    }


?>

<form action="Usuario.php" method="POST">
<table>
<tr><td>Usuario:</td> <td><input type="text" name="Usuario" /></td></tr>
<tr><td>Contrasena:</td><td> <input type="text" name="Contrasena" /></td></tr>
<tr><td>Hospital:</td> <td><input type="text" name="Hospital" /></td></tr>
<tr><td>estatus:</td><td> <input type="text" name="estatus" /></td></tr>
</table>

<input type="submit" value ="iniciar" name="iniciar"/><br>
<a href="../menu/menuu.php"> regresar a menu </a>

</td>
</tr>

</form>

</body>

</html>
