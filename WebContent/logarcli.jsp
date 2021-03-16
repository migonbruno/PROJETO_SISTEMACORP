<jsp:include page="topo.jsp"></jsp:include>

<section id="banner-contato" class="inner_banner">
				<div class="dot1">
				</div>
</section>
<div class="container" style="margin-bottom: 10px">
	

	${msg }
	<h1 class="page-header">Login</h1>
	
	<form action="logarcli.html" class="form-group">
		<br> Digite o email :<br> <input type="text" name="email" id="email" class="form-control" /> <br> <br> Digite a
		Senha:<br> <input type="password" name="senha" id="senha" class="form-control" /> <br> <br> 
		<input type="submit" value="Logar" class="btn btn-primary" /> 
		<a href="carrinho.jsp"><input type="button" class="btn btn-danger" value="Carrinho"></a>
		<a href="cadastrarcli.jsp"><input type="button" value="Ainda não é cadastrado ?" class="btn btn-danger" /></a>
	</form>
</div>
<jsp:include page="rodape2.jsp"></jsp:include>