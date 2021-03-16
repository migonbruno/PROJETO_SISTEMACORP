package persistencia;

import entidade.Contato;

public class ContatoDao extends Dao{
	public boolean cadastrar(Contato c)throws Exception{
		boolean success = false;
		try {
			open();
			stmt = conn.prepareStatement("insert into fale values(null,?,?,?,?,?,?)");
			stmt.setString(1, c.getNome());
			stmt.setString(2, c.getEmail());
			stmt.setString(3, c.getTelefone());
			stmt.setString(4, c.getAssunto());
			stmt.setString(5, c.getMensagem());
			stmt.setBoolean(6, c.isNovidade());
			
			stmt.execute();
			
			success = true;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close();
		}
		return success;
	}
}
