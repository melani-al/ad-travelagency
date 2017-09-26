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
    </head>
    <body>
        <h1>Adding a new flight</h1>
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
