<jsp:include page="topo.jsp"></jsp:include>
<%@page import="entidade.Produto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="dao" class="persistencia.ProdutoDao" />

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<div class="center_content">


	<c:forEach items="${listagem}" var="p">
		<div class="container" style="background-color:#D2691E;margin-top:100px">
			<div class="rep-text">
				<strong>${p.nome}</strong>
			</div>
			<div class="fotoProd">
				<img class="tamanhoFoto"
					src="<c:url value="/imagens/${p.imagem}" />" alt="" title=""
					border="0" />
			</div>
			<div class="compra">
				<a href="ControleProdutos?evento=adicionar&produto=${p.id_produto}"></a>
			</div>
			<div class="preco">
				VALOR DO PRODUTO: <strong>R$${p.valor}</strong>
			</div>
			<a href="ControleCarrinho?evento=adicionar&produto=${p.id_produto}"><input
				type="button" class="btn btn-danger" value="Adicionar carrinho"></a>
		</div>
	</c:forEach>


</div>
<!-- end of center content -->

<jsp:include page="rodape2.jsp"></jsp:include>