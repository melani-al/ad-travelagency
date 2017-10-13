<%-- 
    Document   : buscarVuelo
    Created on : 25-sep-2017, 19:07:28
    Author     : Melani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search flights</title>
            <style>
            ul {
                list-style-type: none;
                margin: 0;
                padding: 0;
                overflow: hidden;
                background-color: #333;
            }

            li {
                float: right;
            }

            li a {
                display: block;
                color: white;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
            }

            li a:hover {
                background-color: #111;
            }
        </style>
    </head>
    <body>
        <ul>
            <li><a href="http://localhost:8080/travelagency/login.jsp">Log out</a> </li>
            <li><a href="http://localhost:8080/travelagency/menu.jsp">Menú</a> </li>
            <li><a> Bienvenido/a, ${user}</a></li>
        </ul>
        <h2>Searching for a flight</h2>
    </body>
</html>
