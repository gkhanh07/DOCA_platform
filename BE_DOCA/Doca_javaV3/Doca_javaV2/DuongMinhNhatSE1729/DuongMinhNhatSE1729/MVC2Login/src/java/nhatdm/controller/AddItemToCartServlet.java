/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhatdm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Properties;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import nhatdm.cart.CartObj;
import nhatdm.dBProduct.TblProductDAO;
import nhatdm.dBProduct.TblProductDTO;
import nhatdm.utils.MyApplicationConstants;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AddItemToCartServlet", urlPatterns = {"/AddItemToCartServlet"})
public class AddItemToCartServlet extends HttpServlet {

//    final String BOOKSTORE_PAGE = "bookStoreHTML.html";
//    final String BOOKSTORE = "bookStoreJSP.jsp";
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

        String searchBooks = request.getParameter("lastSearchBook");
//        String[] quantityItems = request.getParameterValues("quantityNumber");

        String selectBuy = request.getParameter("checkBuy");
        String urlRewriting = "DispatchServlet"
                + "?btAction=Search Book"
                + "&txtSearchBook=" + searchBooks;

        try {
            //goes to cart palace
            HttpSession session = request.getSession();
            //take cart
            CartObj cart = (CartObj) session.getAttribute("CART_OF_CUST");
            //check
            if (cart == null) {
                cart = new CartObj();
            }
            //drop items to cart
            String[] sku = request.getParameterValues("checkBuy");
            if (sku != null) {
                for (String skuItem : sku) {
                    String paramQuantityItem = request.getParameter("quantityOf" + skuItem);
                    int quantityItem = Integer.parseInt(paramQuantityItem);
//                    cart.addItemToCart(skuItem);
                    if (quantityItem > 0) {
                        cart.addItemToCartWithQuantity(skuItem, quantityItem);
                    }
                }
//            for (int i = 0; i <= quantityItems.length; i++) {
//                if (sku != null) {
//                    for (String skuItem : sku) {
//                        int quantityItem = Integer.parseInt(quantityItems[i]);
//                        cart.addItemToCartWithQuantity(skuItem, quantityItem);
//                    }
//                }
                //Update session scope
                session.setAttribute("CART_OF_CUST", cart);
            }

        } finally {
            // RequestDispatcher rd = request.getRequestDispatcher(url);
            // rd.forward(request, response);
            response.sendRedirect(urlRewriting);
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
