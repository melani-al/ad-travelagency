
import hotelws.HotelWS_Service;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.WebServiceRef;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Melani
 */

@WebServlet(urlPatterns = {"/ReservaHotelSOAP"})
public class ReservaHotelSOAP extends HttpServlet {
    @WebServiceRef(wsdlLocation = "WEB-INF/wsdl/localhost_8080/HotelWS/HotelWS.wsdl")
    private HotelWS_Service service;
    
    private Integer booking(java.lang.Integer idHotel, java.lang.Integer fecha) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        hotelws.HotelWS port = service.getHotelWSPort();
        return port.booking(idHotel, fecha);
    }

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
        request.setAttribute("user", request.getSession().getAttribute("user"));
        
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head><title>Reserva de habitaciones</title><style>\n" +
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
        
        Integer idH, date, habs;
        idH = Integer.valueOf(request.getParameter("id_hotel"));
        date = Integer.valueOf(request.getParameter("fecha"));
        habs = Integer.valueOf(request.getParameter("habs"));
        
        if (habs > freeRooms(idH, date)) {
            request.setAttribute("reservaError", "true");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
        
        int n = 0;
        while (n < Integer.valueOf(request.getParameter("habs"))) {
            booking(idH, date);
            ++n;
        }
               
        out.println("<h2>" + Integer.valueOf(request.getParameter("habs")) + " habitaciones reservadas correctamente. </h2>");
        
        out.println("<h3>Click <a href=\"/travelagency/reservaHotelSOAP.jsp\"> aquí </a>");
        out.println(" para hacer otra reserva. </h3>");
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

    private Integer freeRooms(java.lang.Integer idHotel, java.lang.Integer date) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        hotelws.HotelWS port = service.getHotelWSPort();
        return port.freeRooms(idHotel, date);
    }

}
