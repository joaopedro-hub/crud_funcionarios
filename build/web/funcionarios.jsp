<%-- 
    Document   : funcionarios
    Created on : 1 de jan de 2024, 17:35:34
    Author     : joaopedro
--%>

<%@page import="java.sql.*" %>
<%@page import="org.postgresql.Driver" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
        <title>Página de Funcionários</title>
    </head>
    <body>

        <%
            HttpSession sessao = request.getSession();
            if (sessao.getAttribute("logado") == null || sessao.getAttribute("logado").equals("0")) {
                response.sendRedirect("index.jsp");
            }

            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
        %>
        <div class="container">
            <nav class="navbar navbar-dark bg-dark">
                <a class="navbar-brand text-light">Área do Usuário</a>
                <form class="form-inline" action="logout.jsp">
                    <a href="dadosUsuario.jsp" class="mr-2 text-light"><i class="bi bi-person-circle mr-2"></i><%=sessao.getAttribute("usuario")%></a>
                    <button class="btn btn-outline-danger my-2 my-sm-0" type="submit">Sair</button>
                </form>
            </nav>
            <div>
                <h2 class="text-center mt-4 mb-2"> Tabela de Funcionários </h2>
            </div>
        </div>
        <div class="container">
            <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col" colspan="4">Funcionários</th>
                        <th scope="col">
                            <a href="inserir.jsp"> <i class="bi bi-person-add h4"></i> </a>
                        </th>
                    </tr>
                </thead>
                <thead class="thead-light">
                    <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Nome</th>
                        <th scope="col">Endereço</th>
                        <th scope="col">Telefone</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        try {

                            Class.forName("org.postgresql.Driver");
                            con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/mercado", "postgres", "root");
                            st = con.createStatement();

                            rs = st.executeQuery("select * from funcionarios");
                            while (rs.next()) {
                    %>
                    <tr>
                        <th scope="row"><% out.println(rs.getInt("id")); %></th>
                        <td><% out.println(rs.getString("nome")); %></td>
                        <td><% out.println(rs.getString("endereco")); %></td>
                        <td><% out.println(rs.getString("telefone")); %></td>
                        <td>
                            <a href="editar.jsp?id=<%out.println(rs.getInt("id"));%>&nome=<%out.println(rs.getString("nome"));%>&endereco=<%out.println(rs.getString("endereco"));%>&telefone=<%out.println(rs.getString("telefone"));%>"><i class="bi bi-pencil mr-2" title="Editar"></i></a>

                            <a href="excluir.jsp?id=<%out.println(rs.getInt("id"));%>"><i class="bi bi-trash" title="Excluir"></i></a>
                        </td>
                    </tr>
                    <%

                            }
                        } catch (Exception e) {
                            out.println(e.getMessage());
                        }
                        rs.close();
                    %>
                </tbody>
            </table>
        </div>
    </body>
</html>
