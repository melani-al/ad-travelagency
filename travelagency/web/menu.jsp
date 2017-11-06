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
            <li style="float:right; margin-top: 10px; margin-right: 5px">
                <form action="/travelagency/logout">
                <input type="submit" value="Logout">
                </form>
            </li>
        </ul>
        <h2>¿Qué quieres hacer?</h2>
        <p> <a href="/travelagency/altaVuelo.jsp">Alta vuelo nuevo</a> </p>
        <p> <a href="/travelagency/altaHotel.jsp">Alta hotel nuevo</a> </p>
        <p> <a href="/travelagency/buscarVuelo.jsp">Busca un vuelo</a> </p>
        <p> <a href="/travelagency/buscarHotel.jsp">Busca un hotel</a> </p>
    </body>
</html>
