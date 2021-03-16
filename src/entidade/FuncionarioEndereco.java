package entidade;

public class FuncionarioEndereco {
	
	private int id_end_func;
	private String rua;
	private String numero;
	private String complemento;
	private String bairro;
	private String cidade;
	private String cep;
	
	public FuncionarioEndereco() {
		
	}

	public FuncionarioEndereco(int id_end_func, String rua, String numero, String complemento, String bairro, String cidade,
			String cep) {
		super();
		this.id_end_func = id_end_func;
		this.rua = rua;
		this.numero = numero;
		this.complemento = complemento;
		this.bairro = bairro;
		this.cidade = cidade;
		this.cep = cep;
	}

	public int getId_end_func() {
		return id_end_func;
	}

	public void setId_end_func(int id_end_func) {
		this.id_end_func = id_end_func;
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
	
	
}
