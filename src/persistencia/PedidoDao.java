package persistencia;

import entidade.Pedido;

public class PedidoDao extends Dao {
	public Integer cadastrar(Pedido p) throws Exception {
		Integer id = null;
		try {
			open();
			stmt = conn.prepareStatement("insert into pedido values(null,?,?,?)", 
					stmt.RETURN_GENERATED_KEYS);
			stmt.setDouble(1, p.getValor());
			stmt.setInt(2, p.getId_produto());
			stmt.setInt(3, p.getQuantidade());
			stmt.execute();
			
			rs = stmt.getGeneratedKeys();
			if(rs.next()) {
				id = rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			close();
		}
		return id;
	}

	public void open() {
		// TODO Auto-generated method stub
		
	}

	public static void main(String[] args) {
		Pedido p = new Pedido();
		p.setValor(32.3);
		p.setId_produto(4);
		p.setQuantidade(3);
		PedidoDao pd = new PedidoDao();
		try {
			System.out.println("Deu eu " + pd.cadastrar(p));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

	}

}
