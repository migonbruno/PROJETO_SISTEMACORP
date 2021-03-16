package persistencia;

import java.text.SimpleDateFormat;

import entidade.Compra;

public class CompraDao extends Dao{
	public boolean cadastrar(Compra c) throws Exception {
		boolean success = false;
		try {
		open();
		stmt = conn.prepareStatement("insert into compra values(null,?,?,?,?)");
		stmt.setInt(1, c.getId_cliente());
		stmt.setString(2, c.getData_compra());
		stmt.setDouble(3, c.getValor());
		stmt.setInt(4, c.getId_pedido());
		stmt.execute();
		success = true;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return success;
	}
	
	public static void main(String[] args) {
		Compra c = new Compra();
		c.setId_cliente(1);
		c.setData_compra("1999-02-27");
		c.setValor(32.3);
		c.setId_pedido(4);
		CompraDao pd = new CompraDao();
		try {
			System.out.println(pd.cadastrar(c));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

	}
}
