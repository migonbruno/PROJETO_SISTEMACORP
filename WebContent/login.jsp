<jsp:include page="topo.jsp"></jsp:include>


<h3 class="page-header">Login Funcionários</h3>

${msg }

<form action="logar.html" class="form-group">
	<br> Digite o email :<br> <input type="text"
		name="email" id="email" class="form-control" /> <br>
	<br> Digite a senha :<br> <input type="password"
		name="senha" id="senha" class="form-control" /> <br>
	<br> 
	<input type="submit" value="Logar" class="btn btn-primary"/>
	<input type="reset" value="Limpar Dados" class="btn btn-danger"/>
</form>

<jsp:include page="rodape2.jsp"></jsp:include>