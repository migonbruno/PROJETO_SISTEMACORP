	
<!-- footer -->
<%@page import="entidade.Produto"%>
<%@page import="persistencia.ProdutoDao"%>
<%@page import="entidade.Pedido"%>
<%@page import="entidade.Cliente"%>
<%@page import="persistencia.ClienteDao"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<footer id="footer" class="agile-footer w3ls-section">
	<div class="container">
		<div class="list-footer">
			<ul class="footer-nav">
				<li><a href="index.jsp">Home</a></li>
				<li><a href="sobre.jsp">Sobre</a></li>
				<li><a href="produtos.jsp">Produtos</a></li>
				<li><a href="index.jsp#contact">Contato</a></li>
				<li><a href="carrinho.jsp"><i class="fa fa-shopping-basket"
						aria-hidden="true"></i> Carrinho</a></li>
			</ul>
		</div>
		<div class="agileits_w3layouts-footer-bottom">
			<div class="w3_agile-footer-grids">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-3  w3_agile-footer1 f1">
							<a href="index.html"> <img class="mx-auto d-block img-fluid"
								src="img/logo1.png" alt="BM TECH LOGO" />
							</a>
							
						</div>
						<div class="col-md-6  w3_agile-footer1 f2">
							<div class="row">
								<div class="col-md-4 col-sm-4 col-4 inner-li">
									<h5>Nossos Produtos</h5>
									<ul class="w3ls-footer-bottom-list">
										<li><a href="hardware.jsp">Hardware</a></li>
										<li><a href="monitores.jsp">Monitores</a></li>
										<li><a href="perifericos.jsp">Periféricos</a></li>
										<li><a href="multiuso.jsp">Multiuso</a></li>
									</ul>
								</div>
								<%
									String usuario = (String) request.getSession().getAttribute("usuarioAutenticado");
									Integer id = (Integer) request.getSession().getAttribute("identificacao");
								%>
								<c:if test="${usuario != null}">
									<div class="col-md-4 col-sm-4 col-4 inner-li">
										<h5>Área do cliente</h5>
										<ul class="w3ls-footer-bottom-list">
											<li><a href="editarcli.html?id=<%out.println(id);%>">Editar
													Cadastro</a></li>
											<li><a href="logarcli.jsp">Entrar <i
													class="fa fa-sign-in" aria-hidden="true"></i></a></li>
											<li><a href="deslogarcli.html" class="fa fa-sign-out">Sair</a></li>
										</ul>
									</div>
								</c:if>
								<c:if test="${usuario == null}">
									<div class="col-md-4 col-sm-4 col-4 inner-li">
										<h5>Já é nosso cliente ?</h5>
										<ul class="w3ls-footer-bottom-list">
											<li><a href="logarcli.jsp">Entrar <i
													class="fa fa-sign-in" aria-hidden="true"></i></a></li>
										</ul>
										<h5>Ainda não é nosso cliente ?</h5>
										<ul class="w3ls-footer-bottom-list">
											<li><a href="cadastrarcli.jsp">Cadastrar <i
													class="fa fa-sign-in" aria-hidden="true"></i></a></li>
										</ul>
									</div>
								</c:if>
								<div class="col-md-4 col-sm-4 col-4 inner-li">
										<h5>Área restrita</h5>
										<ul class="w3ls-footer-bottom-list">
											<li><a href="adm/admlogin.jsp">Entrar <i
													class="fa fa-sign-in" aria-hidden="true"></i></a></li>
											<li><a href="deslogarcli.html" class="fa fa-sign-out">Sair</a></li>
										</ul>
									</div>
								<div class="clearfix"></div>
							</div>
						</div>
						<div class="col-md-3  w3_agile-footer1 f3">
							<h5>siga-nos nas redes</h5>
							<ul class="footer-social-icons">
								<li><a href="#"> <i class="fa icon1 fa-facebook icons"
										aria-hidden="true"></i>
								</a></li>
								<li><a href="#"> <i class="fa icon2 fa-twitter icons"
										aria-hidden="true"></i>
								</a></li>
								<li><a href="#"> <i
										class="fa icon3 fa-google-plus icons" aria-hidden="true"></i>
								</a></li>
								<li><a href="#"> <i
										class="fa icon4 fa-pinterest-p icons" aria-hidden="true"></i>
								</a></li>
							</ul>
						</div>
						<div class="clearfix"></div>

					</div>
				</div>
			</div>

			<div class="agileits_w3layouts-copyright">
				<p>
					&copy; 2021 | Todos Os Direitos Reservados | Design
					by <a href="#" target="=_blank"> Bruno e Thyffany - Senac
						Bonsucesso </a>
				</p>
			</div>
		</div>
	</div>
</footer>
<!-- //footer -->
</div>
<!-- //div body -->

<!--=====================
				FIM DO CÓDIGO
			=====================-->

<!-- scripts -->
<script>
	Holder.addTheme('thumb', {
		bg : '#55595c',
		fg : '#eceeef',
		text : 'Thumbnail'
	});
</script>

<!-- jquery localhost -->
<script src="js/jquery-3.2.1.slim.min.js"></script>
<!-- //bootstrap 4.0 localhost scripts -->
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<script>
	$(function() {
		$('.dropdown-toggle').dropdown();
	});
</script>

<!-- js -->
<script src="js/jquery-2.2.3.min.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
<!-- //js -->

<!-- search-bar -->
<script src="js/main.js"></script>
<!-- //search-bar -->

<!-- valida-cadastro -->
<script src="js/valida-cadastro.js"></script>
<!-- //valida-cadastro -->

<!-- PAGINA MENU easy-responsive-tabs IMPORTANTE -->
<script src="js/easy-responsive-tabs.js"></script>
<!-- //PAGINA MENU easy-responsive-tabs IMPORTANTE -->

<!-- banner responseve-slides -->
<script src="js/responsiveslides.min.js"></script>
<script>
	// You can also use "$(window).load(function() {"
	$(function() {
		// Slideshow 4
		$("#slider3").responsiveSlides({
			auto : true,
			pager : true,
			nav : false,
			speed : 600,
			namespace : "callbacks",
			before : function() {
				$('.events').append("_$tabefore event fired._$tag");
			},
			after : function() {
				$('.events').append("_$taafter event fired._$tag");
			}
		});

	});
</script>
<!-- //banner responseve-slides -->

<!-- modais forms -->
<script src="js/formscript.js" type="text/javascript"></script>
<!-- //modais forms -->

<!-- start-smoth-scrolling -->
<script src="js/move-top.js"></script>
<script src="js/easing.js"></script>
<script>
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 1000);
		});
	});
</script>
<!-- smooth-scrolling-of-move-up -->
<script>
	$(document).ready(function() {
		/*
			var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
			};
		 */
		$().UItoTop({
			easingType : 'easeOutQuart'
		});
	});
</script>
<!-- //here ends scrolling icon -->
<!-- //smoth-scrolling -->

<!-- //scripts -->

<!-- start-smoth-scrolling -->
<a href="#" id="toTop" style="display: blocl;"> <span
	id="toTopHover" style="opacity: 1;"> </span>
</a>
<!-- //start-smoth-scrolling -->
</body>
</html>