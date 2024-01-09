<%-- 
    Document   : index
    Created on : 1 de jan de 2024, 09:32:56
    Author     : joaopedro

    Based on template by Mutiullah Samim
--%>

<%-- https://www.youtube.com/watch?v=yxk-bUIGBhw&list=PLCTD_CpMeEKRAgcBmPee0Wjx5HsJ0nb0L&index=15 --%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="org.postgresql.Driver" %>
<%@page import="Criptografia.Criptografia" %>

<html>
    <head>
        <title>Página de Login</title>
        <!--Made with love by Mutiullah Samim -->

        <!--Bootsrap 4 CDN-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <!--Fontawesome CDN-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

        <!--Custom styles-->
        <link rel="stylesheet" type="text/css" href="estilos/estilo_login.css">
    </head>
    <body>
        <div class="container">
            <div class="d-flex justify-content-center h-100">
                <div class="card">
                    <div class="card-header">
                        <h3>Entrar</h3>
                        <div class="d-flex justify-content-end social_icon">
                            <span><i class="fab fa-whatsapp-square"></i></span>
                            <span><i class="fab fa-youtube-square"></i></span>
                            <span><i class="fab fa-twitter-square"></i></span>
                        </div>
                    </div>
                    <div class="card-body">
                        <form method="post" action="index.jsp">
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                </div>
                                <input type="text" class="form-control" name="usuario" placeholder="Usuário" required>

                            </div>
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                                </div>
                                <input type="password" class="form-control" name="senha" placeholder="Senha" required>
                            </div>
                            <div class="row align-items-center remember">
                                <input type="checkbox">Lembre de Mim
                            </div>
                            <div class="form-group">
                                <input type="submit" value="Login" name="login" class="btn float-right login_btn">
                            </div>
                        </form>
                    </div>
                    <div class="card-footer">
                        <div class="d-flex justify-content-center links">
                            Não tem uma conta?<a href="#">Inscreva-se</a>
                        </div>
                        <div class="d-flex justify-content-center links">
                            <a href="#">Esqueceu sua senha?</a>
                        </div>
                    </div>
                    <%
                        if (request.getParameter("login") != null) {

                            String user = request.getParameter("usuario");
                            String senha = request.getParameter("senha");

                            HttpSession sessao = request.getSession();

                            Connection con = null;
                            Statement st = null;
                            ResultSet rs = null;

                            try {
                                Class.forName("org.postgresql.Driver");

                                con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/mercado", "postgres", "root");
                                st = con.createStatement();

                                rs = st.executeQuery("select * from usuarios where usuario = '" + user + "' and senha = '" + Criptografia.criptografar(senha) + "';");
 
                                while (rs.next()) {
                                    sessao.setAttribute("logado", "1");
                                    sessao.setAttribute("usuario", rs.getString("usuario"));
                                    sessao.setAttribute("id", rs.getString("id"));
                                    response.sendRedirect("funcionarios.jsp");
                                }
                    %>
                                <div class="alert alert-danger mt-4" role="alert">
                                    Nome do usuário ou senha incorreto!
                                </div>
                    <%
                            } catch (Exception e) {
                            }
                        }
                        /*if (request.getParameter("login") != null) {

                            String user = request.getParameter("usuario");
                            String senha = request.getParameter("senha");

                            HttpSession sessao = request.getSession();
                            if (user.equals("admin") && senha.equals("admin")) {
                                sessao.setAttribute("logado", "1");
                                sessao.setAttribute("user", user);
                                response.sendRedirect("funcionarios.jsp");
                            } else {*/
                    %>
                    <!--<div class="alert alert-danger mt-4" role="alert">
                        Nome do usuário ou senha incorreto!
                    </div>-->
                    <%
                        //}
                        //}
%>
                </div>
            </div>
        </div>
    </body>
</html>