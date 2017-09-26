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
    </head>
    <body>
        <h1>Adding a new Hotel</h1>
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
