<%-- 
    Document   : logout
    Created on : 3 de jan de 2024, 18:46:34
    Author     : joaopedro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            HttpSession sessao = request.getSession();
            sessao.invalidate();
            response.sendRedirect("index.jsp");
        %>
    </body>
</html>
