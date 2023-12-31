/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.doca_java.Controller.ManageOwner.personal_Product;

import com.mycompany.doca_java.DAO.ConversationDAO;
import com.mycompany.doca_java.DAO.ProductDAO;
import com.mycompany.doca_java.DAO.saveProductDAO;
import com.mycompany.doca_java.DTO.ConversationDTO;
import com.mycompany.doca_java.DTO.ProductDTO;
import com.mycompany.doca_java.DTO.saveProductDTO;
import com.mycompany.doca_java.DTO.userDTO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author Admin
 */
@WebServlet(name = "getPersonalProduct", urlPatterns = {"/getPersonalProduct"})

public class getPersonalProduct extends HttpServlet {

    private final String LOGIN_PAGE = "login.jsp";
    private final String PERSONAL_PRODUCT_PAGE = "Personal_Product.jsp";

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
        HttpSession session = request.getSession(true);
        userDTO account = (userDTO) session.getAttribute("USER_NAME");
        String IN = (String) session.getAttribute("IN") != null ? (String) session.getAttribute("IN") : "display";
        session.setAttribute("IN", IN);
        String url = "";
        try {
            if (account != null) {
                ProductDAO dao = new ProductDAO();
                List<ProductDTO> listOfProduct = dao.getProductsByUserId(account.getUser_ID());

                if (listOfProduct != null) {
                    List<saveProductDTO> listOfSaveproduct = new ArrayList<>();
                    List<ConversationDTO> listConverApprove = new ArrayList<>();
                    ConversationDAO cdao = new ConversationDAO();
                    listConverApprove = cdao.getListTheConversationBySellerID(account.getUser_ID());
                    if (listConverApprove != null) {
                        request.setAttribute("listConverApprove", listConverApprove);
                    }
                    saveProductDAO sdao = new saveProductDAO();
                    for (ProductDTO productDTO : listOfProduct) {
                        int count = sdao.getCountOfSave(productDTO.getProductId());
                        saveProductDTO countSave
                                = new saveProductDTO(productDTO.getProductId(), count);
                        listOfSaveproduct.add(countSave);
                    }
                    request.setAttribute("listOfCountSaveproduct", listOfSaveproduct);
                    request.setAttribute("listProductOfPersonal", listOfProduct);
                    request.setAttribute("Message", "không có sản phẩm nào");
                    url = PERSONAL_PRODUCT_PAGE;
                } else {
                    request.setAttribute("Message", "không có sản phẩm nào");
                    url = PERSONAL_PRODUCT_PAGE;
                }
            } else {
                url = LOGIN_PAGE;
            }
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (NamingException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
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
