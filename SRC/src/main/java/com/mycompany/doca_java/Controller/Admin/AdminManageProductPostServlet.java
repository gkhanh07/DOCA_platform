/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.doca_java.Controller.Admin;

import com.mycompany.doca_java.DAO.ProductDAO;
import com.mycompany.doca_java.DAO.categoryDAO;
import com.mycompany.doca_java.DAO.userDAO;
import com.mycompany.doca_java.DTO.ProductDTO;
import com.mycompany.doca_java.DTO.categoryDTO;
import com.mycompany.doca_java.DTO.userDTO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AdminManageProductPostServlet", urlPatterns = {"/AdminManageProductPostServlet"})
public class AdminManageProductPostServlet extends HttpServlet {

//    private final String adminShowProduct = "adminShowProduct.jsp";
    private final String adminShowProduct = "AdminUI/admidShowProductV2.jsp";
    private final String status = "pending";

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
        String url = "Error.html";
        String categoryID;
        categoryID = (String) request.getAttribute("categoryId");
        if (categoryID == null || categoryID.isEmpty()) {
            categoryID = request.getParameter("selectedCategory");
        }

        try {
            response.setContentType("text/html;charset=UTF-8");
            ProductDAO dao = new ProductDAO();
            List<ProductDTO> listProductByStatus;
            request.setAttribute("selectedCategory", categoryID);
            if (categoryID != null && !categoryID.isEmpty() && !categoryID.equals("0")) {
                int categoryId = Integer.parseInt(categoryID);

                listProductByStatus = dao.getProductsByStatusAndCategory(status, categoryId);
            } else {
                listProductByStatus = dao.getProductsByStatus(status);
            }
            if (listProductByStatus != null) {
                request.setAttribute("listOfProduct", listProductByStatus);
            }
            categoryDAO cdao = new categoryDAO();
            List<categoryDTO> list = cdao.getCountProductByCategory();
            if (list != null) {
                request.setAttribute("listCount", list);
            }
            userDAO udao = new userDAO();
            List<userDTO> listUserByRank = udao.getRankUserBySales();
            if (listUserByRank != null) {
                request.setAttribute("listUserByRank", listUserByRank);
            }
            url = adminShowProduct;
        } catch (SQLException ex) {
            Logger.getLogger(AdminManageProductPostServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AdminManageProductPostServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(AdminManageProductPostServlet.class.getName()).log(Level.SEVERE, null, ex);
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
