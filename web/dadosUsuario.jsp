<%-- 
    Document   : dadosUsuario
    Created on : 3 de jan de 2024, 18:58:59
    Author     : joaopedro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="org.postgresql.Driver" %>
<%@page import="Criptografia.Criptografia" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
        <title>Dados do Usuário</title>
    </head>
    <body>
        <%
            HttpSession sessao = request.getSession();
            if (sessao.getAttribute("logado") == null || sessao.getAttribute("logado").equals("0")) {
                response.sendRedirect("index.jsp");
            }

            Connection con = null;
            Statement st = null;

        %>
        <div class="container">
            <div class="row">
                <div class="col-sm">
                    <h1>Atualizar Dados</h1>
                    <form action="dadosUsuario.jsp" method="post">
                        <div class="form-group">
                            <label>Nome do usuário</label>
                            <input type="text" class="form-control" name="nome" placeholder="Nome" value="<%=sessao.getAttribute("usuario")%>" required>
                        </div>
                        <div class="form-group">
                            <label>Senha</label>
                            <input type="password" class="form-control" name="senha" placeholder="Senha" required>
                        </div>
                        <div class="form-group">
                            <label>Repetir a Senha</label>
                            <input type="password" class="form-control" name="rep_senha" placeholder="Repetir a senha" required>
                        </div>
                        <button type="submit" name="enviar" class="btn btn-primary">Salvar <i class="bi bi-floppy"></i></button>
                        <a class="btn btn-danger" href="funcionarios.jsp" role="button">Cancelar <i class="bi bi-x-circle"></i></a>
                    </form>
                </div>
            </div>
            <%
                if (request.getParameter("enviar") != null) {
                    String usuario = request.getParameter("nome");
                    String senha = request.getParameter("senha");
                    String rep_senha = request.getParameter("rep_senha");

                    if (senha.equals(rep_senha)) {
                        try {
                            Class.forName("org.postgresql.Driver");
                            con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/mercado", "postgres", "root");
                            st = con.createStatement();

                            String query = "update usuarios set usuario = '" + usuario + "', senha = '" + Criptografia.criptografar(senha) + "' where id = '" + sessao.getAttribute("id") + "'; ";
                            st.execute(query);
                            st.close();

                            sessao.setAttribute("usuario", usuario);
                            response.sendRedirect("funcionarios.jsp");
                        } catch (Exception e) {
                            out.println("Erro:  " + e.getMessage());
                        }
                    } else {
            %>
            <div class="alert alert-danger mt-4" role="alert">
                Senhas diferentes!
            </div>
            <%
                    }
                }
            %>
        </div>
    </body>
</html>
