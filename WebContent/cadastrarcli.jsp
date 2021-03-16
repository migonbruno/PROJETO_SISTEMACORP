<jsp:include page="topo.jsp"></jsp:include>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<section id="banner-contato" class="inner_banner">
				<div class="dot1">
				</div>
</section>
			
			
<div class="container">
	<c:if test="${c == null }">
		<h3 class="page-header">Cadastro</h3>
	</c:if>

	${msg }

	<c:set var="url" value="cadastrarcli.html" />
	<c:set var="btn1" value="Cadastrar Cliente" />

	<c:if test="${c != null }">
		<h3 class="page-header">Editar</h3>
		<c:set var="url" value="editar2cli.html" />
		<c:set var="btn1" value="Editar Cliente" />
	</c:if>

	<form action="${url }" method="post">
		<div class="form-group">
			Digite o cpf :<br> <input type="text" name="cpf" id="cpf"
				class="form-control" value="${c.cpf }" /> <br>
		</div>
		<div class="form-group">
			Digite o nome :<br> <input type="text" name="nome" id="nome"
				class="form-control" value="${c.nome }" /> <br>
		</div>
		<div class="form-group">
			Digite a data de nascimento :<br> <input type="text"
				name="data_nascimento" id="data_nascimento" class="form-control"
				value="${data }" /> <br>
		</div>
		<div class="form-group">
			Digite o telefone :<br> <input type="text" name="telefone"
				id="telefone" class="form-control" value="${c.telefone }" /> <br>
		</div>
		<div class="form-group">
			Digite o email :<br> <input type="text" name="email" id="email"
				class="form-control" value="${c.email }" /> <br>
		</div>
		<div class="form-group">
			Digite a senha :<br> <input type="password" name="senha"
				id="senha" class="form-control" value="${c.senha }" /> <br>
		</div>
		<div class="form-group">
			Digite cartao de crédito :<br> <input type="text" name="cartao"
				class="form-control" value="${c.cartao_credito }" /> <br>
		</div>
		<br />
		<h3>Informe o endereco</h3>

		<div class="form-group">
			Digite a rua :<br> <input type="text" name="rua" id="rua"
				class="form-control" value="${c.rua }" /> <br>
		</div>
		<div class="form-group">
			Digite o número :<br> <input type="text" name="numero"
				id="numero" class="form-control" value="${c.numero }" /> <br>
		</div>
		<div class="form-group">
			Digite o complemento :<br> <input type="text" name="complemento"
				id="complemento" class="form-control" value="${c.complemento }" /> <br>
		</div>
		<div class="form-group">
			Digite o bairro :<br> <input type="text" name="bairro"
				id="bairro" class="form-control" value="${c.bairro }" /> <br>
		</div>
		<div class="form-group">
			Digite a cidade :<br> <input type="text" name="cidade"
				id="cidade" class="form-control" value="${c.cidade }" /> <br>
		</div>
		<div class="form-group">
			Digite o cep :<br> <input type="text" name="cep" id="cep"
				class="form-control" value="${c.cep }" /> <br>
		</div>

		<input type="hidden" name="id" value="${c.id_cliente }"> <input
			type="submit" value="${btn1 }" id="btn" class="btn btn-primary">
	</form>
</div>
<jsp:include page="rodape2.jsp"></jsp:include>