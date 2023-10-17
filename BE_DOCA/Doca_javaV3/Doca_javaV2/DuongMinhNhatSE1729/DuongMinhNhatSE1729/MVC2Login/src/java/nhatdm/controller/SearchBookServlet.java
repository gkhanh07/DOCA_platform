/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhatdm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import nhatdm.dBProduct.TblProductDAO;
import nhatdm.dBProduct.TblProductDTO;
import nhatdm.utils.MyApplicationConstants;

/**
 *
 * @author Admin
 */
@WebServlet(name = "SearchBookServlet", urlPatterns = {"/SearchBookServlet"})
public class SearchBookServlet extends HttpServlet {

//    final String BookStore = "bookStoreJSP.jsp";
//    final String BOOKSTORE_PAGE = "bookStoreHTML.html";

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

        //1.Get contextScope
        ServletContext context = this.getServletContext();
        //2.Get SiteMaps
        Properties siteMaps = (Properties) context.getAttribute("SITEMAPS");
        //3.Get SiteMaps to get  url Pattern
        String url = siteMaps.getProperty(MyApplicationConstants.SearchBookFeature.BookStoreHTML_PAGE);
        try {
            String searchBook = request.getParameter("txtSearchBook");
            if (!searchBook.trim().isEmpty()) {
                url = siteMaps.getProperty(MyApplicationConstants.SearchBookFeature.BookStoreJSP_PAGE);;
                TblProductDAO dao = new TblProductDAO();
                dao.SearchBook(searchBook);
                List<TblProductDTO> result = dao.getItemsList();
                request.setAttribute("RESULT_SEARCH_BOOK", result);
            }

        } catch (SQLException ex) {
            log("SearchBookServlet" + ex.getMessage());
        } catch (NamingException ex) {
            log("SearchBookServlet" + ex.getMessage());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
