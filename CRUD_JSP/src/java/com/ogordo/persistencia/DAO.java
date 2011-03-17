package com.ogordo.persistencia;

import com.mysql.jdbc.Connection;
import java.sql.*;

/*
	a finalidade dessa classe é fazer a conexão com o banco de dados
*/

public class DAO {
	// esta variavel recebe a conexao com o banco
    Connection conexao;
    PreparedStatement  stmt;
    ResultSet rs;
	
    public void openDatabase () throws Exception{
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/crud_jsp";
        String user = "root";
        String password = "mara";
		
		// usa o DriveManager para realizar a conexao.
        conexao = (Connection) DriverManager.getConnection(url, user, password);
    }
    public void CloseDatabase() throws Exception{
        if(conexao != null)
            conexao.close();
    }
}
