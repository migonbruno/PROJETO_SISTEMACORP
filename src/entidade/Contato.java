package entidade;

public class Contato {
	private Integer id_contato;
	private String nome;
	private String email;
	private String telefone;
	private String assunto;
	private String mensagem;
	private boolean novidade;
	
	public Contato() {
		// TODO Auto-generated constructor stub
	}

	public Contato(Integer id_contato, String nome, String email, String telefone, String assunto, String mensagem,
			boolean novidade) {
		super();
		this.id_contato = id_contato;
		this.nome = nome;
		this.email = email;
		this.telefone = telefone;
		this.assunto = assunto;
		this.mensagem = mensagem;
		this.novidade = novidade;
	}

	public Integer getId_contato() {
		return id_contato;
	}

	public void setId_contato(Integer id_contato) {
		this.id_contato = id_contato;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getAssunto() {
		return assunto;
	}

	public void setAssunto(String assunto) {
		this.assunto = assunto;
	}

	public String getMensagem() {
		return mensagem;
	}

	public void setMensagem(String mensagem) {
		this.mensagem = mensagem;
	}

	public boolean isNovidade() {
		return novidade;
	}

	public void setNovidade(boolean novidade) {
		this.novidade = novidade;
	}

	@Override
	public String toString() {
		return "Contato [id_contato=" + id_contato + ", nome=" + nome + ", email=" + email + ", telefone=" + telefone
				+ ", assunto=" + assunto + ", mensagem=" + mensagem + ", novidade=" + novidade + "]";
	}
}
