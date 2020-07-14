<%-- 
    Document   : empleados
    Created on : 20-jun-2020, 21:42:57
    Author     : Diego Simbaña
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>Empleados</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
                response.sendRedirect("login.jsp");
            }
        %>
        <div class="container">
            <nav class="navbar navbar-light bg-light">
                <a class="navbar-brand">Tabla Empleados</a>
                <form class="form-inline" action="logout.jsp">

                    <a href="datos_usuario.jsp">
                        <i class="fa fa-user-circle" aria-hidden="true"></i>
                        <%= sesion.getAttribute("usuario")%>
                    </a>

                    <button class="btn btn-outline-danger my-2 my-sm-0 ml-2" type="submit">Log out</button>
                </form>
            </nav>
            <div class="row">
                <div class="col col-sm">
                    <form method="get" action="empleados.jsp">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col"class="text-center">
                                    </th>
                                    <th scope="col"class="text-center">
                                        <input type="text" name="nombre" value="" class="form-control" placeholder="Buscar por nombre" />
                                    </th>
                                    <th scope="col"class="text-center">
                                        <input type="submit" value="buscar" name="buscar" class="form-control btn btn-primary"/>
                                    </th>
                                    <th> </th>
                                    <th scope="col">
                                        <a href="crear_empleados.jsp">
                                            <i class="fa fa-user-plus" aria-hidden="true"></i>
                                        </a>
                                    </th>
                                </tr>
                                <tr>
                                    <th scope="col">Id</th>
                                    <th scope="col">Nombre</th>
                                    <th scope="col">Dirección</th>
                                    <th scope="col">Teléfono</th>
                                    <th scope="col">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <jsp:include page="Empleados"/>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>

        </div>
    </body>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
</html>
