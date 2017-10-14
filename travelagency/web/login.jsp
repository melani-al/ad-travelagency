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
    <style>
            ul {
                list-style-type: none;
                margin: 0;
                padding: 0;
                overflow: hidden;
                background-color: #f3f3f3;;
            }

            li {
                float: left;
            }

            li a {
                display: block;
                color: #666;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
            }

            li a:hover {
                background-color: #ddd;
            }
        </style>
    </head>
    <body>
        <ul>
            <li><a> Aplicación web para una agencia de viajes</a></li>
        </ul>
        
        <form action="/travelagency/login" method="POST">
        Nombre de usuario:<br>
        <input type="text" name="id_usuario" required><br>
        Contraseña:<br>
        <input type="password" name="password" required><br><br>
        <input type="submit" value="Submit">
    </form>
    </body>
</html>
