<?php include("../conexion/conexion.php"); ?>
<!DOCTYPE html>
<head>

<title>Listado de Usuarios</title>
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
  <span style="font-family:arial; color:#FF3399; font-size:42px;">
    <?php include("../includes/menu.php"); ?>
  </span> 
<div>
  <table>
    <tr>
      <td>#</td>
      <td>Usuario</td>
      <td>Hospital</td>
      <td></td>
    </tr>
    <?php
      $qry = "select u.idusuario, u.usuario, u.contrasena, h.nombre as nombre_hospital from usuario u inner join hospital h on u.hospital_idhospital = h.idhospital;";
      $result = mysql_query($qry);

      $rowCount = mysql_num_rows($result);

      while($row = mysql_fetch_array($result, MYSQL_BOTH))
      {
  ?>
    <tr>
        <td><?php echo $row["idusuario"]; ?></td>
        <td><?php echo $row["usuario"]; ?></td>
        <td><?php echo $row["nombre_hospital"]; ?></td>
        <td>
          <a href="editar.php?id=<?php echo $row["idusuario"]; ?>">Editar</a>
        </td>
    </tr>
  <?php
      }
    ?>
    

  </table>
  </div>
</body>

</html>