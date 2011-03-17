package com.ogordo.persistencia;

import com.ogordo.model.Cliente;
import java.util.ArrayList;
import java.util.List;

// clientedao herda os atributos e metodos da classe Dao(responsável pela conexao com o banco).
public class ClienteDAO extends DAO {

    public void cadastrar(Cliente c) throws Exception {
        openDatabase();		// inicia a conexao com o banco
        
		// instrução sql para inserir dados no banco
		String sql = "INSERT INTO tbl_cliente VALUES (null, ?,?,?,?)";
        
		// a instrucao sql fica em stand by, aguandando setar as informações
		stmt = conexao.prepareStatement(sql);
		
		// aqui ssãoo setados os valos do objeto cliente para serem inseridos no banco
        stmt.setString(1, c.getNome());
        stmt.setString(2, c.getTelefone());
        stmt.setString(3, c.getEmail());
        stmt.setString(4, c.getSite());
		
		
        stmt.execute();		// a instrução SQL é executada
        CloseDatabase();	// fecha conexao com o banco
    }

    public void delete(Cliente c) throws Exception {
        openDatabase();
        String sql = "DELETE tbl_cliente WHERE clie+_cod_cliente=?";
        stmt = conexao.prepareStatement(sql);

        stmt.setInt(1, c.getCod_cliente());
        stmt.execute();
        CloseDatabase();
    }

    public List<Cliente> ListaClientes() throws Exception {
        openDatabase();
        String sql = "SELECT * FROM tbl_cliente";
        
		// esta lista vai armazenar cada cliente pesquisado no banco
		List<Cliente> listaClientes = new ArrayList<Cliente>();		
        
        stmt = conexao.prepareStatement(sql);
        
		// executa a instrução SQL e diz para o ResultSet armazenar os dados da pesquisa
		rs = stmt.executeQuery();
		
		// Enquanto existir próximo(algum cliente cadastrado)
        while(rs.next()){
            // cria um objeto para receber os dados de cada cliente
			Cliente c1 = new Cliente();
			
			// seta os valores para o objeto conforme conta nas colunas do BD
            c1.setCod_cliente(rs.getInt("clie_cod_cliente"));
            c1.setNome(rs.getString("clie_nome"));
            c1.setTelefone(rs.getString("clie_telefone"));
            c1.setEmail(rs.getString("clie_email"));
            c1.setSite(rs.getString("clie_site"));
			
			// adiciona o objeto cliente na lista
            listaClientes.add(c1);
        }
		
        CloseDatabase();
		
		// retorna os itens pesquisados
        return listaClientes;
    }

    public void update() throws Exception {
        openDatabase();
        String sql = "UPDATE tb_cliente set clie_nome=?, clie_telefone=?," +
                "clie_email=?, clie_site=? WHERE clie_cod_cliente=?";

        stmt = conexao.prepareStatement(sql);
        stmt.executeQuery(sql);
        
        CloseDatabase();
    }
}
