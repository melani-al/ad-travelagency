<%-- 
    Document   : buscarVuelo
    Created on : 25-sep-2017, 19:07:28
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
        <title>Buscador de vuelos</title>
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
        <h2>Buscando vuelo</h2>
        <%
                Class.forName("org.sqlite.JDBC");
                Connection conn =
                     DriverManager.getConnection("jdbc:sqlite:C:\\Users\\Melani\\Desktop\\FIB\\TI\\AD\\LAB1\\ad-travelagency\\test");
                Statement stat = conn.createStatement();
 
                ResultSet rs = stat.executeQuery("select * from vuelos;");
                
                ArrayList<String> num = new ArrayList<String>();
                ArrayList<String> com = new ArrayList<String>();
                ArrayList<String> salida = new ArrayList<String>();
                ArrayList<String> dest = new ArrayList<String>();
                
                while (rs.next()) {
                    if(!num.contains(rs.getString("num_vuelo"))) num.add(rs.getString("num_vuelo"));
                    if(!com.contains(rs.getString("companyia"))) com.add(rs.getString("companyia"));
                    if(!salida.contains(rs.getString("origen"))) salida.add(rs.getString("origen"));
                    if(!dest.contains(rs.getString("destino"))) dest.add(rs.getString("destino"));
                }
                
                rs.close();
                conn.close();
        %>
        <form action="/travelagency/BuscarVuelo" method="POST">
            Número de vuelo:<br>
            <select name=flight>
                <option value="any">< Todos ></option>
                <%  for(int s=0; s<num.size(); s++) {    %>
                        <option value="<%=num.get(s)%>"><%=num.get(s)%></option>
                <% } %>
            </select>
            <br><br>
            Compañia:<br>
            <select name=comp>
                <option value="any">< Todas ></option>
                <%  for(int s=0; s<com.size(); s++) {    %>
                        <option value="<%=com.get(s)%>"><%=com.get(s)%></option>
                <% } %>
            </select>
            <br><br>
            Ciudad de origen: <br>
            <select name=origen>
                <option value="any">< Todas ></option>
                <%  for(int s=0; s<salida.size(); s++) {    %>
                        <option value="<%=salida.get(s)%>"><%=salida.get(s)%></option>
                <% } %>
            </select>
            <br><br>
            Ciudad de destino: <br>
            <select name=dest>
                <option value="any">< Todas ></option>
                <%  for(int s=0; s<dest.size(); s++) {    %>
                        <option value="<%=dest.get(s)%>"><%=dest.get(s)%></option>
                <% } %>
            </select>
            <br><br>
            <input type="submit" value="Submit">
        </form>
    </body>
</html>
