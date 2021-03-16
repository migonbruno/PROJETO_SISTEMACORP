package persistencia;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import entidade.Funcionario;
import entidade.FuncionarioEndereco;

public class FuncionarioDao extends Dao {
	
	
	public boolean cadastrar(Funcionario f)throws Exception{
		boolean success = false;
		try {
			open();
			stmt = conn.prepareStatement("insert into funcionario values(null,?,?,?,?,?,?,?,?)",stmt.RETURN_GENERATED_KEYS);
			stmt.setString(1, f.getCpf());
			stmt.setString(2, f.getNome());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			stmt.setString(3, sdf.format(f.getData_nascimento()));
			stmt.setString(4, f.getTelefone());
			stmt.setString(5, f.getEmail());
			stmt.setString(6, f.getSenha());
			stmt.setString(7, f.getCarteira_trabalho());
			stmt.setString(8, f.getCargo());
			
			stmt.execute();
			
			// Recuperar o id do funcionário
			rs = stmt.getGeneratedKeys();
			
			if(rs.next()) {
				f.setId_funcionario(rs.getInt(1));
			}
			
			stmt.close(); // "Limpou a variavel"
			
			stmt = conn.prepareStatement("insert into funcionario_endereco values(null,?,?,?,?,?,?,?)",stmt.RETURN_GENERATED_KEYS);
			stmt.setInt(1, f.getId_funcionario());
			stmt.setString(2, f.getEndereco().getRua());
			stmt.setString(3, f.getEndereco().getNumero());
			stmt.setString(4, f.getEndereco().getComplemento());
			stmt.setString(5, f.getEndereco().getBairro());
			stmt.setString(6, f.getEndereco().getCidade());
			stmt.setString(7, f.getEndereco().getCep());
			
			// Gravar na tabela de endereco
			stmt.execute();
			stmt.close();
			
			success = true;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close();
		}
		return success;
	}
	
	public List<Funcionario>buscar(String nome)throws Exception{		
		List<Funcionario> lista = new ArrayList<Funcionario>();
		try {
			open(); 												
			stmt = conn.prepareStatement("select F.id_funcionario,F.cpf,F.nome,F.data_nascimento,F.telefone,F.email,F.senha,F.carteira_trabalho,F.cargo,E.id_end_func,E.rua,E.numero,E.complemento,E.bairro,E.cidade,E.cep from funcionario F inner join funcionario_endereco E on F.id_funcionario = E.id_funcionario where nome like ?");
			stmt.setString(1, nome);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				Funcionario f = new Funcionario(
						rs.getInt("id_funcionario"),
						rs.getString("cpf"),
						rs.getString("nome"),
						rs.getDate("data_nascimento"),
						rs.getString("telefone"),
						rs.getString("email"),
						rs.getString("senha"),
						rs.getString("carteira_trabalho"),
						rs.getString("cargo"));
				FuncionarioEndereco e = new FuncionarioEndereco(
						  rs.getInt("id_end_func"),
						  rs.getString("rua"),
						  rs.getString("numero"),
						  rs.getString("complemento"),
						  rs.getString("bairro"),
						  rs.getString("cidade"),
						  rs.getString("cep"));
			
				f.setEndereco(e);
				lista.add(f);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close();
		}
		return lista;
	}
	
