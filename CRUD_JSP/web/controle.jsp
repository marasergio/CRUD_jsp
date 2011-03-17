<%@page import="com.ogordo.persistencia.ClienteDAO,com.ogordo.model.Cliente"%>

<%

String action = request.getParameter("action");

try{
    if(action.equalsIgnoreCase("cadastrar")){
        Cliente c = new Cliente();
        c.setNome(request.getParameter("nome"));
        c.setTelefone(request.getParameter("telefone"));
        c.setEmail(request.getParameter("email"));
        c.setSite(request.getParameter("site"));

        ClienteDAO cd = new ClienteDAO();

        try{
            cd.cadastrar(c);
            //out.print("Cadastrado com sucesso");

            // Aqui atribui uma variavel msg que recebe um texto para ser exibida na index
            request.setAttribute("msg", "Cadastrado com Sucesso!");
            request.getRequestDispatcher("index.jsp").forward(request, response);

        }catch(Exception e){
            out.print("ERRO " + e.getMessage());

        }

    }



}catch(NullPointerException nexp){
    out.print("Voc? n?o devia estar vendo esta p?gina");

}


%>
