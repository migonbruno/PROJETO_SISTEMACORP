<jsp:include page="topo.jsp"></jsp:include>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	
<c:if test="${f == null }">
	<h3 class="page-header">Cadastro de Funcionários</h3>
</c:if>

${msg }

	<c:set var="url" value="cadastrar.html" />
	<c:set var="btn1" value="Cadastrar Funcionario" />

	<c:if test="${f != null }">
		<h3 class="page-header">Editar Funcionários</h3>
		<c:set var="url" value="editar2.html" />
		<c:set var="btn1" value="Editar Funcionario" />
	</c:if>
	
	<form action="${url }" method="post">
		<div class="form-group">
			Digite o cpf :<br> <input type="text" name="cpf" id="cpf" class="form-control" value="${f.cpf }"/> <br>
		</div>
		<div class="form-group">
			Digite o nome :<br> <input type="text" name="nome" id="nome" class="form-control" value="${f.nome }"/> <br>
		</div> 
		<div class="form-group">
			 Digite a data de nascimento :<br> <input type="text" name="data_nascimento" id="data_nascimento" class="form-control" value="${f.data_nascimento }"/> <br>
		 </div>
		<div class="form-group">
			Digite o telefone :<br> <input type="text" name="telefone" id="telefone" class="form-control" value="${f.telefone }"/> <br>
		 </div>
		<div class="form-group">
			Digite o email :<br> <input type="text" name="email" id="email" class="form-control" value="${f.email }"/> <br>
		 </div>
		 <div class="form-group">
			Digite a senha :<br> <input type="password" name="senha" id="senha" class="form-control" value="${f.senha }"/> <br>
		 </div>
		 <div class="form-group">
			Digite carteira de trabalho :<br> <input type="text" name="carteira_trabalho" id="carteira_trabalho" class="form-control" value="${f.carteira_trabalho }"/> <br>
		</div>
		<div class="form-group">
			Digite o cargo :<br> <input type="text" name="cargo" id="cargo" class="form-control" value="${f.cargo }"/> <br>
		</div>
		 
		<br/>
		<h3>Informe o endereco do Funcionário</h3>
		
		<div class="form-group">
			Digite a rua :<br> <input type="text" name="rua" id="rua" class="form-control" value="${f.endereco.rua }"/> <br>
		</div>
		<div class="form-group">
			Digite o número :<br> <input type="text" name="numero" id="numero" class="form-control" value="${f.endereco.numero }"/> <br>
		</div>
		<div class="form-group">
			Digite o complemento :<br> <input type="text" name="complemento" id="complemento" class="form-control" value="${f.endereco.complemento }"/> <br>
		</div>
		<div class="form-group">
			Digite o bairro :<br> <input type="text" name="bairro" id="bairro" class="form-control" value="${f.endereco.bairro }"/> <br>
		</div>
		<div class="form-group">
			Digite a cidade :<br> <input type="text" name="cidade" id="cidade" class="form-control" value="${f.endereco.cidade }"/> <br>
		</div>
		<div class="form-group">
			Digite o cep :<br> <input type="text" name="cep" id="cep" class="form-control" value="${f.endereco.cep }"/> <br>
		</div>
		
		<input type="hidden" name="id" value="${f.id_funcionario }">
		<input type="submit" value="${btn1 }" id="btn" class="btn btn-primary">
		<input type="reset" value="Limpar Dados" class="btn btn-danger"/>
		
	</form>

<jsp:include page="rodape2.jsp"></jsp:include>