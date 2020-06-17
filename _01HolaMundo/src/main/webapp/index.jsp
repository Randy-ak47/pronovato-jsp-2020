<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hola Mundo!</h1>
        <p>Esta es mi prirmera página Web como programador.</p>
        <%
            String nombreDelProgramador = "Diego Simbaña";
            int edadDelProgramador = 34;
            String saludarAlProgramador = "Hola " + nombreDelProgramador+" a tus "+ edadDelProgramador+ " ya estas viejo.XD";
            out.println(saludarAlProgramador);
%>
    </body>
</html>
