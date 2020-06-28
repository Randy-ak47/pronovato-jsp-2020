<%-- 
    Document   : datos_usuario
    Created on : 21-jun-2020, 18:03:33
    Author     : Randy
--%>

<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>Usuario</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
                response.sendRedirect("login.jsp");
            }
            Connection con = null;
            Statement st = null;
        %>
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-sm-6">
                    <form method="post">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Usuario</label>
                            <input name="usuario" type="text" class="form-control" value="<%= sesion.getAttribute("usuario")%>" id="exampleInputEmail1" aria-describedby="emailHelp">
                            <small id="emailHelp" class="form-text text-muted"> Inserta tu usuario.</small>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Password</label>
                            <input name="password_1" type="password" class="form-control" id="exampleInputPassword1" required="required"  >
                            <small id="emailHelp" class="form-text text-muted">Inserta tu contraseña.</small>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword2">Confirmar Password</label>
                            <input name="password_2" type="password" class="form-control" id="exampleInputPassword1" required="required" >
                            <small id="emailHelp2" class="form-text text-muted">Repite tu contraseña.</small>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block" name="guardar">
                            <i class="fa fa-floppy-o" aria-hidden="true"></i>
                            Guardar
                        </button>
                        <a href="empleados.jsp" class="btn btn-danger btn-block">
                            <i class="fa fa-ban" aria-hidden="true"></i>
                            Cancelar
                        </a>
                        <%
                            request.setCharacterEncoding("UTF-8");
                            String usuario = request.getParameter("usuario");
                            String password1 = request.getParameter("password_1");
                            String password2 = request.getParameter("password_2");
                            //String usuario = new String(request.getParameter("usuario").getBytes("iso-8859-1"), "utf-8");
                            //String password1 = new String(request.getParameter("pasword_1").getBytes("iso-8859-1"), "utf-8");
                            //String password2 = new String(request.getParameter("pasword_2").getBytes("iso-8859-1"), "utf-8");

                            if (request.getParameter("guardar") != null) {
                                if (password1 == "" && password2 == "") {
                                    out.print("<br><div class='alert alert-danger' role='alert'>Contraseña vacia!</div>");

                                } else {

                                    if (password1.equals(password2)) {

                                        try {
                                            Class.forName("com.mysql.jdbc.Driver");
                                            con = DriverManager.getConnection("jdbc:mysql://localhost/pronovato_jsp_2020?user=root&password=");
                                            st = con.createStatement();
                                            String sql = ("UPDATE user SET user = '" + usuario + "', password ='" + getMD5(password1) + "' WHERE id = '" + sesion.getAttribute("id") + "';");
                                            st.execute(sql);
                                            sesion.setAttribute("usuario", usuario);
                                        } catch (Exception e) {
                                            out.println(e.getMessage());
                                        }
                                        request.getRequestDispatcher("empleados.jsp").forward(request, response);
                                    } else {
                                        out.print("<br><div class='alert alert-danger' role='alert'>Las contraseñas no coinciden!</div>");
                                    }
                                }
                            } else {

                            }

                        %>
                    </form> 
                </div>
            </div> 
        </div>
    </body>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
</html>
<%!
    public String getMD5(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] encBytes = md.digest(input.getBytes());
            BigInteger numero = new BigInteger(1, encBytes);
            String encString = numero.toString(16);
            while (encString.length() < 32) {
                encString = "0" + encString;
            }
            return encString;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
%>
