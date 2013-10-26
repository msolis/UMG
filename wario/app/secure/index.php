<!doctype html public "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
<head>
	<title>Hospital</title>

	<style type="text/css">
	</style>
	<link rel="stylesheet" type="text/css" href="../css/foundation.css">
	<link rel="stylesheet" type="text/css" href="../css/style.css">
	
	<script src="../js/jquery.min.js"></script>
	<script src="../js/s_scripts.js"></script>
    <script src="../js/jquery.validate.min.js"></script>
	<script>

	$(document).on("ready", function(){
		$(".sl_link").click(function(event){
			$('.l_pane').slideToggle('normal').toggleClass('dn');
			$('.sl_link,.lb_ribbon').children('span').toggle();
			event.preventDefault();
		});

		$("#l_form").validate({
			highlight: function(element) {
				$(element).closest('.elVal').addClass("form-field error");
			},
			unhighlight: function(element) {
				$(element).closest('.elVal').removeClass("form-field error");
			},
			rules: {
				username: "required",
				password: "required"
			},
			messages: {
				username: "Please enter your username (type anything)",
				password: "Please enter a password (type anything)"
			},
			errorPlacement: function(error, element) {
				error.appendTo( element.closest(".elVal") );
			}
		});

		$("#rp_form").validate({
			highlight: function(element) {
				$(element).closest('.elVal').addClass("form-field error");
			},
			unhighlight: function(element) {
				$(element).closest('.elVal').removeClass("form-field error");
			},
			rules: {
				upname: {
					required: true,
					email: true
				}
			},
			messages: {
				upname: "Please enter a valid email address"
			},
			errorPlacement: function(error, element) {
				error.appendTo( element.closest(".elVal") );
			}
		});
		
		if(jQuery.browser.mobile) {
			if (top !== self) top.location.href = self.location.href;
		}
	});
	</script>
	
</head>
<body class="ptrn_a grdnt_a mhover_a" style="min-height: 100%;">

	<header>
		<div class="container head_s_a">
			<div class="row">
            <div class="eight columns centered">
                <div class="login_box">
                    <div class="lb_content">
                        <div class="login_logo"><img src="../images/logo.png" alt=""></div>
                        <div class="cf">
                            <h2 class="lb_ribbon lb_blue"><span>Iniciar Session</span></h2>
							<a href="#" class="right small sl_link">
								<span>¿Olvidaste tu clave?</span>
								<span style="display:none">Back to login form</span>
							</a>
					    </div>
                        <div class="row m_cont">
                            <div class="eight columns centered">
                                <div class="l_pane">
									<form action="login.php" method="post" class="nice" id="l_form" novalidate="novalidate">
										<div class="sepH_c">
											<div class="elVal">
												<label for="usuario">Usuario:</label>
												<input type="text" id="usuario" value="" placeholder="Usuario" name="usuario" class="oversize expand input-text">
											</div>
											<div class="elVal">
												<label for="clave">Clave</label>
												<input type="password" id="clave" value="" placeholder="Clave" name="clave" class="oversize expand input-text">
											</div>
										</div>
										<div class="cf">
											<label for="remember" class="left"><input type="checkbox" id="remember">Recordar mis Datos</label>
											<input type="submit" class="button small radius right black" value="Ingresar">
										</div>
									</form>
								</div>
								<div class="l_pane" style="display:none">
									<form action="index.php" method="post" class="nice" id="rp_form" novalidate="novalidate">
										<div class="sepH_c">
											<p class="sepH_b">Please enter your email address. You will receive a link to create a new password via email.</p>
											<div class="elVal">
												<label for="upname">E-mail:</label>
												<input type="text" id="upname" name="upname" class="oversize expand input-text">
											</div>
										</div>
										<div class="cf">
											<input type="submit" class="button small radius right black" value="Get new password">
										</div>
									</form>
								</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		</div>
	</header>
	<footer class="container" id="footer" style="margin-top: -30px; height: 30px; width: 96%; padding: 0px 2%; position: absolute; bottom: 0px;">
        <div class="row">
            <div class="twelve columns">
            </div>
        </div>
	</footer>
</body>
</html>