<%-- 
    Document   : altahotel
    Created on : 19-sep-2017, 16:54:59
    Author     : melania.alvarez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Hotel</title>
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
        <h2>Adding a new Hotel</h2>
        <form action="/travelagency/altaHotel" method="POST">
            Hotel name:<br>
            <input type="text" name="nom_hotel" required><br>
            Chain:<br>
            <input type="text" name="cadena" required><br>
            Room number:<br>
            <input type="number" name="num_hab" required><br>
            Street:<br>
            <input type="text" name="calle" required><br>
            Number:<br>
            <input type="number" name="numero" required><br>
            Post Code:<br>
            <input type="text" name="codigo_postal" required><br>
            City:<br>
            <input type="text" name="ciudad" required><br>
            State:<br>
            <input type="text" name="provincia" required><br>
            Country:<br>
            <input type="text" name="pais" required><br><br>
            <input type="submit" value="Submit">
        </form>
    </body>
</html>
