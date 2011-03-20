<%@page import="com.ogordo.model.Cliente, com.ogordo.persistencia.ClienteDAO" %>
<%@page import="java.util.List"%>
<%--
    Document   : novo
    Created on : 19/03/2011, 22:03:16
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
        <h1>Cadastro de Cliente</h1>
        <form action="controle.jsp?action=cadastrar" method="post">
            <label form="nome">Nome: </label><br />
            <input type="text" name="nome" value="" /><br/>

            <label form="telefone">Telefone: </label><br />
            <input type="text" name="telefone" value="" /><br/>

            <label form="email">Email: </label><br />
            <input type="text" name="email" value="" /><br/>

            <label form="site">Site: </label><br />
            <input type="text" name="site" value="" /><br/>

            <input type="submit" value="Cadastrar cliente" />
        </form>
        <br />
        <a href="index.jsp">Voltar</a>
        <br />

        <!-- resgata a variavel msg determinada no controller -->
        <font style="color: red">
            ${msg}
        </font>

    </body>
</html>