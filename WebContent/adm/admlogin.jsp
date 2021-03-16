<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>COFFEE IN HOME</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Trabalho Senac">

<!-- Le styles -->
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css" />

<link href="css/login.css" rel="stylesheet">

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>

<style type="text/css">
body {
	background: url('images/FundoC.jpg');
	backgroud-repeat: no-repeat;
	background-size: 100%;
	background-attachment: fixed;
	background-position: center;
	padding-top: 30px;
}

pbfooter {
	position: relative;
}
</style>

<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

<!-- Google Fonts call. Font Used Open Sans & Raleway -->
<link href="http://fonts.googleapis.com/css?family=Raleway:400,300"
	rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Open+Sans"
	rel="stylesheet" type="text/css">

<!-- Jquery Validate Script -->
<script type="text/javascript" src="js/jquery.validate.js"></script>

<!-- Jquery Validate Script - Validation Fields -->


</head>

<style>
.pbfooter {
	position: relative;
}
</style>

<body>

	<!-- NAVIGATION MENU -->

	<div class="navbar-nav navbar-inverse navbar-fixed-top"
		style="height: 60px; padding-left: 20px;">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand"> COFFE IN HOME</a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="admlogin.html"><i
							class="icon-lock icon-white"></i> Login</a></li>
					<li><a href="cadastrar.jsp"><i
							class="icon-user icon-white"></i> Cadastro</a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-lg-offset-4 col-lg-4" style="margin-top: 100px">
				${msg }
				<div class="block-unit"
					style="text-align: center; padding: 8px 8px 8px 8px;">
					<img src="images/cafe2.jpg" alt="" class="img-circle"
						style="width: 90px; height: 70px;"> <br> <br>
					<form class="cmxform" id="signupForm" method="post"
						action="logar.html">
						<fieldset>
							<p>
								<input id="username" name="email" type="text"
									placeholder="Email"><br> <input id="password"
									name="senha" type="password" placeholder="Senha">
							</p>
							<input class="submit btn-success btn btn-large" type="submit"
								value="Login">
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>