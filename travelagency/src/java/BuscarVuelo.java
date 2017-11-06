
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Melani
 */

@WebServlet(urlPatterns = {"/BuscarVuelo"})
public class BuscarVuelo extends HttpServlet {
    
        /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Connection connection = null;
        
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head><title>Resultado vuelos</title><style>\n" +
        "            ul {\n" +
        "                list-style-type: none;\n" +
        "                margin: 0;\n" +
        "                padding: 0;\n" +
        "                overflow: hidden;\n" +
        "                background-color: #f3f3f3;;\n" +
        "            }\n" +
        "\n" +
        "            li {\n" +
        "                float: left;\n" +
        "                border-right:1px solid #bbb;\n" +
        "            }\n" +
        "\n" +
        "            li:last-child {\n" +
        "                border-right: none;\n" +
        "            }\n" +
        "\n" +
        "            li a {\n" +
        "                display: block;\n" +
        "                color: #666;\n" +
        "                text-align: center;\n" +
        "                padding: 14px 16px;\n" +
        "                text-decoration: none;\n" +
        "            }\n" +
        "\n" +
        "            li a:hover {\n" +
        "                background-color: #ddd;\n" +
        "            }\n" + "table {\n" +
        "    font-family: arial, sans-serif;\n" +
        "    border-collapse: collapse;\n" +
        "    width: 100%;\n" +
        "}\n" +
        "\n" +
        "td, th {\n" +
        "    border: 1px solid #dddddd;\n" +
        "    text-align: left;\n" +
        "    padding: 8px;\n" +
        "}\n" +
        "\n" +
        "tr:nth-child(even) {\n" +
        "    background-color: #dddddd;\n" +
        "}" +        
        "        </style></head>");
        out.println("<body> <ul>\n" +
"            <li><a> Bienvenido/a, " + request.getSession().getAttribute("user") + "</a></li>\n" +
"            <li><a href=\"/travelagency/menu.jsp\"> Menú </a> </li>\n" +
"            <li style=\"float:right\" ><a href=\"/travelagency/login.jsp\">Log out</a> </li>\n" +
"        </ul>");
        out.println("<h2>Resultado de tu busqueda de vuelos: </h2>");
        
        try                        
        {      
            request.setAttribute("user", request.getSession().getAttribute("user"));
            
          // load the sqlite-JDBC driver using the current class loader
            Class.forName("org.sqlite.JDBC"); 
            connection = java.sql.DriverManager.getConnection("jdbc:sqlite:C:\\Users\\Melani\\Desktop\\FIB\\TI\\AD\\LAB1\\ad-travelagency\\test");
            Statement statement = connection.createStatement();
            statement.setQueryTimeout(30);  // set timeout to 30 sec.
            
            String numV = request.getParameter("flight");
            String comp = request.getParameter("comp");
            String salida = request.getParameter("origen");
            String llegada = request.getParameter("dest");
            
            String SQL = "SELECT * FROM vuelos";
            if(!numV.equals("any")) {
                SQL += " WHERE num_vuelo=" + '"' + numV + '"';
                if(!comp.equals("any")) SQL += " AND companyia=" + '"' + comp + '"';
                if(!salida.equals("any")) SQL += " AND origen=" + '"' + salida + '"';
                if(!llegada.equals("any")) SQL += " AND destino=" + '"' + llegada + '"';
            }
            else if(!comp.equals("any")) {
                SQL += " WHERE companyia=" + '"' + comp + '"';
                if(!salida.equals("any")) SQL += " AND origen=" + '"' + salida + '"';
                if(!llegada.equals("any")) SQL += " AND destino=" + '"' + llegada + '"';
            }
            else if (!salida.equals("any")) {
                SQL += " WHERE origen=" + '"' + salida + '"';
                if(!llegada.equals("any")) SQL += " AND destino=" + '"' + llegada + '"';
            }
            else if(!llegada.equals("any")) {
                SQL += " WHERE destino=" + '"' + llegada + '"';
            }
            SQL += ";";
                   
            out.println("<table>");
            out.println("<tr>\n" +
            "    <th>Número de vuelo</th>\n" +
            "    <th>Compañia</th>\n" +
            "    <th>Ciudad de origen</th>\n" +
            "    <th>Hora de salida</th>\n" +
            "    <th>Ciudad de destino</th>\n" +
            "    <th>Hora de llegada</th>\n" +
            "  </tr>");
            
            ResultSet rs = statement.executeQuery(SQL);

            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getString("num_vuelo") + "</td>");
                out.println("<td>" + rs.getString("companyia") + "</td>");
                out.println("<td>" + rs.getString("origen") + "</td>");
                out.println("<td>" + rs.getString("hora_salida") + "</td>");
                out.println("<td>" + rs.getString("destino") + "</td>");
                out.println("<td>" + rs.getString("hora_llegada") + "</td>");
                out.println("</tr>");
            }
            
            out.println("</table>");
            out.println("<br><br>");
            out.println("<a>Realizar otra búsqueda: </a><a href=\"/travelagency/buscarVuelo.jsp\"> buscar vuelo </a>");
            out.println("</body>");
            out.println("</html>");
            out.close();
            
            
            //request.getRequestDispatcher("menu.jsp").forward(request, response);            
            
        }
        catch(SQLException e)
        {
          System.err.println(e.getMessage());
          request.setAttribute("buscarVueloError", "true");
          request.getRequestDispatcher("error.jsp").forward(request, response);
        } catch (ClassNotFoundException e) {
            System.err.println(e.getMessage());
        }   
        finally
        {
          try
          {
            if(connection != null)
              connection.close();
          }
          catch(SQLException e)
          {
            // connection close failed.
            System.err.println(e.getMessage());
          }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    
}
