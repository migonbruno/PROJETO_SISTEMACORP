package entidade;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;

public class Funcionario {
	private int id_funcionario;
	private String cpf;
	private String nome;
	private Date data_nascimento;
	private String telefone;
	private String email;
	private String senha;
	private String carteira_trabalho;
	private String cargo;
	
	private FuncionarioEndereco endereco;
	
	public Funcionario() {
		
	}
	// endereco não entra no construtor
	public Funcionario(int id_funcionario, String cpf, String nome, Date data_nascimento, String telefone, String email,
			String senha, String carteira_trabalho, String cargo) {
		super();
		this.id_funcionario = id_funcionario;
		this.cpf = cpf;
		this.nome = nome;
		this.data_nascimento = data_nascimento;
		this.telefone = telefone;
		this.email = email;
		this.senha = senha;
		this.carteira_trabalho = carteira_trabalho;
		this.cargo = cargo;
	}

	public int getId_funcionario() {
		return id_funcionario;
	}

	public void setId_funcionario(int id_funcionario) {
		this.id_funcionario = id_funcionario;
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

	public String getCarteira_trabalho() {
		return carteira_trabalho;
	}

	public void setCarteira_trabalho(String carteira_trabalho) {
		this.carteira_trabalho = carteira_trabalho;
	}

	public String getCargo() {
		return cargo;
	}

	public void setCargo(String cargo) {
		this.cargo = cargo;
	}
	
	public FuncionarioEndereco getEndereco() {
		return endereco;
	}

	public void setEndereco(FuncionarioEndereco endereco) {
		this.endereco = endereco;
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
}
