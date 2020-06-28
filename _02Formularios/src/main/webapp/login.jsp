<%-- 
    Document   : login
    Created on : 21-jun-2020, 17:01:18
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
        <title>Login</title>
    </head>
    <body>
        <div class="container mt-5 " >
            <div class="row justify-content-center">
                <div class="col-md-4">

                    <form method="post">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Usuario</label>
                            <input name="usuario" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                            <small id="emailHelp" class="form-text text-muted">Programador inserta tu usuario.</small>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Password</label>
                            <input name="password" type="password" class="form-control" id="exampleInputPassword1">
                            <small id="emailHelp" class="form-text text-muted">Programador inserta tu contraseña.</small>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block" name="login" id="alerta">Login</button>
                        <%
                            Connection con = null;
                            Statement st = null;
                            ResultSet rs = null;

                            if (request.getParameter("login") != null) {
                                request.setCharacterEncoding("UTF-8");
                                String usuario = new String(request.getParameter("usuario").getBytes("iso-8859-1"), "utf-8");
                                String password = new String(request.getParameter("password").getBytes("iso-8859-1"), "utf-8");
                                HttpSession sesion = request.getSession();
                                /*
                                if (usuario.equals("admin") && password.equals("1234")) {
                                    sesion.setAttribute("logueado", "1");
                                    sesion.setAttribute("usuario", usuario);
                                    response.sendRedirect("empleados.jsp");
                                } else {
                                    out.print("Programador te equivocaste o contraseña invalida.");
                                }*/
                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    con = DriverManager.getConnection("jdbc:mysql://localhost/pronovato_jsp_2020?user=root&password=");
                                    st = con.createStatement();
                                    String sql = ("SELECT * FROM user WHERE user='" + usuario + "' and password = '" + getMD5(password) + "';");
                                    rs = st.executeQuery(sql);

                                    if (rs.next()) {
                                        sesion.setAttribute("logueado", "1");
                                        sesion.setAttribute("usuario", rs.getString("user"));
                                        sesion.setAttribute("id", rs.getString("id"));
                                        //response.sendRedirect("empleados.jsp");
                                        request.getRequestDispatcher("empleados.jsp").forward(request, response);
                                        
                                    }else{
                                    out.print("<br><div class='alert alert-danger' role='alert'>Error de usuario o contraseña!</div>");
                                    }
                                } catch (Exception e) {
                                }
                            }
                        %>
                    </form> 

                </div>
            </div>
            <div class="row">
                <div class="col col-sm alert alert-primary mt-5">
                    <p> La ofensa es como un buen haiku: puede ignorarse, desconocerse, perdonarse o borrarse, pero nunca puede ser olvidada.           <br> Mi hoja es mi alma. Mi alma pertenece a mi Daimyo. 
                        <br> Ultrajar mi hoja es afrentar a mi Daimyo.
                        <br> La muerte no es eterna; el deshonor, sí.</p>
                </div>
            </div>
        </div>


        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <!-- JS dependencies -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!--  sweetalert -->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <!-- bootbox code -->
        <script src="js/bootbox.all.min.js"></script>

        <script>
            /*
            $(document).ready(function () {
                $("#alerta").click(function () {
                    swal("Error!", "No coinciden usuario y contraseña", "warning");
                });
            });
     * 
             */
        </script>
    </body>
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