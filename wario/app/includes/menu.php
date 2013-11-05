<?php 
	$qryInfoUser = "select Correo, Nombre, Imagen from USUARIO WHERE Corporacion = ? and Id = ?;";
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
                <option>-- Navigation --</option>
                <option value="">Dashboard</option>
                <option value="index.php?uid=1&amp;page=dashboard">Regular</option>
                <option value="index.php?uid=1&amp;page=dashboard_drag">Drag&amp;Drop</option>
                <option value="">Forms</option>
                <option value="index.php?uid=1&amp;page=form_elements">Form elements</option>
                <option value="index.php?uid=1&amp;page=form_extended">Form elements (extended)</option>
                <option value="index.php?uid=1&amp;page=form_validation">Form validation</option>
                <option value="index.php?uid=1&amp;page=form_example">Form example</option>
                <option value="">UI Elements</option>
                <option value="index.php?uid=1&amp;page=ui_alertbox_btn_ico_tip">Alerts, Buttons, Icons, Tooltips</option>
                <option value="index.php?uid=1&amp;page=ui_gallery">Gallery</option>
                <option value="index.php?uid=1&amp;page=ui_grid">Grid</option>
                <option value="index.php?uid=1&amp;page=ui_pricingtable">Pricing Table</option>
                <option value="index.php?uid=1&amp;page=ui_scrollable">Scrollable</option>
                <option value="index.php?uid=1&amp;page=ui_sidebar">Sidebar</option>
                <option value="index.php?uid=1&amp;page=search_page">Search Page</option>
                <option value="index.php?uid=1&amp;page=ui_tabs">Tabs / Accordion</option>
                <option value="index.php?uid=1&amp;page=ui_typography">Typography</option>
                <option value="index.php?uid=1&amp;page=ui_widgets">Widgets</option>
                <option value="">Plugins</option>
                <option value="index.php?uid=1&amp;page=plugin_charts">Charts</option>
                <option value="index.php?uid=1&amp;page=plugin_tables">Data tables</option>
                <option value="index.php?uid=1&amp;page=plugin_explorer">File explorer</option>
                <option value="index.php?uid=1&amp;page=plugin_help">Help/Faq</option>
                <option value="index.php?uid=1&amp;page=plugin_dialogs">Dialog boxes/Notifications</option>
                <option value="index.php?uid=1&amp;page=plugin_wizard">Wizard</option>
                <option value="">Navigation</option>
                <option value="index.php?uid=1&amp;page=nav_sticky">Sticky navigation</option>
                <option value="index.php?uid=1&amp;page=nav_sticky_center">Sticky centered navigation</option>
                <option value="index.php?uid=1&amp;page=nav_sidebar">Sidebar navigation</option>
                <option value="">Error Pages</option>
                <option value="index.php?uid=1&amp;page=error_401">401</option>
                <option value="index.php?uid=1&amp;page=error_403">403</option>
                <option value="index.php?uid=1&amp;page=error_404">404</option>
                <option value="index.php?uid=1&amp;page=error_500">500</option>
                <option value="index.php?uid=1&amp;page=error_503">503</option>
                <option value="index.php?uid=1&amp;page=error_unexpected">Unexpected error</option>
                <option value="">Sub-levels</option>
                <option value="#">First level</option>
                <option value="#">Second level</option>
                <option value="#">Third level</option>
                <option value="#">Third level</option>
                <option value="#">Second level</option>
                <option value="#">First level</option>
                <option value="#">First level</option>
                <option value="#">First level</option>
                <option value="index.php?uid=1&amp;page=documentation">Documentation</option>
            </select>
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
