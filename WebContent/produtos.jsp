<jsp:include page="topo.jsp"></jsp:include>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<section id="banner-contato" class="inner_banner">
				<div class="dot1">
				</div>
			</section>
			<br>
	<!-- tab_section-->
	<section id="menu-section" class="container">
		<!-- tabs -->
		<div class="tabs_section">
			<div class="container">
				<h5>PRODUTOS</h5>
				<div id="horizontalTab">
					<ul class="resp-tabs-list">
						<li><a href="hardware.jsp" style="text-decoration:none; color:white;">HARDWARE</a></li>
						<li><a href="monitores.jsp" style="text-decoration:none; color:white;">MONITORES</a></li>
						<li><a href="perifericos.jsp" style="text-decoration:none; color:white;">PERIFÉRICOS</a></li>
						<li><a href="multiuso.jsp" style="text-decoration:none; color:white;">MULTIUSO</a></li>
					</ul>
					<div class="resp-tabs-container">
					<%
					 request.setAttribute("lista", new persistencia.ProdutoDao().monitores());
					%>
					
						<c:forEach items="${lista}" var="p">
						
						
								<div class="tab1">
									<div class="row recipe-grid">
						<div class="col-md-12 menu-grids">
							<div class="menu-text_wthree">

									<div class="menu-text-left">
										<div class="rep-img">
					<img class="img-fluid" src="<c:url value="/im	g/${p.imagem}" />"></a>
					</div>
						<div class="rep-text">
													<strong>${p.nome}</strong><br/>
													<strong>Descrição: ${p.descricao}</strong><br/>
													<strong>Categoria: ${p.categoria}</strong>
													</div>

				<div class="clearfix"></div>
					</div>
			<div class="menu-text-right">
				<strong><fmt:formatNumber value="${p.valor }" type="currency" ></fmt:formatNumber></strong>
			</div>
			<div class="clearfix">
			<a href="ControleCarrinho?evento=adicionar&produto=${p.id_produto }" class="btn btn-success">Adicionar ao carrinho</a>
			</div>
		</div>
			<div class="clearfix"></div>
			
</div></div>
			
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<!-- //tabs -->
	</section>
	<br>
<jsp:include page="rodape2.jsp"></jsp:include>