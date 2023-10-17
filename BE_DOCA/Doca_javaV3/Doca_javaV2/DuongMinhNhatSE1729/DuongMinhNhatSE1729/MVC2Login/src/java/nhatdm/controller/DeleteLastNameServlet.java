/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhatdm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Properties;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import nhatdm.registration.RegistrationDAO;
import nhatdm.registration.RegistrationDTO;
import nhatdm.utils.MyApplicationConstants;

/**
 *
 * @author Admin
 */
@WebServlet(name = "DeleteLastNameServlet", urlPatterns = {"/DeleteLastNameServlet"})
public class DeleteLastNameServlet extends HttpServlet {

//    private final String ERROR_PAGE = "error.html";

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
        String username = request.getParameter("pk");
        String searchValues = request.getParameter("lastSearchValue");
         //1.Get contextScope
        ServletContext context = this.getServletContext();
        //2.Get SiteMaps
        Properties siteMaps = (Properties) context.getAttribute("SITEMAPS");
        //3.Get SiteMaps to get  url Pattern
        String url = siteMaps.getProperty(MyApplicationConstants.DeleteAccountFeature.ERROR_PAGE);
        HttpSession session = request.getSession(false);
        RegistrationDTO userNow = (RegistrationDTO) session.getAttribute("USER");
        try {
            //Check userUsing

            //1.call model
            //1.1 new obj
            RegistrationDAO dao = new RegistrationDAO();
            //1.2 call method DAO
            boolean result = dao.deleteAccount(username);
            //2.process result
            if (result) {
                //2.1 call the search function again using URL Rewriting
                url = "DispatchServlet"
                        + "?btAction=Search"
                        + "&txtSearchValues="
                        + searchValues;
                //2.2 go to error page
            }//end delete account is success

        } catch (SQLException ex) {
            log("DeleteLastNameServlet" + ex.getMessage());
        } catch (NamingException ex) {
            log("DeleteLastNameServlet" + ex.getMessage());
        } finally {
            response.sendRedirect(url);
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
