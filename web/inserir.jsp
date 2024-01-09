<%-- 
    Document   : inserir
    Created on : 2 de jan de 2024, 12:03:35
    Author     : joaopedro
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="org.postgresql.Driver" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
        <title>Cadastro de Funcionário</title>
    </head>
    <body>
        <div class="container mt-5">
            <div>
                <h2 class="text-center"> Cadastro de Funcionário </h2>
            </div>
            <div class="row">
                <div class="col-sm">
                    <form action="inserir.jsp" method="post">
                        <div class="form-group">
                            <label>Nome do Funcionário</label>
                            <input type="text" class="form-control" name="nome_fun" placeholder="Nome" required>
                        </div>
                        <div class="form-group">
                            <label>Endereço do Funcionário</label>
                            <input type="text" class="form-control" name="endereco_fun" placeholder="Endereço" required>
                        </div>
                        <div class="form-group">
                            <label>Telefone do Funcionário</label>
                            <input type="text" class="form-control" name="telefone_fun" placeholder="Nome" required>
                        </div>

                        <button type="submit" class="btn btn-primary" name="enviar">Salvar <i class="bi bi-floppy"></i></button>
                        <a class="btn btn-secondary" href="funcionarios.jsp" role="button">Voltar</a>
                    </form>
                </div>
            </div>

        </div>
        <%
            if(request.getParameter("enviar") != null){
                String nome = request.getParameter("nome_fun");
                String endereco = request.getParameter("endereco_fun");
                String telefone = request.getParameter("telefone_fun");
                
                //out.println(nome);
                //out.println(endereco);
                //out.println(telefone);
            
            
                try {
                        Connection con = null;
                        Statement st = null;
                        //ResultSet rs = null;

                        Class.forName("org.postgresql.Driver");
                        con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/mercado", "postgres", "root");

                        st = con.createStatement();

                        String query = "insert into funcionarios (nome,endereco,telefone) values ('"+nome+"','"+endereco+"','"+telefone+"')";
                        //rs = st.executeQuery(query);
                        st.execute(query);
                        st.close();
                        //redirecinando a página
                        request.getRequestDispatcher("funcionarios.jsp").forward(request, response);
                    } catch (Exception e) {
                        out.print(e);
                }
            }
        %>
    </body>
</html>
