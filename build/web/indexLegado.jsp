<%-- 
    Document   : index
    Author     : joaopedro
--%>
<!-- https://www.youtube.com/watch?v=ST6RovESrFU&list=PLCTD_CpMeEKRAgcBmPee0Wjx5HsJ0nb0L&index=14 -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form action="index.jsp" method="post">
                        <div class="form-group">
                            <label> Escreva o seu nome </label>
                            <input type="text" class="form-control" name="nome" placeholder="Nome">
                        </div>
                        <div class="form-group">
                            <label> Qual é sua idade? </label>
                            <input type="text" class="form-control" name="idade" placeholder="Idade">
                        </div>
                        <button type="submit" class="btn btn-primary">Enviar</button>
                    </form>
                </div>
            </div>
            <div class="row">
                <div class="col-sm">

                    <%
                        String nome = request.getParameter("nome");
                        String idade = request.getParameter("idade");
                        if (nome != null && idade != null) {
                    %>
                    <div class="alert alert-primary mt-1" role="alert">
                        <%
                            String frase = "Olá " + nome + ", você têm " + idade + " anos de idade.";
                            out.println(frase);
                        } else {
                        %>
                        <div class="alert alert-warning mt-1" role="alert">
                            <%
                                    out.println("Algum dado Faltando!");
                                }
                            %>

                        </div>
                    </div>
                </div>
            </div>
            <p class="lead" ><a href="funcionarios.jsp"> Funcionarios </a></p>
    </body>
</html>
