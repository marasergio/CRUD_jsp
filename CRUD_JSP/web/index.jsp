<%@page import="com.ogordo.model.Cliente, com.ogordo.persistencia.ClienteDAO" %>
<%@page import="java.util.List"%>
<%-- 
    Document   : index
    Created on : 17/03/2011, 01:03:16
    Author     : Mara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CRUD JSP</title>
    </head>
    <body>
         <!-- Listagem de contatos -->
        <h1>Lista de Clientes</h1>
        <table width="100%" border="1">
            <tr>
                <th>Código cliente</th>
                <th>Nome</th>
                <th>Telefone</th>
                <th>Email</th>
                <th>Site</th>
                <th>Excluir</th>
                <th>Atualizar</th>
            </tr>
            <%
            try{
                ClienteDAO cd = new ClienteDAO();
                List<Cliente> lista = cd.ListaClientes();
                for(Cliente c : lista ){
            %>

            <tr>
                <td><%= c.getCod_cliente() %></td>
                <td><%= c.getNome() %></td>
                <td><%= c.getTelefone() %></td>
                <td><%= c.getEmail() %></td>
                <td><%= c.getSite() %></td>
                <td><% out.print("<a href=controle.jsp?action=excluir&cod_cliente="+c.getCod_cliente()+ ">Excluir</a>"); %></td>
                <td><% out.print("<a href=atualizar.jsp?cod_cliente=" + c.getCod_cliente() +">Atualizar</a>" ); %></td>
                
            </tr>

            <%
            }
            }catch(Exception e){
                out.print("ERRO " + e);
            }
            %>
        </table>
        <a href="novo.jsp">Cadastrar Cliente</a>
        <!-- FIM - Listagem de contatos -->
        <br /><br />

        <!-- resgata a variavel msg determinada no controller -->
        <font style="color: red">
            ${msg}
        </font>
    </body>
</html>
