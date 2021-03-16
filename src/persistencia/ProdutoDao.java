package persistencia;

import java.util.ArrayList;
import java.util.List;

import entidade.Produto;

public class ProdutoDao extends Dao{
	
	public boolean cadastrar(Produto p)throws Exception{
		boolean success = false;
		try {
			open();
			stmt = conn.prepareStatement("insert into produto values(null,?,?,?,?,?)");
			stmt.setString(1, p.getNome());
			stmt.setString(2, p.getDescricao());
			stmt.setString(3, p.getCategoria());
			stmt.setDouble(4, p.getValor());
			stmt.setString(5, p.getImagem());
			
			stmt.execute();
			success = true;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close();
		}
		return success;
	}
	
	public List<Produto>buscar(String nome)throws Exception{		
		List<Produto> lista = new ArrayList<Produto>();
		try {
			open();
			stmt = conn.prepareStatement("select * from produto where nome like ?");
			stmt.setString(1, nome);
			rs = stmt.executeQuery();
			while(rs.next()){
				Produto p = new Produto(
						rs.getInt("id_produto"),
						rs.getString("nome"),
						rs.getString("descricao"),
						rs.getString("categoria"),
						rs.getDouble("valor"),
						rs.getString("imagem"));
				lista.add(p);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close();
		}
		return lista;
	}
	
	public Produto buscarPorId(int id)throws Exception{
		Produto p = null;
	
			try {
				open();
				stmt = conn.prepareStatement("select * from produto where id_produto = ?");
				stmt.setInt(1, id);
				
				rs = stmt.executeQuery();
				
				if(rs.next()){
					p = new Produto(rs.getInt("id_produto"),
							rs.getString("nome"),
							rs.getString("descricao"),
							rs.getString("categoria"),
							rs.getDouble("valor"),
							rs.getString("imagem"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				close();
			}
			return p;
	}
	
	public boolean excluir(int id) throws Exception{
		boolean success = false;
		try {
			open();
			stmt = conn.prepareStatement("delete from produto where id_produto = ?");
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
	
	public boolean editar(Produto p)throws Exception{
		boolean success = false;
		try{
			open();
			stmt = conn.prepareStatement("update produto set nome = ?,  descricao = ?, categoria = ?, valor = ?, imagem = ? where id_produto = ?");
			stmt.setString(1, p.getNome());
			stmt.setString(2, p.getDescricao());
			stmt.setString(3, p.getCategoria());
			stmt.setDouble(4, p.getValor());
			stmt.setString(5, p.getImagem());			
			
			stmt.setInt(6, p.getId_produto());

			stmt.execute();
			success = true;
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close();
		}
		return success;
	} 
	
	
	public List<Produto> listarTodos() throws Exception{
		List<Produto> lista = new ArrayList<Produto>();
		try{
	        open();
	        stmt = conn.prepareStatement("select * from produto");
	        rs = stmt.executeQuery();
	        while(rs.next()){
	            Produto p = new Produto();
	            p.setId_produto(rs.getInt("id_produto"));
	            p.setNome(rs.getString("nome"));
	            p.setDescricao(rs.getString("descricao"));
	            p.setCategoria(rs.getString("categoria"));
	            p.setValor(rs.getDouble("valor"));
	            p.setImagem(rs.getString("imagem"));
   
	            lista.add(p);            
	        }
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
		close();
		}
		return lista;
	}
	
	
	public List<Produto> detalhe(int id)throws Exception{		
		List<Produto> lista = new ArrayList<Produto>();
		try {
			open();
			stmt = conn.prepareStatement("select * from produto where id_produto = ?");
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			while(rs.next()){
				Produto p = new Produto(
						rs.getInt("id_produto"),
						rs.getString("nome"),
						rs.getString("descricao"),
						rs.getString("categoria"),
						rs.getDouble("valor"),
						rs.getString("imagem"));
				lista.add(p);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close();
		}
		return lista;
	}

	public List<Produto>hardware()throws Exception{		
		List<Produto> lista = new ArrayList<Produto>();
		try {
			open();
			stmt = conn.prepareStatement("select * from produto where categoria = 'hardware'");
			rs = stmt.executeQuery();
			while(rs.next()){
				Produto p = new Produto(
						rs.getInt("id_produto"),
						rs.getString("nome"),
						rs.getString("descricao"),
						rs.getString("categoria"),
						rs.getDouble("valor"),
						rs.getString("imagem"));
				lista.add(p);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close();
		}
		return lista;
	}
	
	public List<Produto>monitores()throws Exception{		
		List<Produto> lista = new ArrayList<Produto>();
		try {
			open();
			stmt = conn.prepareStatement("select * from produto where categoria = 'monitores'");
			rs = stmt.executeQuery();
			while(rs.next()){
				Produto p = new Produto(
						rs.getInt("id_produto"),
						rs.getString("nome"),
						rs.getString("descricao"),
						rs.getString("categoria"),
						rs.getDouble("valor"),
						rs.getString("imagem"));
				lista.add(p);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close();
		}
		return lista;
	}
	
	public List<Produto>periféricos()throws Exception{		
		List<Produto> lista = new ArrayList<Produto>();
		try {
			open();
			stmt = conn.prepareStatement("select * from produto where categoria = 'periféricos'");
			rs = stmt.executeQuery();
			while(rs.next()){
				Produto p = new Produto(
						rs.getInt("id_produto"),
						rs.getString("nome"),
						rs.getString("descricao"),
						rs.getString("categoria"),
						rs.getDouble("valor"),
						rs.getString("imagem"));
				lista.add(p);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close();
		}
		return lista;
	}
	
	
	public List<Produto>multiuso()throws Exception{		
		List<Produto> lista = new ArrayList<Produto>();
		try {
			open();
			stmt = conn.prepareStatement("select * from produto where categoria = 'multiuso'");
			rs = stmt.executeQuery();
			while(rs.next()){
				Produto p = new Produto(
						rs.getInt("id_produto"),
						rs.getString("nome"),
						rs.getString("descricao"),
						rs.getString("categoria"),
						rs.getDouble("valor"),
						rs.getString("imagem"));
				lista.add(p);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close();
		}
		return lista;
	}
}


