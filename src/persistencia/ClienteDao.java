package persistencia;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import entidade.Cliente;

public class ClienteDao extends Dao{
	public boolean cadastrar(Cliente f)throws Exception{
		boolean success = false;
		try {
			open();
			stmt = conn.prepareStatement("insert into cliente values(null,?,?,?,?,?,?,?)",
			stmt.RETURN_GENERATED_KEYS);
			stmt.setString(1, f.getCpf());
			stmt.setString(2, f.getNome());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			stmt.setString(3, sdf.format(f.getData_nascimento()));
			stmt.setString(4, f.getTelefone());
			stmt.setString(5, f.getEmail());
			stmt.setString(6, f.getSenha());
			stmt.setString(7, f.getCartao_credito());
			
			stmt.execute();
			
			// Recuperar o id do funcionário
			rs = stmt.getGeneratedKeys();
			
			if(rs.next()) {
				f.setId_cliente(rs.getInt(1));
			}
			
			stmt.close(); // "Limpou a variavel"
			
			stmt = conn.prepareStatement("insert into cliente_endereco values(null,?,?,?,?,?,?,?)",
			stmt.RETURN_GENERATED_KEYS);
			stmt.setInt(1, f.getId_cliente());
			stmt.setString(2, f.getRua());
			stmt.setString(3, f.getNumero());
			stmt.setString(4, f.getComplemento());
			stmt.setString(5, f.getBairro());
			stmt.setString(6, f.getCidade());
			stmt.setString(7, f.getCep());
			
			
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
	
	public List<Cliente>buscar(String nome)throws Exception{		
		List<Cliente> lista = new ArrayList<Cliente>();
		try {
			open(); 																																												
			stmt = conn.prepareStatement("select F.id_cliente,F.cpf,F.nome,F.data_nascimento,F.telefone,F.email,F.senha,F.cartao_credito,E.rua,E.numero,E.complemento,E.bairro,E.cidade,E.cep from cliente F inner join cliente_endereco E on F.id_cliente = E.id_cliente where nome like ?");
			//stmt = conn.prepareStatement("select * from Cliente where nome like ?");
			//stmt = conn.prepareStatement("select * from Cliente inner join Cliente_endereco where nome like ?");
			stmt.setString(1, nome);
			rs = stmt.executeQuery();
			while(rs.next()){
				Cliente f = new Cliente(
						rs.getInt("id_cliente"),
						rs.getString("cpf"),
						rs.getString("nome"),
						rs.getDate("data_nascimento"),
						rs.getString("telefone"),
						rs.getString("email"),
						rs.getString("senha"),
						rs.getString("cartao_credito"),
						rs.getString("rua"),
						rs.getString("numero"),
						rs.getString("complemento"),
						rs.getString("bairro"),
						rs.getString("cidade"),
						rs.getString("cep"));
			
				lista.add(f);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close();
		}
		return lista;
	}
	
	public Cliente buscarPorId(int id)throws Exception{
			Cliente f = null;
			
			try {
				open();
				stmt = conn.prepareStatement("select F.id_cliente,F.cpf,F.nome,F.data_nascimento,F.telefone,F.email,F.senha,F.cartao_credito,E.rua,E.numero,E.complemento,E.bairro,E.cidade,E.cep from cliente F inner join cliente_endereco E on F.id_cliente = E.id_cliente where F.id_cliente = ?");
				//stmt = conn.prepareStatement("select * from Cliente where nome like ?");
				//stmt = conn.prepareStatement("select * from Cliente inner join Cliente_endereco where nome like ?");
				stmt.setInt(1, id);
				rs = stmt.executeQuery();
				if(rs.next()){
					f = new Cliente(
							rs.getInt("id_cliente"),
							rs.getString("cpf"),
							rs.getString("nome"),
							rs.getDate("data_nascimento"),
							rs.getString("telefone"),
							rs.getString("email"),
							rs.getString("senha"),
							rs.getString("cartao_credito"),
							rs.getString("rua"),
							rs.getString("numero"),
							rs.getString("complemento"),
							rs.getString("bairro"),
							rs.getString("cidade"),
							rs.getString("cep"));
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
			
			stmt = conn.prepareStatement("delete from cliente where id_Cliente = ?");
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
	public Cliente logar(String email, String senha) throws Exception{
		Cliente cli = null;
		try {
			open();
			stmt = conn.prepareStatement("select * from cliente where email = ? and senha = ?");
			stmt.setString(1, email);
			stmt.setString(2, senha);
			rs = stmt.executeQuery();
			if(rs.next()){
				cli = new Cliente(
						rs.getInt("id_cliente"),
						rs.getString("cpf"),
						rs.getString("nome"),
						rs.getDate("data_nascimento"),
						rs.getString("telefone"),
						rs.getString("email"),
						rs.getString("senha"),
						rs.getString("cartao_credito"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close();
		}
		return cli;
	}
	
	public boolean editar(Cliente f)throws Exception{
		boolean success = false;
		try{
			open();
			stmt = conn.prepareStatement("update cliente inner join cliente_endereco on cliente.id_cliente = cliente_endereco.id_cliente set cliente.cpf = ?, cliente.nome = ?, cliente.data_nascimento = ?, cliente.telefone = ?, cliente.email = ?, cliente.senha = ?, cliente.cartao_credito = ?,cliente_endereco.rua = ?,cliente_endereco.numero = ?,cliente_endereco.complemento = ?,cliente_endereco.bairro = ?,cliente_endereco.cidade = ?,cliente_endereco.cep = ? where cliente.id_cliente = ?");
			stmt.setString(1, f.getCpf());
			stmt.setString(2, f.getNome());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			stmt.setString(3, sdf.format(f.getData_nascimento()));
			stmt.setString(4, f.getTelefone());
			stmt.setString(5, f.getEmail());
			stmt.setString(6, f.getSenha());
			stmt.setString(7, f.getCartao_credito());
			stmt.setString(8, f.getRua());
			stmt.setString(9, f.getNumero());
			stmt.setString(10, f.getComplemento());
			stmt.setString(11, f.getBairro());
			stmt.setString(12, f.getCidade());
			stmt.setString(13, f.getCep());
			stmt.setInt(14, f.getId_cliente());
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
