<%-- 
    Document   : altaVuelo
    Created on : 19-sep-2017, 16:54:30
    Author     : melania.alvarez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New flight</title>
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
                border-right:1px solid #bbb;
            }

            li:last-child {
                border-right: none;
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
            <li><a> Bienvenido/a, ${user}</a></li>
            <li><a href="http://localhost:8080/travelagency/menu.jsp"> Menú </a> </li>
            <li style="float:right" ><a href="http://localhost:8080/travelagency/login.jsp">Log out</a> </li>
        </ul>
        <h2>Adding a new flight</h2>
        <form action="/travelagency/altaVuelo" method="POST">
            Flight number:<br>
            <input type="text" name="num_vuelo" required><br>
            Airline:<br>
            <input type="text" name="companyia" required><br>
            Origin city:<br>
            <input type="text" name="origen" required><br>
            Destination city:<br>
            <input type="text" name="destino" required><br>
            Arrival time:<br>
            <input type="text" name="hora_llegada" required><br>
            Departure time:<br>
            <input type="text" name="hora_salida" required><br><br>
            <input type="submit" value="Submit">
        </form>
    </body>
</html>
