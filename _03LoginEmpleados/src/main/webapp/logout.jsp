<%-- 
    Document   : logout
    Created on : 21-jun-2020, 17:49:51
    Author     : Randy
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
            HttpSession sesion = request.getSession();
            sesion.invalidate();
            response.sendRedirect("login.jsp");
        %>
    </body>
</html>
