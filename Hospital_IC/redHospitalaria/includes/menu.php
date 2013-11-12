<?php
include("../Conexion/conexionBD.php");

?>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>Login</title>
				<link rel="stylesheet" href="../css/base.css">
				<link rel="stylesheet" href="../css/skeleton.css">
				<link rel="stylesheet" href="../css/layout.css">	
				<link rel="stylesheet" href="../css/principal.css">
				<link rel="stylesheet" href="../css/Boxusuarios.css">
</head>
<body>
<ul id="nav">
                <li class="current"><a href="../Principal/menu.php">Inicio</a></li>
                <li><a href="">Usuario</a>
                        <ul>
                                <li><a href="../Usuario/usuario.php">Usuarios</a><li>
                                <li><a href="../Usuario/newUsuario.php">Nuevo Usuario</a></li>
                        </ul>
                </li>
                <li><a href="#">Empleados</a>
                        <ul>
                                <li><a href="../Empleados/Empleados.php">Empleados</a></li>
                                <li><a href="../Empleados/newEmpleados.php">Nuevo Empleado</a></li>
                                <li><a href="../Empleados/asignacionEmpleado.php">Asignacion Empleado_Hospital</a></li>
                                <li><a href="../Empleados/listaEmpleados.php">Listado de Empleados</a></li>
                        </ul>
                 </li>
                <li><a href="#">Paciente</a>
                        <ul>
                                <li><a href="../Pacientes/Pacientes.php">Pacientes</a></li>
                                <li><a href="../Pacientes/newPaciente.php">Nuevo Paciente</a></li>
                                
                        </ul>
                </li>
                 <li><a href="#">Consulta</a>
                        <ul>
                                <li><a href="../Consultas/consultas.php">Consultas</a></li>
                                <li><a href="#">Tipos de Consultas</a>
                                         <ul>
                                         		<li><a href="../Consultas/tipoConsultas.php"><h6>Tipo Consulta</h6></a></li>
                                                <li><a href="../Consultas/newConsulta.php"><h6>Nueva Consulta</h6></a></li>
                                        </ul>       
                                </li>
                                 <li><a href="#">Enfermedades</a>
                                         <ul>
                                         		<li><a href="../Enfermedad/tipoEnfermedades.php"><h6>Tipos de Enfermedades</h6></a></li>
                                                <li><a href="../Consultas/newConsulta.php"><h6>Nueva Enfermedad</h6></a></li>
                                        </ul>       
                                </li>
                        </ul>
                </li>        
                <li><a href="#">Ingresos</a></li>
                <li><a href="#">Farmacias</a></li>
                
                <li><a href="#">Hospitales</a>
                		<ul>
                				<li><a href="../Hospitales/listaHospital.php">Lista Hospitales</a></li>
                                <li><a href="../Hospitales/newHospital.php">Nuevo Hospital</a></li>
                		</ul>
                </li>
                
                				 <li><a href="#">Tipos</a>
                        				<ul>
				                                <li><a href="#">Pais</a>
                                         <ul>
                                         		<li><a href="../Tipos/listaPais.php"><h6>Lista Pais</h6></a></li>
                                                <li><a href="../Tipos/newPais.php"><h6>Nuevo Pais</h6></a></li>
                                               
                                        </ul>       
                               	</li>
                                	 			<li><a href="#">Departamento</a>
                                        <ul>
                                         		<li><a href="../Tipos/listaDepartamento.php"><h6>Lista Departamento</h6></a></li>
                                                <li><a href="../Tipos/newDepartamento.php"><h6>Nuevo Departamento</h6></a></li>
                                        </ul>       
                                </li>
                                		<li><a href="#">Municipio</a>
                                        <ul>
                                         		<li><a href="../Tipos/listaMunicipio.php"><h6>Lista Municipio</h6></a></li>
                                                <li><a href="../Tipos/newMunicipio.php"><h6>Nuevo Municipio</h6></a></li>
                                        </ul>       
                                </li>
                                <li><a href="#">Titulo_Estudio</a>
                                         <ul>
                                         		<li><a href="../Tipos/listaTipo.php"><h6>Lista Titulos_Estudio</h6></a></li>
                                                <li><a href="../Tipos/newTipo.php"><h6>Nuevo Titulo</h6></a></li>
                                               
                                        </ul>       
                               	</li>
                               	<li><a href="#">Puestos</a>
                                         <ul>
                                         		<li><a href="../Tipos/listaPuesto.php"><h6>Lista de Puestos</h6></a></li>
                                                <li><a href="../Tipos/newPuesto.php"><h6>Nuevo Puesto</h6></a></li>
                                               
                                        </ul>       
                               	</li>
                                
                        </ul>
                </li> 
                
                
                <li><a href="../Login/salir.php">Salir</a></li>
</ul>
	</body>
</html>
