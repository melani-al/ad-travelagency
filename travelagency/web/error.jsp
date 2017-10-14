<%-- 
    Document   : error
    Created on : 19-sep-2017, 16:56:14
    Author     : melania.alvarez
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ERROR</title>
    </head>
    <body>
        <h1 style="color: red; ">ERROR</h1>
        <c:choose>
            <c:when test="${loginError}">
                <p>Algo salió mal. ¡Ingrese de nuevo! <a href="/travelagency/login.jsp" data-toggle="tab" style="color:blue">Aqui</a></p>
            </c:when>
            <c:when test= "${altaVueloError}">
                <p>Algo salió mal. ¡Intenta agregar un vuelo nuevamente! <a href="/travelagency/altaVuelo.jsp" data-toggle="tab">Aqui</a></p>
            </c:when>
            <c:when test= "${altaHotelError}">
                <p>Algo salió mal. ¡Intenta agregar un hotel nuevamente! <a href="/travelagency/altaHotel.jsp" data-toggle="tab">Aqui</a></p>
            </c:when>
            <c:when test= "${buscarVueloError}">
                <p>Algo salió mal. ¡Intenta buscar un vuelo nuevamente! <a href="/travelagency/buscarHotel.jsp" data-toggle="tab">Aqui</a></p>
            </c:when>
            <c:when test= "${buscarHotelError}">
                <p>Algo salió mal. ¡Intenta buscar un hotel nuevamente! <a href="/travelagency/buscarHotel.jsp" data-toggle="tab">Aqui</a></p>
            </c:when>
        </c:choose>
        
    </body>
</html>
