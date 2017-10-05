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
    </head>
    <body>
        <h1>This is the menu page, ${user} </h1>
        <h2>Qué quieres hacer?</h2>
        <h3> <a href="http://localhost:8080/travelagency/altaVuelo.jsp">Alta vuelo nuevo</a> </h3>
        <h3> <a href="http://localhost:8080/travelagency/altaHotel.jsp">Alta hotel nuevo</a> </h3>
        <h3> <a href="http://localhost:8080/travelagency/buscarVuelo.jsp">Busca un vuelo</a> </h3>
        <h3> <a href="http://localhost:8080/travelagency/buscarHotel.jsp">Busca un hotel</a> </h3>
    </body>
</html>
