/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.doca_java.Controller.Admin;

import com.mycompany.doca_java.DAO.userDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.SQLException;
import javax.naming.NamingException;

/**
 *
 * @author Admin
 */
@WebServlet(name = "DeleteUserSerlvet", urlPatterns = {"/DeleteUserSerlvet"})
public class DeleteUserSerlvet extends HttpServlet {

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
        HttpSession session = request.getSession();
        int indexPage = session.getAttribute("indexStay") != null
                ? (int) session.getAttribute("indexStay") : 1;
        try {
            int userId = Integer.parseInt(request.getParameter("user_id"));
            userDAO user = new userDAO();

            // Check if the request is for banning or unbanning
            String action = request.getParameter("action");
            boolean result = false;

            if ("ban".equals(action)) {
                result = user.banUser(userId);
            } else if ("unban".equals(action)) {
                result = user.unbanUser(userId);
            }

            if (result) {
                String txtSearch = request.getParameter("txtSearch");

                response.sendRedirect("SearchByUserName?index="+ indexPage +"&txtSearch=" + URLEncoder.encode(txtSearch, "UTF-8"));

//                RequestDispatcher dispatcher = request.getRequestDispatcher("All");
//                dispatcher.forward(request, response);
            } else {
                response.getWriter().write("Failed to perform the action");
            }
        } catch (ClassNotFoundException | SQLException | NamingException e) {
            e.printStackTrace();
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
