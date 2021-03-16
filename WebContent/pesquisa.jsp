<jsp:include page="topo.jsp"></jsp:include>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div id="body-section" class="container-fluid">

	<!-- tab_section-->
	<section id="menu-section" class="container" style="margin-top:150px">
		<!-- tabs -->
		<div class="tabs_section">
			<div class="container">
				<h5>Pesquisa</h5>
				<div id="horizontalTab">
					<ul class="resp-tabs-list">
						<li><a href="hardware.jsp">HARDWARES</a></li>
						<li><a href="monitores.jsp">MONITORES</a></li>
						<li><a href="perifericos.jsp">PERIFÉRICOS</a></li>
						<li><a href="multiuso.jsp">MULTIUSO</a></li>
					</ul>
					<div class="text-center" style="margin:0 auto">
						<c:forEach items="${lista}" var="p">
							<div class="resp-tabs-container">
								<div class="tab1">
									<div class="row recipe-grid">
										<div class="col-md-6 menu-grids">
											<div class="menu-text_wthree">

												<div class="menu-text-left">
													<div class="rep-img">
														<a href="detalhes.html?id=${p.id_produto}"> <img
															class="img-fluid"
															src="<c:url value="/imagens/${p.imagem}" />" /></a>
													</div>
													<div class="rep-text">
														<h2>${p.nome }</h2>
														<h4>${p.descricao }</h4>
													</div>

													<div class="clearfix"></div>
												</div>
												<div class="menu-text-right">
													<h4>$ ${p.valor }</h4>
												</div>
												<div class="clearfix"></div>
												<a href="ControleCarrinho?evento=adicionar&produto=${p.id_produto }" class="btn btn-warning">Adicionar ao carrinho</a>
											</div>
										</div>
										<div class="clearfix"></div>
									</div>

									<div class="clearfix"></div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<!-- //tabs -->
	</section>
</div>
<jsp:include page="rodape2.jsp"></jsp:include>
