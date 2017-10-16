<%-- 
    Document   : buscarHotel
    Created on : 25-sep-2017, 19:07:41
    Author     : Melani
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buscador de hoteles</title>
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
            l<i style="float:right; margin-top: 10px; margin-right: 5px">
                <form action="/travelagency/logout">
                <input type="submit" value="Logout">
                </form>
            </li>
        </ul>
        <h2>Buscando hotel</h2>
        <%
                Class.forName("org.sqlite.JDBC");
                Connection conn =
                     DriverManager.getConnection("jdbc:sqlite:C:\\Users\\Melani\\Desktop\\FIB\\TI\\AD\\LAB1\\ad-travelagency\\test");
                Statement stat = conn.createStatement();
 
                ResultSet rs = stat.executeQuery("select * from hoteles;");
                
                ArrayList<String> names = new ArrayList<String>();
                ArrayList<String> chain = new ArrayList<String>();
                ArrayList<String> city = new ArrayList<String>();
                
                while (rs.next()) {
                    if(!names.contains(rs.getString("nom_hotel"))) names.add(rs.getString("nom_hotel"));
                    if(!chain.contains(rs.getString("cadena"))) chain.add(rs.getString("cadena"));
                    if(!city.contains(rs.getString("ciudad"))) city.add(rs.getString("ciudad"));
                }
                
                rs.close();
                conn.close();
        %>
        <form action="/travelagency/BuscarHotel" method="POST">
            Nombre del hotel:<br>
            <select name=hotels>
                <option value="any">< Todos ></option>
                <%  for(int s=0; s<names.size(); s++) {    %>
                        <option value="<%=names.get(s)%>"><%=names.get(s)%></option>
                <% } %>
            </select>
            <br><br>
            Cadena hotelera:<br>
            <select name=cadenas>
                <option value="any">< Todas ></option>
                <%  for(int s=0; s<chain.size(); s++) {    %>
                        <option value="<%=chain.get(s)%>"><%=chain.get(s)%></option>
                <% } %>
            </select>
            <br><br>
            Ciudad:<br>
            <select name=ciudad>
                <option value="any">< Todas ></option>
                <%  for(int s=0; s<city.size(); s++) {    %>
                        <option value="<%=city.get(s)%>"><%=city.get(s)%></option>
                <% } %>
            </select>
            <br><br>
            <input type="submit" value="Submit">
        </form>
    </body>
</html>
