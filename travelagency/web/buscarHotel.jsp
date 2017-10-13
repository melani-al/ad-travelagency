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
            <li><a href="http://localhost:8080/travelagency/menu.jsp"> Menú </a> </li>
            <li style="float:right" ><a href="http://localhost:8080/travelagency/login.jsp">Log out</a> </li>
        </ul>
        <h2>Searching for a Hotel</h2>
        
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
