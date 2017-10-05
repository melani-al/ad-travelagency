<%-- 
    Document   : buscarHotel
    Created on : 25-sep-2017, 19:07:41
    Author     : Melani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Hotels</title>
    </head>
    <body>
        <h1>Searching for a Hotel</h1>
        
         <form action="/travelagency/BuscarHotel" method="post" accept-charset="UTF-8">
            <div>
                <div>
                </div>
                <input type="hidden" name="search_param" value="all" id="search_param"> 
                <input type="text" class="form-control" name="x" placeholder="Suchbegriff..">
                <span> 
                    <input type="submit" id="sign-in" value="search">
                </span>
            </div>
        </form>
    </body>
</html>
