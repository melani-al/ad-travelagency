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
        <title>Añadir Hotel</title>
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
            <li><a href="/travelagency/menu.jsp"> Menú </a> </li>
            <li style="float:right; margin-top: 10px; margin-right: 5px">
                <form action="/travelagency/logout">
                <input type="submit" value="Logout">
                </form>
            </li>
        </ul>
        <h2>Dar de alta nuevo hotel</h2>
        <form action="/travelagency/altaHotel" method="POST">
            Nombre del hotel:<br>
            <input type="text" name="nom_hotel" required><br>
            Cadena:<br>
            <input type="text" name="cadena" required><br>
            Número de habitación:<br>
            <input type="number" name="num_hab" required><br>
            Calle:<br>
            <input type="text" name="calle" required><br>
            Número:<br>
            <input type="number" name="numero" required><br>
            Código postal:<br>
            <input type="text" name="codigo_postal" required><br>
            Ciudad:<br>
            <input type="text" name="ciudad" required><br>
            Provincia:<br>
            <input type="text" name="provincia" required><br>
            País:<br>
            <input type="text" name="pais" required><br><br>
            <input type="submit" value="Submit">
        </form>
    </body>
</html>
