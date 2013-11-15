<?php 
	$qryInfoUser = "select correo, nombre, imagen from usuario WHERE corporacion = ? and id = ?;";
	$stmt = $db->prepare($qryInfoUser);
	$stmt->bind_param('ii', $USER_ID, $USER_CORPORATION);
	
	$stmt->execute();
	$rowArray = mysqli_fetch_array($stmt->get_result());
	
	$USER_CORREO = $rowArray[0];
	$USER_NAME = $rowArray[1];
	$USER_IMAGE_PATH = "../data/usuarios/" . $rowArray[2];
	
	
?>
<div class="row sepH_b">
	<div class="six columns">
		<div class="row">
            <div class="five phone-two columns">
				<div id="logo">
					<img src="../images/logo.png" alt="Pertho Admin">
				</div>
			</div>
			<div class="seven phone-two columns">
			</div>
        </div>
	</div>
	<div class="six columns">
		<div class="user_box cf">
			<div class="user_avatar">
				<img src="<?php echo $USER_IMAGE_PATH; ?>" alt="">
			</div>
			<div class="user_info user_sep">
				<p class="sepH_a">
					<strong><?php echo $USER_NAME; ?></strong>
				</p>
				<span>
					<a href="../users/settings.php" class="sep">Configuración</a>
					<a href="../secure/logout.php">Salir</a>
				</span>
			</div>
			<div class="ntf_bar user_sep">
				<a href="#ntf_mail_panel" class="ntf_item" style="background-image: url(../images/32-Mail.png)">
	                <span class="ntf_tip ntf_tip_red"><span>12</span></span>
				</a>
				<a href="#ntf_tickets_panel" class="ntf_item" style="background-image: url(../images/32-Day-Calendar.png)">
					<span class="ntf_tip ntf_tip_red"><span>122</span></span>
				</a>
				<a href="#ntf_comments_panel" class="ntf_item" style="background-image: url(../images/32-Speech-Bubble.png)">
					<span class="ntf_tip ntf_tip_blue"><span>8</span></span>
				</a>
			</div>
		</div>
	</div>
</div>


