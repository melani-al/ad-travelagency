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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author melania.alvarez
 */
@WebServlet(urlPatterns = {"/altaHotel"})
public class altaHotel extends HttpServlet {
    
    private static final String INSERT_SQL_2 = "INSERT INTO hoteles(id_hotel, nom_hotel, cadena, numb_hab, calle, numero, codigo_postal, ciudad, provincia, pais) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

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
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        Connection connection = null;
        
        try                        
        {            
            request.setAttribute("user", request.getSession().getAttribute("user"));
          // load the sqlite-JDBC driver using the current class loader
            Class.forName("org.sqlite.JDBC"); 
            connection = DriverManager.getConnection("jdbc:sqlite::\\Users\\Melani\\Desktop\\FIB\\TI\\AD\\LAB1\\ad-travelagency\\test");
            Statement statement = connection.createStatement();
            statement.setQueryTimeout(30);  // set timeout to 30 sec.
            
            String hotel,cadena,numH,street,num,postcode,city,state,country;
            hotel = request.getParameter("nom_hotel");
            cadena = request.getParameter("cadena");
            numH = request.getParameter("num_hab");
            street = request.getParameter("calle");
            num = request.getParameter("numero");
            postcode = request.getParameter("codigo_postal");
            city = request.getParameter("ciudad");
            state = request.getParameter("provincia");
            country = request.getParameter("pais");
            
            String user;
            user = (String)request.getSession().getAttribute("id");
            request.setAttribute("user", user);
            
            PreparedStatement ps = null;
            
            ResultSet rs = statement.executeQuery("select count(*) from hoteles");
            int next_id = 0;
            if(rs.next()) {
                next_id = rs.getInt(1) + 1;
            }
            
            try {
                ps = connection.prepareStatement(INSERT_SQL_2);
                ps.setInt(1, next_id);
                ps.setString(2, hotel);
                ps.setString(3, cadena);
                ps.setString(4, numH);
                ps.setString(5, street);
                ps.setString(6, num);
                ps.setString(7, postcode);
                ps.setString(8, city);
                ps.setString(9, state);
                ps.setString(10, country);
                ps.executeUpdate();
                request.getRequestDispatcher("menu.jsp").forward(request, response);
            }
            catch (SQLException e) {
                request.setAttribute("altaHotelError", "true"); //Nombre del error
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
            
        }
        catch(SQLException | ClassNotFoundException e)
        {
          request.setAttribute("altaHotelError", "true"); //Nombre del error
          request.getRequestDispatcher("error.jsp").forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(altaHotel.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(altaHotel.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(altaHotel.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(altaHotel.class.getName()).log(Level.SEVERE, null, ex);
        }
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
