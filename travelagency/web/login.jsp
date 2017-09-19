<%-- 
    Document   : login
    Created on : 19-sep-2017, 16:53:29
    Author     : melania.alvarez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <form action="/travelagency/login" method="POST">
        User name:<br>
        <input type="text" name="id_usuario"><br>
        Password:<br>
        <input type="text" name="password"><br><br>
        <input type="submit" value="Submit">
    </form>
    </body>
</html>
