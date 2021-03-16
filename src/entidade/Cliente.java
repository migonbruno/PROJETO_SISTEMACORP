package entidade;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;

public class Cliente {
	private int id_cliente;
	private String cpf;
	private String nome;
	private Date data_nascimento;
	private String telefone;
	private String email;
	private String senha;
	private String cartao_credito;
	private String rua;
	private String numero;
	private String complemento;
	private String bairro;
	private String cidade;
	private String cep;
	
	public Cliente() {
		// TODO Auto-generated constructor stub
	}
	
	public Cliente(int id_cliente, String cpf, String nome, Date data_nascimento, String telefone, String email,
			String senha, String cartao_credito, String rua, String numero, String complemento, String bairro,
			String cidade, String cep) {
		super();
		this.id_cliente = id_cliente;
		this.cpf = cpf;
		this.nome = nome;
		this.data_nascimento = data_nascimento;
		this.telefone = telefone;
		this.email = email;
		this.senha = senha;
		this.cartao_credito = cartao_credito;
		this.rua = rua;
		this.numero = numero;
		this.complemento = complemento;
		this.bairro = bairro;
		this.cidade = cidade;
		this.cep = cep;
	}

	public Cliente(int id_cliente, String cpf, String nome, Date data_nascimento, String telefone, String email,
			String senha, String cartao_credito) {
		super();
		this.id_cliente = id_cliente;
		this.cpf = cpf;
		this.nome = nome;
		this.data_nascimento = data_nascimento;
		this.telefone = telefone;
		this.email = email;
		this.senha = senha;
		this.cartao_credito = cartao_credito;
	}

	public int getId_cliente() {
		return id_cliente;
	}

	public void setId_cliente(int id_cliente) {
		this.id_cliente = id_cliente;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Date getData_nascimento() {
		return data_nascimento;
	}

	public void setData_nascimento(Date data_nascimento) {
		this.data_nascimento = data_nascimento;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getCartao_credito() {
		return cartao_credito;
	}

	public void setCartao_credito(String cartao_credito) {
		this.cartao_credito = cartao_credito;
	}

	public String getRua() {
		return rua;
	}

	public void setRua(String rua) {
		this.rua = rua;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getComplemento() {
		return complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}
	
	public static Date converterData(String data){
		String novaData[] = data.split("/");
		String dia = novaData[0];
		String mes = novaData[1];
		String ano = novaData[2];
		GregorianCalendar cal = new GregorianCalendar(new Integer(ano), 
				new Integer(mes) - 1, new Integer(dia));
		return cal.getTime();
	}
	
	public static String converterData2(Date data){
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		String date = sdf.format(data);
		
		return date;
	}

	@Override
	public String toString() {
		return "Cliente [cpf=" + cpf + ", nome=" + nome + ", data_nascimento=" + data_nascimento + ", telefone="
				+ telefone + ", email=" + email + ", senha=" + senha + ", cartao_credito=" + cartao_credito + ", rua="
				+ rua + ", numero=" + numero + ", complemento=" + complemento + ", bairro=" + bairro + ", cidade="
				+ cidade + ", cep=" + cep + "]";
	}
	
	
}
