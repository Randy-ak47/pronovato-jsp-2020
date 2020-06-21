<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <h1>Formulario</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-4 col-sm-8">
                    <form action="index.jsp" method="post">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Programador escribe tu nombre</label>
                            <input type="text" class="form-control" name="nombreProgramador"  placeholder="Nombre">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Programador escribe tus ciclos humanoides</label>
                            <input type="text" class="form-control" name="edadProgramador"  placeholder="Edad">
                        </div>
                        <button type="submit" class="btn btn-primary">Enviar</button>
                    </form>
                </div>
            </div>
            <div class="row">
                <div class="col-4 col-sm-8">
                    <br>
                    <div class="alert alert-info" role="alert">
                        
                        <%
                            String nombre = request.getParameter("nombreProgramador");
                            String edad = request.getParameter("edadProgramador");
                            if (nombre != null && edad != null) {
                                int edadNumero = Integer.parseInt(edad);
                                String mensajeEdad = "";
                                if (edadNumero >= 1 && edadNumero <= 18) {
                                    mensajeEdad = "Programador inexperto";
                                }
                                if (edadNumero > 18 && edadNumero <= 30) {
                                    mensajeEdad = "Programador joven e inexperto";
                                }
                                if (edadNumero > 30 && edadNumero <= 65) {
                                    mensajeEdad = "Programador viejo";
                                }
                                out.println("Tu nombre es: " + nombre + " y tu edad es: " + edad + " años " + mensajeEdad);
                            } else {
                                out.println("Programador tienes que colocar tus datos.");
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>


    </body>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
</html>
