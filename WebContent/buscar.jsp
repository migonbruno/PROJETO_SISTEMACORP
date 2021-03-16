<jsp:include page="topo.jsp"></jsp:include>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<h3 class="page-header">Buscar Funcionários</h3>
<div class="well">
	<form action="buscar.html" method="post" class="form-group">
		Informe o nome:
		<input type="text" name="nome" class="form-control"/><br>
		<input type="submit" value="BUSCAR" class="btn btn-info"/>
	</form>
	${msg }

</div>

<c:if test="${fn:length(lista) >0 }">
	<table class="table table-striped table-hover">
		<tr>
			<th colspan="9">Dados do Funcionario</th>
			<th colspan="8">Endereço do Funcionario</th>
		</tr>
		
		<tr>
			<th>ID</th>
			<th>CPF</th>
			<th>Nome</th>
			<th>Nascimento</th>
			<th>Telefone</th>
			<th>Email</th>
			<th>Senha</th>
			<th>Carteira</th>
			<th>Cargo</th>
			<th>Rua</th>
			<th>Numero</th>
			<th>Complemento</th>
			<th>Bairro</th>
			<th>Cidade</th>
			<th>Cep</th>
			<th></th>
			<th></th>
		</tr>
	
	<c:forEach items ="${lista}" var="f">
		<tr>
			<td>${f.id_funcionario }</td>
			<td>${f.cpf }</td>
			<td>${f.nome }</td>
			<td>${f.data_nascimento }</td>
			<td>${f.telefone }</td>
			<td>${f.email }</td>
			<td>${f.senha }</td>
			<td>${f.carteira_trabalho }</td>
			<td>${f.cargo }</td>
			<td>${f.endereco.rua }</td>
			<td>${f.endereco.numero }</td>
			<td>${f.endereco.complemento }</td>
			<td>${f.endereco.bairro }</td>
			<td>${f.endereco.cidade }</td>
			<td>${f.endereco.cep }</td>	
			<td><a href="editar.html?id=${f.id_funcionario }" class="btn btn-warning">Editar</a></td>
			<td><a href="excluir.html?id=${f.id_funcionario }" onclick="return confirm('Deseja excluir este funcionario?')" class="btn btn-danger">Excluir</a></td>
		</tr>
	</c:forEach>
	</table>
		
</c:if>

<jsp:include page="rodape2.jsp"></jsp:include>