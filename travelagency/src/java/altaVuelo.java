/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author melania.alvarez
 */
@WebServlet(urlPatterns = {"/altaVuelo"})
public class altaVuelo extends HttpServlet {
    
    private static final String INSERT_SQL = "INSERT INTO vuelos(id_vuelo,num_vuelo, companyia, origen, destino, hora_salida, hora_llegada) VALUES(?, ?, ?, ?, ?, ?, ?)";


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
        
        try                        
        {
            request.setAttribute("user", request.getSession().getAttribute("user"));
          // load the sqlite-JDBC driver using the current class loader
            Class.forName("org.sqlite.JDBC"); 
            connection = DriverManager.getConnection("jdbc:sqlite:/Users/Celina/Documents/Dokumente - Celinas MacBook Air/Uni/5.Auslandssemester/AD/travelagency/test");
            Statement statement = connection.createStatement();
            statement.setQueryTimeout(30);  // set timeout to 30 sec.
                       
            String numF, airline, origin, dest, time_a, time_s;
            numF = request.getParameter("num_vuelo"); 
            airline = request.getParameter("companyia"); 
            origin = request.getParameter("origen"); 
            dest = request.getParameter("destino"); 
            time_a = request.getParameter("hora_llegada");
            time_s = request.getParameter("hora_salida");
            PreparedStatement ps = null;
            
            ResultSet rs = statement.executeQuery("select count(*) from vuelos");
            int next_id = 0;
            if(rs.next()) {
                next_id = rs.getInt(1) + 1;
            }
            
            try {
                ps = connection.prepareStatement(INSERT_SQL);
                ps.setInt(1, next_id);
                ps.setString(2, numF);
                ps.setString(3, airline);
                ps.setString(4, origin);
                ps.setString(5, dest);
                ps.setString(6, time_s);
                ps.setString(7, time_a);
                ps.executeUpdate();
                request.getRequestDispatcher("menu.jsp").forward(request, response);
            }
            catch (SQLException e) {
                request.setAttribute("altaVueloError", "true"); //Nombre del error
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        }
        catch(SQLException | ClassNotFoundException e)
        {
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
