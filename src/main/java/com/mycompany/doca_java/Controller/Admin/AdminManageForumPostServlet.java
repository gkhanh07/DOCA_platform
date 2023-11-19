/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.doca_java.Controller.Admin;

import com.mycompany.doca_java.DAO.PostDAO;
import com.mycompany.doca_java.DTO.PostDTO;
import com.mycompany.doca_java.DTO.userDTO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AdminManageForumPostServlet", urlPatterns = {"/AdminManageForumPostServlet"})
public class AdminManageForumPostServlet extends HttpServlet {

    private final String adminShowProduct = "AdminUI/adminShowPost.jsp";
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
        String url = "";
        HttpSession session = request.getSession();
        userDTO account = (userDTO) session.getAttribute("USER_NAME");
        request.getAttribute("messShift");
        String selectedCategory;
        selectedCategory = (String) request.getAttribute("categoryId");
        if (selectedCategory == null || selectedCategory.isEmpty()) {
            selectedCategory = request.getParameter("selectedCategory");
        }
        try {
            if (!account.isRoleID()) {
                response.setContentType("text/html;charset=UTF-8");
                List<PostDTO> listPost;
                PostDAO dao = new PostDAO();
                if (selectedCategory != null && !selectedCategory.isEmpty() && !selectedCategory.equals("0")) {
                    int categoryId = Integer.parseInt(selectedCategory);
                    request.setAttribute("selectedCategory", selectedCategory);
                    listPost = dao.getPostByCategoryIDAndStatus(categoryId, status);
                } else {
                    request.setAttribute("selectedCategory", "0");
                    listPost = dao.getPostForumsbyStatus(status);
                }
                if (listPost != null) {
                    request.setAttribute("listofPost", listPost);
                    url = adminShowProduct;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminManageForumPostServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AdminManageForumPostServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(AdminManageForumPostServlet.class.getName()).log(Level.SEVERE, null, ex);
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
