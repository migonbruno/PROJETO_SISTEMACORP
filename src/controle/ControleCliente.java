package controle;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidade.Cliente;
import entidade.Contato;
import persistencia.ClienteDao;
import persistencia.ContatoDao;

@WebServlet({ "/ControleCliente", "/cadastrarcli.html", "/buscarcli.html",
	"/excluircli.html", "/editarcli.html", "/editar2cli.html", "/logarcli.html","/deslogarcli.html","/contato.html"})
public class ControleCliente extends HttpServlet {
private static final long serialVersionUID = 1L;

public ControleCliente() {
	super();
}

protected void doGet(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
	execute(request,response);
}

protected void doPost(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
	execute(request,response);
}

protected void execute(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
	try {
		
		String url = request.getServletPath();
		if (url.equalsIgnoreCase("/cadastrarcli.html")) {
			cadastrar(request,response);
		} else if (url.equalsIgnoreCase("/buscarcli.html")) {
			buscar(request,response);
		} else  if (url.equalsIgnoreCase("/excluircli.html")) {
			excluir(request,response);
		}else  if (url.equalsIgnoreCase("/editarcli.html")) {
			editar(request,response);
		}else  if (url.equalsIgnoreCase("/editar2cli.html")) {
			editar2(request,response);
		}else  if (url.equalsIgnoreCase("/logarcli.html")) {
			logar(request,response);
		}else if(url.equalsIgnoreCase("/deslogarcli.html")){
			deslogar(request,response);
		}else if(url.equalsIgnoreCase("/contato.html")){
			contato(request,response);
		}else{
			response.sendRedirect("/");
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
}
private void contato(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	String nome = request.getParameter("nome");
	request.setAttribute("nome", nome);
	String email = request.getParameter("email");
	request.setAttribute("email", email);
	String telefone = request.getParameter("telefone");
	request.setAttribute("telefone", telefone);
	String assunto = request.getParameter("assunto");
	request.setAttribute("assunto", assunto);
	String mensagem = request.getParameter("mensagem");
	request.setAttribute("mensagem",mensagem);
	try {
	Contato con = new Contato();
	con.setNome(nome);
	con.setEmail(email);
	con.setTelefone(telefone);
	con.setAssunto(assunto);
	con.setMensagem(mensagem);
	ContatoDao cd = new ContatoDao();
	Boolean flag = cd.cadastrar(con);
	if(flag){
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}else{
		request.setAttribute("msg", "<div class='alert alert-success'>Erro ao enviar a mensagem</div>");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	}catch(Exception e) {
		e.printStackTrace();
	}
}

private void deslogar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	try {
		HttpSession session = request.getSession();
		session.removeAttribute("identificacao");
		session.removeAttribute("usuarioAutenticado");
	} catch (Exception e) {
		e.printStackTrace();
		request.setAttribute("msg", "<div class='alert alert-danger'>Erro ao deslogar</div>");
	}finally{
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
}

protected void cadastrar(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
		try {
			String cpf = request.getParameter("cpf");
			String nome = request.getParameter("nome");
			String data_nascimento = request.getParameter("data_nascimento");
			String telefone = request.getParameter("telefone");
			String email = request.getParameter("email");
			String senha = request.getParameter("senha");
			String cartao= request.getParameter("cartao");
			
			String rua = request.getParameter("rua");
			String numero = request.getParameter("numero");
			String complemento = request.getParameter("complemento");
			String bairro = request.getParameter("bairro");
			String cidade = request.getParameter("cidade");
			String cep = request.getParameter("cep");
			
			Cliente c = new Cliente();
			c.setCpf(cpf);
			c.setNome(nome);
			c.setData_nascimento(Cliente.converterData(data_nascimento) );
			c.setTelefone(telefone);
			c.setEmail(email);
			c.setSenha(senha);
			c.setCartao_credito(cartao);
			
			c.setRua(rua);
			c.setNumero(numero);
			c.setComplemento(complemento);
			c.setBairro(bairro);
			c.setCidade(cidade);
			c.setCep(cep);
			
			// Enviar para o banco de dados
			new ClienteDao().cadastrar(c);
	
			request.setAttribute("msg","<div class='alert alert-success'>Cliente Cadastrado!</div>");

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "<div class='alert alert-danger'>Cliente não Cadastrado!</div>");
		}finally{
			 request.getRequestDispatcher("cadastrarcli.jsp").forward(request, response);
		}
}
protected void buscar(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
	try {
		String nome = request.getParameter("nome");
		request.setAttribute("nome", nome);
		
		ClienteDao cd = new ClienteDao();
		List<Cliente> lista = cd.buscar(nome+"%");
		if (nome == "") {
			request.setAttribute("msg", "<div class='alert alert-info'>Por favor digite um nome</div>");
			lista = null;
		}else if(lista.size() == 0){
		request.setAttribute("msg", "<div class='alert alert-info'>Nenhum Cliente encontrado</div>");
	}
		request.setAttribute("lista", lista);
		
		
	} catch (Exception e) {
		e.printStackTrace();
		request.setAttribute("msg", "<div class='alert alert-danger'>Erro na busca</div>");
	}finally{
		request.getRequestDispatcher("buscarcli.jsp").forward(request, response);
	}
}

protected void excluir(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
	try {
		Integer id = new Integer(request.getParameter("id"));
		ClienteDao cd = new ClienteDao();
		Cliente c = cd.buscarPorId(id);
		if (c == null) {
			request.setAttribute("msg", "<div class='alert alert-warning'>Cliente não existe</div>");
		}else if (cd.excluir(id)) {
			request.setAttribute("msg", "<div class='alert alert-info'>Cliente excluido</div>");
		}else {
			request.setAttribute("msg", "<div class='alert alert-danger'>Cliente não foi excluido</div>");
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		request.getRequestDispatcher("buscarcli.jsp").forward(request, response);
	}
}

protected void editar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	try{
		
		Integer id = new Integer(request.getParameter("id"));
		ClienteDao cd = new ClienteDao();
		Cliente c = cd.buscarPorId(id);
		String data = c.converterData2(c.getData_nascimento());
		if(c == null){
			request.setAttribute("msg", "<div class='alert alert-warning'>Cliente nao existente</div>");
			request.getRequestDispatcher("cadastrarcli.jsp").forward(request, response);
		}else{
			request.setAttribute("c", c);
			request.setAttribute("data", data);
			request.getRequestDispatcher("cadastrarcli.jsp").forward(request, response);
		}
		
	}catch(Exception e){
		e.printStackTrace();
		request.getRequestDispatcher("cadastrarcli.jsp").forward(request, response);
	}
}

protected void editar2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	try{
		String cpf = request.getParameter("cpf");
		String nome = request.getParameter("nome");
		String data_nascimento = request.getParameter("data_nascimento");
		String telefone = request.getParameter("telefone");
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		String cartao_credito = request.getParameter("cartao");
		String id = request.getParameter("id");
		String rua = request.getParameter("rua");
		String numero = request.getParameter("numero");
		String complemento = request.getParameter("complemento");
		String bairro = request.getParameter("bairro");
		String cidade = request.getParameter("cidade");
		String cep = request.getParameter("cep");
		
		Cliente c = new Cliente();
		
		c.setCpf(cpf);
		c.setNome(nome);
		c.setData_nascimento( Cliente.converterData(data_nascimento) );
		c.setTelefone(telefone);
		c.setEmail(email);
		c.setSenha(senha);
		c.setCartao_credito(cartao_credito);
		c.setId_cliente(new Integer(id));
		c.setRua(rua);
		c.setBairro(bairro);
		c.setCep(cep);
		c.setCidade(cidade);
		c.setComplemento(complemento);
		c.setNumero(numero);
			
		ClienteDao cd = new ClienteDao();
		if(cd.editar(c)){
			request.setAttribute("msg", "<div class='alert alert-success'>Cliente editado com sucesso</div>");
		}else{
			request.setAttribute("msg", "<div class='alert alert-danger'>Cliente nao editado</div>");
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		request.getRequestDispatcher("cadastrarcli.jsp").forward(request, response);
	}
}


protected void logar(HttpServletRequest request, 
		HttpServletResponse response) throws ServletException, IOException {
	try {
		HttpSession session = request.getSession();
		String email = request.getParameter("email");
		request.setAttribute("email", email);
		String senha = request.getParameter("senha");
		request.setAttribute("senha", senha);
		
		ClienteDao cd = new ClienteDao();
		Cliente cliente = cd.logar(email, senha);
		if(cliente == null){
			request.setAttribute("msg", "<div class='alert alert-danger'>Email ou senha incorretos</div>");
		}else{
			session.setAttribute("usuarioAutenticado", cliente.getNome());
			session.setAttribute("identificacao", cliente.getId_cliente());
			request.setAttribute("usuario", cliente.getNome());
			request.setAttribute("msg", "<div class='alert alert-success'>Cliente logado</div>");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
	} catch (Exception e) {
		e.printStackTrace();
		request.setAttribute("msg", "<div class='alert alert-danger'>Erro ao logar</div>");
	}finally{
		request.getRequestDispatcher("logarcli.jsp").forward(request, response);
	}
}
}