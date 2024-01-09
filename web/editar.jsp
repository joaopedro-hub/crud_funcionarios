<%-- 
    Document   : editar
    Created on : 2 de jan de 2024, 17:56:18
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
        <title>Edição funcionário</title>
    </head>
    <body>
        <%
            String id = request.getParameter("id");
            String nome = request.getParameter("nome");
            String endereco = request.getParameter("endereco");
            String telefone = request.getParameter("telefone");
        %>
        <div class="container mt-5">
            <div>
                <h2 class="text-center"> Editar Funcionário </h2>
            </div>
            <div class="row">
                <div class="col-sm">
                    <form action="editar.jsp" method="get">
                        <div class="form-group">
                            <label>Nome do Funcionário</label>
                            <input type="text" class="form-control" value="<%=nome%>" name="nome" placeholder="Nome" required>
                        </div>
                        <div class="form-group">
                            <label>Endereço do Funcionário</label>
                            <input type="text" class="form-control" value="<%=endereco%>" name="endereco" placeholder="Endereço" required>
                        </div>
                        <div class="form-group">
                            <label>Telefone do Funcionário</label>
                            <input type="text" class="form-control" value="<%=telefone%>" name="telefone" placeholder="Nome" required>
                        </div>
                        <input type="hidden" name="id" value="<%=id%>">
                        <button type="submit" class="btn btn-primary" name="editar">Salvar <i class="bi bi-floppy"></i></button>
                        <a class="btn btn-danger" href="funcionarios.jsp" role="button">Cancelar <i class="bi bi-x-circle"></i></a>
                    </form>
                </div>
            </div>
        </div>

        <%
            if (request.getParameter("editar") != null) {
                //String nomeEd = request.getParameter("nome_fun");
                //String enderecoEd = request.getParameter("endereco_fun");
                //String telefoneEd = request.getParameter("telefone_fun");
                
                try {
                    Connection con = null;
                    Statement st = null;

                    Class.forName("org.postgresql.Driver");
                    con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/mercado", "postgres", "root");

                    st = con.createStatement();

                    String query = "update funcionarios set nome = '"+nome+"',endereco = '"+endereco+"',telefone = '"+telefone+"' where id = '"+id+"';";
                    //rs = st.executeQuery(query);
                    st.execute(query);
                    st.close();
                    //redirecinando a página
                    //request.getRequestDispatcher("funcionarios.jsp").forward(request, response);
                } catch (Exception e) {
                    out.print(e);
                }
            }
        %>
    </body>
</html>
