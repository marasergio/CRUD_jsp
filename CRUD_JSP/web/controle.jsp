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
            request.getRequestDispatcher("novo.jsp").forward(request, response);

        }catch(Exception e){
            out.print("ERRO " + e.getMessage());
        }

    }else if(action.equalsIgnoreCase("excluir")){
         try{
            int cod_cliente = Integer.parseInt(request.getParameter("cod_cliente"));
            ClienteDAO cd = new ClienteDAO();
            Cliente c = new Cliente();

            c = cd.buscaPorId(cod_cliente);
            
            // apos a busca checar e excluir
            if(c.getCod_cliente()>0){
                cd.delete(c);
                request.setAttribute("msg", "Deletado com Sucesso!");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }

         }catch(Exception e){
             out.print("ERRO: " + e.getMessage());
         }
    }else if(action.equalsIgnoreCase("update")){

        Cliente c = new Cliente();
        c.setCod_cliente(new Integer(request.getParameter("cod_cliente")));
        c.setNome(request.getParameter("nome"));
        c.setTelefone(request.getParameter("telefone"));
        c.setEmail(request.getParameter("email"));
        c.setSite(request.getParameter("site"));
        ClienteDAO cd = new ClienteDAO();
        try{
        cd.update(c);
        request.setAttribute("msg", "Atualizado com sucesso!");
        request.getRequestDispatcher("atualizar.jsp").forward(request, response);

        }catch(Exception e){
        out.print("Erro:"+e.getMessage());
        }

    }



}catch(NullPointerException nexp){
    out.print("Voce nao devia estar vendo esta pagina");

}


%>
