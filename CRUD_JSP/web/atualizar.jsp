<%@page import="com.ogordo.model.Cliente,com.ogordo.persistencia.ClienteDAO" %>

<%
try{

     int cod_cliente = Integer.parseInt(request.getParameter("cod_cliente"));

     ClienteDAO cd = new ClienteDAO();
     Cliente c = new Cliente();

     c = cd.buscaPorId(cod_cliente);
     if(c.getCod_cliente()>0){
 %>

 <form action="controle.jsp?action=update" method="post">
            
            <h3>Codigo do Cliente: <%= c.getCod_cliente()  %></h3>
            <label for="nome">Nome:</label><br />
            <input type="text" name="nome" value="<%= c.getNome()%>" /><br />
            <label for="telefone">Telefone:</label><br />
            <input type="text" name="telefone" value="<%= c.getTelefone()%>" /><br />
            <label for="email">Email:</label><br />
            <input type="text" name="email" value="<%= c.getEmail() %>" /><br />
            <label for="site">Site:</label><br />
            <input type="text" name="site" value="<%= c.getSite()%>" /><br />
            <input type="hidden" value="<%= c.getCod_cliente()%>" name="cod_cliente" />
            <input type="submit" value="Atualizar Cliente" />
 </form>
 <br />
 <a href="index.jsp">Voltar</a>
 <br />
 <font style="color: red">
     ${msg}
 </font>


 
<%
}
}catch(Exception e){


}

%>