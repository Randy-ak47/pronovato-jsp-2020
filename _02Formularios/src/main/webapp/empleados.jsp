<%-- 
    Document   : empleados
    Created on : 20-jun-2020, 21:42:57
    Author     : Diego Simbaña
--%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
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
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/pronovato_jsp_2020?user=root&password=");
                st = con.createStatement();
                String sql = ("SELECT * FROM empleados;");
                rs = st.executeQuery(sql);
        %>
        <div class="container">
            <nav class="navbar navbar-light bg-light">
                <a class="navbar-brand">MiLibreta</a>
                <form class="form-inline" action="logout.jsp">

                    <a href="datos_usuario.jsp" data-toggle="tooltip" data-placement="top" title="Editar datos usuario">
                        <i class="fa fa-user-circle" aria-hidden="true"></i>
                        <%= sesion.getAttribute("usuario")%>
                    </a>

                    <button class="btn btn-outline-danger my-2 my-sm-0 ml-2" type="submit">Log out</button>
                </form>
            </nav>
            <div class="row">
                <div class="col col-sm">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col"colspan="4" class="text-center"><h3>Empleados</h3></th>
                                <th scope="col">
                                    <a href="crear_empleados.jsp" data-toggle="tooltip" data-placement="top" title="Crear nuevo usuario">
                                        <i class="fa fa-user-plus" aria-hidden="true" ></i>
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
                            <% while (rs.next()) {%>       

                            <tr>
                                <th scope="row"><%= rs.getString(1)%></th>
                                <td><%= rs.getString(2)%></td>
                                <td><%= rs.getString(3)%></td>
                                <td><%= rs.getString(4)%></td>
                                <td>
                                    <a href="editar_empleados.jsp?id=<%= rs.getString(1)%>&nombre=<%= rs.getString(2)%>&direccion=<%= rs.getString(3)%>&telefono=<%= rs.getString(4)%>&" data-toggle="tooltip" data-placement="top" title="Editar usuario">
                                        <i class="fa fa-pencil" aria-hidden="true"></i>
                                    </a>
                                    <a href="eliminar_empleados.jsp?id=<%= rs.getString(1)%>" data-toggle="tooltip" data-placement="top" title="Eliminar usuario">
                                        <i class="fa fa-trash-o ml-2" aria-hidden="true"></i>
                                    </a>
                                </td>

                            </tr>
                            <%
                                    }
                                } catch (Exception e) {
                                    out.println("error en Mysql " + e.getMessage());
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
            
        </div>
    </body>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="js/myscript.js"></script>
</html>
