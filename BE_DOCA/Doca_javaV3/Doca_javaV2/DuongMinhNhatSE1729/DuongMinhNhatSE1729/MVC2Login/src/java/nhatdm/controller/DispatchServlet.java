/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhatdm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import nhatdm.utils.MyApplicationConstants;

/**
 *
 * @author Admin
 */
@WebServlet(name = "DispatchServlet", urlPatterns = {"/DispatchServlet"})
public class DispatchServlet extends HttpServlet {

//    private final String LOGIN_PAGE = "login.html";
//    private final String LOGIN_PAGE = "";
    // private final String LOGIN_CONTROLLER = "LoginServlet";
//    private final String LOGIN_CONTROLLER = "loginController";
//    private final String SEARCH_LASTNAME_CONTROLLER = "SearchLastNameServlet";
//    private final String DELETE_ACCOUNT_CONTROLLER = "DeleteLastNameServlet";
//    private final String START_UP_CONTROLLER = "StartUpServlet";
//    private final String UPDATE_CONTROLLER = "UpdateServlet";
////    private final String LOGOUT_SERVLET = "LogoutServlet";
//    private final String ADD_ITEM_SERVLET = "AddItemServlet2";
//    private final String View_Cart_page = "viewCartBookStore.jsp";
//    private final String View_Cart = "viewCart_2.jsp";
//    private final String Remove_item = "removeServlet";
//    private final String Search_book = "SearchBookServlet";
//    private final String ADD_ITEMtoCART_BookStore_SERVLET = "AddItemToCartServlet";
//    private final String RemoveItemsFromCart = "RemoveItemFromCartServlet";
//    private final String CreatAccount = "CreateAccountServlet";
////    private final String CHECK_OUT_SERVLET = "CheckOutServlet";
//    private final String CHECK_OUT_SERVLET = "CheckOutBill";
////    private final String CHECK_OUT_SERVLET = "CheckOutServletNew";

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
        String button = request.getParameter("btAction");

        //1.Get contextScope
        ServletContext context = this.getServletContext();
        //2.Get SiteMaps
        Properties siteMaps = (Properties) context.getAttribute("SITEMAPS");
        //3.Get SiteMaps to get  url Pattern
        String url = siteMaps.getProperty(MyApplicationConstants.DispatcherFeature.LOGIN_PAGE);
        try {

            if (button == null) {
//                url = START_UP_CONTROLLER;
                //do no thing
            } else if (button.equals("Login")) {
                url = siteMaps.getProperty(MyApplicationConstants.DispatcherFeature.LOGIN_CONTROLLER);
            } else if (button.equals("Search")) {
                url = siteMaps.getProperty(MyApplicationConstants.DispatcherFeature.SEARCH_LASTNAME_CONTROLLER);
            } else if (button.equals("delete")) {
                url = siteMaps.getProperty(MyApplicationConstants.DispatcherFeature.DELETE_ACCOUNT_CONTROLLER);
            } else if (button.equals("Update")) {
                url = siteMaps.getProperty(MyApplicationConstants.DispatcherFeature.UPDATE_ACCOUNT_CONTROLLER);
            } else if (button.equals("Logout")) {
                url = siteMaps.getProperty(MyApplicationConstants.DispatcherFeature.LOGOUT_CONTROLLER);
//            } else if (button.equals("Add to cart")) {
//                url = ADD_ITEM_SERVLET;
//            } else if (button.equals("View your cart")) {
//                url = View_Cart;
//            } else if (button.equals("Remove Book From Cart")) {
//                url = Remove_item;
            } else if (button.equals("Search Book")) {
                url = siteMaps.getProperty(MyApplicationConstants.DispatcherFeature.SEARCH_ITEM_CONTROLLER);
            } else if (button.equals("Add Items to Cart")) {
                url = siteMaps.getProperty(MyApplicationConstants.DispatcherFeature.ADD_ITEM_TO_CART_CONTROLLER);
            } else if (button.equals("View your cart FullHD")) {
                url = siteMaps.getProperty(MyApplicationConstants.DispatcherFeature.VIEW_CART_PAGE);
            } else if (button.equals("Remove Items From Cart")) {
                url = siteMaps.getProperty(MyApplicationConstants.DispatcherFeature.REMOVE_ITEM_FROM_CART_CONTROLLER);
            } else if (button.equals("Create New Account")) {
                url = siteMaps.getProperty(MyApplicationConstants.DispatcherFeature.CREATE_ACCOUNT_CONTROLLER);
            } else if (button.equals("CheckOut")) {
                url = siteMaps.getProperty(MyApplicationConstants.DispatcherFeature.CHECKOUT_CONTROLLER);
            }

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
