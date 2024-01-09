<%-- 
    Document   : excluir
    Created on : 3 de jan de 2024, 09:42:38
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
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Connection con = null;
            Statement st = null;
            
            try {
                    Class.forName("org.postgresql.Driver");
                    con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/mercado", "postgres", "root");
                    st = con.createStatement();
                    st.execute("delete from funcionarios where id = '"+request.getParameter("id")+"';");
                    st.close();
                    request.getRequestDispatcher("funcionarios.jsp").forward(request, response);
                } catch (Exception e) {
                    out.println("Erro: " + e.getMessage());
                }
        %>
    </body>
</html>
