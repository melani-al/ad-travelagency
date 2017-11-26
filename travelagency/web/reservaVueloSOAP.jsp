<%-- 
    Document   : reservaHotelSOAP
    Created on : 26-nov-2017, 18:47:48
    Author     : Melani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta Plazas Vuelo SOAP</title>
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
        <h2>Consulta plazas libres: </h2>
        <form action="/travelagency/ReservaVueloSOAP" method="GET">
            Identificador del vuelo:<br>
            <input type="text" name="id_vuelo" required><br><br>
            Fecha (YYYYMMDD):<br>
            <input type="number" name="fecha" required><br><br>
            Número de plazas:<br>
            <input type="number" name="num" required><br><br>
            <input type="submit" value="Submit">
        </form>
    </body>
</html>