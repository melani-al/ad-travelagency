<%-- 
    Document   : menu
    Created on : 19-sep-2017, 17:10:03
    Author     : melania.alvarez
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MENU</title>
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
            <li><a> Bienvenido/a, ${user}</a></li>
        </ul>
        <h2>¿Qué quieres hacer?</h2>
        <p> <a href="http://localhost:8080/travelagency/altaVuelo.jsp">Alta vuelo nuevo</a> </p>
        <p> <a href="http://localhost:8080/travelagency/altaHotel.jsp">Alta hotel nuevo</a> </p>
        <p> <a href="http://localhost:8080/travelagency/buscarVuelo.jsp">Busca un vuelo</a> </p>
        <p> <a href="http://localhost:8080/travelagency/buscarHotel.jsp">Busca un hotel</a> </p>
    </body>
</html>