	public Funcionario buscarPorId(int id)throws Exception{
			Funcionario f = null;
			
			try {
				open();
				stmt = conn.prepareStatement("select * from funcionario where id_funcionario = ?");
				stmt.setInt(1, id);
				
				rs = stmt.executeQuery();
				
				if(rs.next()){
					f = new Funcionario(rs.getInt("id_funcionario"),
							rs.getString("cpf"),
							rs.getString("nome"),
							rs.getDate("data_nascimento"),
							rs.getString("telefone"),
							rs.getString("email"),
							rs.getString("senha"),
							rs.getString("carteira_trabalho"),
							rs.getString("cargo"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				close();
			}
			return f;
	}
	
	public Funcionario buscarPorId2(int id)throws Exception{
		Funcionario f = null;
		FuncionarioEndereco endereco = null;
		
		try {
			open();
			stmt = conn.prepareStatement("select F.id_funcionario,F.cpf,F.nome,F.data_nascimento,F.telefone,F.email,F.senha,F.carteira_trabalho,F.cargo,E.id_end_func,E.rua,E.numero,E.complemento,E.bairro,E.cidade,E.cep from funcionario F inner join funcionario_endereco E on F.id_funcionario = E.id_funcionario where F.id_funcionario = ?");
			stmt.setInt(1, id);
			
			rs = stmt.executeQuery();
			
			if(rs.next()){
				f = new Funcionario(
						rs.getInt("id_funcionario"),
						rs.getString("cpf"),
						rs.getString("nome"),
						rs.getDate("data_nascimento"),
						rs.getString("telefone"),
						rs.getString("email"),
						rs.getString("senha"),
						rs.getString("carteira_trabalho"),
						rs.getString("cargo"));
				endereco = new FuncionarioEndereco(
						  rs.getInt("id_end_func"),
						  rs.getString("rua"),
						  rs.getString("numero"),
						  rs.getString("complemento"),
						  rs.getString("bairro"),
						  rs.getString("cidade"),
						  rs.getString("cep"));
				f.setEndereco(endereco);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close();
		}
		return f;
	}
	
	public boolean excluir(int id) throws Exception{
		boolean success = false;
		try {
			open();
			stmt = conn.prepareStatement("delete from funcionario where id_funcionario = ?");
			stmt.setInt(1, id);
			
			stmt.execute();
			
			success = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return success;
	}
	
	public boolean excluir2(int id) throws Exception{
		boolean success = false;
		try {
			open();
			stmt = conn.prepareStatement("delete from funcionario_endereco where id_funcionario = ?");
			stmt.setInt(1, id);
			
			stmt.execute();
			
			success = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return success;
	}
	/*------------------------------------------------------------------------ */
	public Funcionario logar(String email, String senha) throws Exception{
		Funcionario func = new Funcionario();
		try {
			open();
			stmt = conn.prepareStatement("select * from funcionario where email = ? and senha = ?");
			stmt.setString(1, email);
			stmt.setString(2, senha);
			rs = stmt.executeQuery();
			if(rs.next()){
				func = new Funcionario(
						rs.getInt("id_funcionario"),
						rs.getString("cpf"),
						rs.getString("nome"),
						rs.getDate("data_nascimento"),
						rs.getString("telefone"),
						rs.getString("email"),
						rs.getString("senha"),
						rs.getString("carteira_trabalho"),
						rs.getString("cargo"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close();
		}
		return func;
	}
	
	public boolean editar(Funcionario f)throws Exception{
		boolean success = false;
		try{
			open();
			stmt = conn.prepareStatement("update funcionario inner join funcionario_endereco on funcionario.id_funcionario = funcionario_endereco.id_funcionario set funcionario.cpf = ?, funcionario.nome = ?, funcionario.data_nascimento = ?, funcionario.telefone = ?, funcionario.email = ?, funcionario.senha = ?, funcionario.carteira_trabalho = ?, funcionario.cargo = ?, funcionario_endereco.rua = ?, funcionario_endereco.numero = ?, funcionario_endereco.complemento = ?, funcionario_endereco.bairro = ?, funcionario_endereco.cidade = ?, funcionario_endereco.cep = ? where funcionario.id_funcionario = ?");
			stmt.setString(1, f.getCpf());
			stmt.setString(2, f.getNome());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			stmt.setString(3, sdf.format(f.getData_nascimento()));
			stmt.setString(4, f.getTelefone());
			stmt.setString(5, f.getEmail());
			stmt.setString(6, f.getSenha());
			stmt.setString(7, f.getCarteira_trabalho());
			stmt.setString(8, f.getCargo());
			stmt.setString(9, f.getEndereco().getRua());
			stmt.setString(10, f.getEndereco().getNumero());
			stmt.setString(11, f.getEndereco().getComplemento());
			stmt.setString(12, f.getEndereco().getBairro());
			stmt.setString(13, f.getEndereco().getCidade());
			stmt.setString(14, f.getEndereco().getCep());
			stmt.setInt(15, f.getId_funcionario());
			stmt.execute();
			success = true;
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close();
		}
		return success;
	}
} 