<div class="row">
    <div class="twelve columns">
        <nav id="smoothmenu_h" class="ddsmoothmenu">
            <ul class="cf l_tinynav1">
                <li style="z-index: 99;">
                    <a href="" class="mb_parent" style="padding-right: 23px;">Medicos<img src="../images/blank.gif" class="downarrowclass" style="border:0;"></a>
                    <ul style="top: 32px; visibility: visible; left: 0px; width: 146px; display: none;">
                        <li><a href="../medicos/new.php">Creación de Medicos</a></li>
                        <li><a href="../medicos/">Lista de Medicos</a></li>
                    </ul>
                </li>
                <li style="z-index: 99;">
                    <a href="" class="mb_parent" style="padding-right: 23px;">Usuarios<img src="../images/blank.gif" class="downarrowclass" style="border:0;"></a>
                    <ul style="top: 32px; visibility: visible; left: 0px; width: 146px; display: none;">
                        <li><a href="../users/new.php">Creación de Usuarios</a></li>
                        <li><a href="../users/">Lista de Usuarios</a></li>
                    </ul>
                </li>
                 <li style="z-index: 99;">
                    <a href="" class="mb_parent" style="padding-right: 23px;">Proveedores<img src="../images/blank.gif" class="downarrowclass" style="border:0;"></a>
                    <ul style="top: 32px; visibility: visible; left: 0px; width: 146px; display: none;">
                        <li><a href="../proveedores/new.php">Crear Proveedores</a></li>
                        <li><a href="../proveedores/">Lista de Proveedores</a></li>
                    </ul>
                </li>
                <li style="z-index: 99;">
                    <a href="" class="mb_parent" style="padding-right: 23px;">Clientes<img src="../images/blank.gif" class="downarrowclass" style="border:0;"></a>
                    <ul style="top: 32px; visibility: visible; left: 0px; width: 146px; display: none;">
                        <li><a href="../clientes/new.php">Crear Cliente</a></li>
                        <li><a href="../clientes/">Lista de Clientes</a></li>
                    </ul>
                </li>
                <li style="z-index: 99;">
                    <a href="" class="mb_parent" style="padding-right: 23px;">Paises<img src="../images/blank.gif" class="downarrowclass" style="border:0;"></a>
                    <ul style="top: 32px; visibility: visible; left: 0px; width: 146px; display: none;">
                        <li><a href="../pais/new.php">Crear Pais</a></li>
                        <li><a href="../pais/">Lista de Paises</a></li>
                    </ul>
                </li>
                <li style="z-index: 99;">
                    <a href="" class="mb_parent" style="padding-right: 23px;">Hospitales<img src="../images/blank.gif" class="downarrowclass" style="border:0;"></a>
                    <ul style="top: 32px; visibility: visible; left: 0px; width: 146px; display: none;">
                        <li><a href="../hospital/new.php">Crear Hospital</a></li>
                        <li><a href="../hospital/">Lista de Hospitales</a></li>
                    </ul>
                     <li style="z-index: 99;">
                    <a href="" class="mb_parent" style="padding-right: 23px;">Departamentos<img src="../images/blank.gif" class="downarrowclass" style="border:0;"></a>
                    <ul style="top: 32px; visibility: visible; left: 0px; width: 146px; display: none;">
                        <li><a href="../departamento/new.php">Crear Departamento</a></li>
                        <li><a href="../departamento/">Lista de Departamentos</a></li>
                    </ul>
                </li>
                <li style="z-index: 99;">
                    <a href="" class="mb_parent" style="padding-right: 23px;">Enfermedades<img src="../images/blank.gif" class="downarrowclass" style="border:0;"></a>
                    <ul style="top: 32px; visibility: visible; left: 0px; width: 146px; display: none;">
                        <li><a href="../enfermedades/new.php">Crear Enfermedad</a></li>
                        <li><a href="../enfermedades/">Lista de Enfermedades</a></li>
                    </ul>
                </li>
                <li style="z-index: 99;">
                    <a href="" class="mb_parent" style="padding-right: 23px;">Especialidad Medicas<img src="../images/blank.gif" class="downarrowclass" style="border:0;"></a>
                    <ul style="top: 32px; visibility: visible; left: 0px; width: 146px; display: none;">
                        <li><a href="../especialidad/new.php">Crear Especialidad</a></li>
                        <li><a href="../especialidad/">Especialidades de Medicos</a></li>
                    </ul>
                </li>
                <li style="z-index: 99;">
                    <a href="" class="mb_parent" style="padding-right: 23px;">Sintomas<img src="../images/blank.gif" class="downarrowclass" style="border:0;"></a>
                    <ul style="top: 32px; visibility: visible; left: 0px; width: 146px; display: none;">
                        <li><a href="../sintoma/new.php">Crear Sintoma</a></li>
                        <li><a href="../sintoma/">Listado de Sintomas</a></li>
                    </ul>
                </li>
                <li style="z-index: 99;">
                    <a class="mb_parent" style="padding-right: 23px;">Pacientes<img src="../images/blank.gif" class="downarrowclass" style="border:0;"></a>
                    <ul style="top: 32px; visibility: visible; left: 0px; width: 146px; display: none;">
                        <li><a href="../pacientes/new.php">Crear Paciente</a></li>
                        <li><a href="../pacientes/">Listado de Pacientes</a></li>
                    </ul>
                </li>
                <li style="z-index: 99;">
                    <a class="mb_parent" style="padding-right: 23px;">Tipo de Consultas<img src="../images/blank.gif" class="downarrowclass" style="border:0;"></a>
                    <ul style="top: 32px; visibility: visible; left: 0px; width: 146px; display: none;">
                        <li><a href="../tipo consulta/new.php">Crear Tipo de Consulta</a></li>
                        <li><a href="../tipo consulta/">Listado de Tipos de Consultas</a></li>
                    </ul>
                </li>
                <li style="z-index: 99;">
                    <a href="../corporation/view.php" class="mb_parent" style="padding-right: 23px;">Corporacion<img src="../images/blank.gif" class="downarrowclass" style="border:0;"></a>
                </li>
                <li style="z-index: 97;">
                    <a href="" class="mb_parent" style="padding-right: 23px;">Configuraciones<img src="../images/blank.gif" class="downarrowclass" style="border:0;"></a>
                    <ul style="top: 32px; visibility: visible; left: 0px; width: 146px; display: none;">
                        <li><a href="../settings/index_pais.php">Paises</a></li>
                    </ul>
                </li>
                <li style="z-index: 96;">
                    <a href="" class="mb_parent" style="padding-right: 23px;">Confuraciones<img src="../images/blank.gif" class="downarrowclass" style="border:0;"></a>
                    <ul style="top: 32px; visibility: visible; left: 0px; width: 146px; display: none;">
                        <li><a href="index.php?uid=1&amp;page=nav_sticky">Paises</a></li>
                        <li><a href="index.php?uid=1&amp;page=nav_sticky_center">Sticky centered navigation</a></li>
                        <li><a href="index.php?uid=1&amp;page=nav_sidebar">Sidebar navigation</a></li>
                    </ul>
                </li>
                <li style="z-index: 95;">
                    <a href="" class="mb_parent" style="padding-right: 23px;">Error Pages<img src="../images/blank.gif" class="downarrowclass" style="border:0;"></a>
                    <ul style="display: none; top: 32px; visibility: visible;">
                        <li><a href="index.php?uid=1&amp;page=error_401">401</a></li>
                        <li><a href="index.php?uid=1&amp;page=error_403">403</a></li>
                        <li><a href="index.php?uid=1&amp;page=error_404">404</a></li>
                        <li><a href="index.php?uid=1&amp;page=error_500">500</a></li>
                        <li><a href="index.php?uid=1&amp;page=error_503">503</a></li>
                        <li><a href="index.php?uid=1&amp;page=error_unexpected">Unexpected error</a></li>
                    </ul>
                </li>
                <li style="z-index: 94;">
                    <a href="" class="mb_parent" style="padding-right: 23px;">Sub-levels<img src="../images/blank.gif" class="downarrowclass" style="border:0;"></a>
                    <ul style="display: none; top: 32px; visibility: visible;">
                        <li style="z-index: 93;">
                            <a href="#">First level<img src="../images/blank.gif" class="rightarrowclass" style="border:0;"></a>
                            <ul style="display: none; top: 0px; visibility: visible;">
                                <li style="z-index: 92;">
                                    <a href="#">Second level<img src="../images/blank.gif" class="rightarrowclass" style="border:0;"></a>
                                    <ul style="display: none; top: 0px; visibility: visible;">
                                        <li><a href="#">Third level</a></li>
                                        <li><a href="#">Third level</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">Second level</a></li>
                            </ul>
                        </li>
                        <li><a href="#">First level</a></li>
                        <li><a href="#">First level</a></li>
                        <li><a href="#">First level</a></li>
                    </ul>
                </li>
                <li>
                    <a href="index.php?uid=1&amp;page=documentation" class="mb_parent">Documentation</a>
                </li>
            </ul>
            <select class="tinynav tinynav1">
                <option>-- Menu --</option>
				<option value="../medicos/">Medicos</option>
				<option value="../users/">Usuarios</option>
				<option value="../clientes/">Clientes</option>
				<option value="../pais/">Paises</option>
				<option value="../hospital/">Hospitales</option>
				<option value="../departamento/">Departamentos</option>
				<option value="../enfermedades/">Enfermedades</option>
				<option value="../especialidad/">Especialidad</option>
				<option value="../sintomas/">Sintomas</option>
            </select>
            <script type="text/javascript">
			$(document).on("ready", function(){
				$("#menunavegacion").on("change", function(){
					window.location.href=$(this).val();
				});
			});
			</script>
			            
        </nav>
        <!--ul id="breadcrumbs" class="cf">
            <li>You are here:</li>
            <li><a href="#">Content</a></li>
            <li><a href="#">Article</a></li>
            <li><span>Lorem Ipsum...</span></li>
        </ul -->
    </div>
</div>
</header>
