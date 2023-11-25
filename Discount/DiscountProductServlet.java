/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.doca_java.Controller.ManageOwner.personal_Product;

import com.mycompany.doca_java.DAO.DiscountDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;

/**
 *
 * @author Admin
 */
@WebServlet(name = "DiscountProductServlet", urlPatterns = {"/DiscountProductServlet"})
public class DiscountProductServlet extends HttpServlet {

    private final String getPerSonalProductServelt = "getPersonalProduct";

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
        try {
            response.setContentType("text/html;charset=UTF-8");

            String productId = request.getParameter("productId");
            String discountType = request.getParameter("discountType");
            String priceOriginal = request.getParameter("priceOriginal");
            String discountValue = request.getParameter("discountValue");
            String discountStartDate = request.getParameter("discountStartDate");
            String discountEndDate = request.getParameter("discountEndDate");
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

            // Lấy ngày hiện tại
            Date currentDate = new Date();


            /* TODO output your page here */
            DiscountDAO dao = new DiscountDAO();
            double newPrice = 0;
            Date startDate = dateFormat.parse(discountStartDate);
            Date endDate = dateFormat.parse(discountEndDate);
            // So sánh ngày hiện tại với startDate và endDate
            boolean status = !currentDate.before(startDate);

            if (discountType.equals("percentage")) {

                newPrice = (Double.parseDouble(priceOriginal) * (Double.parseDouble(discountValue) / 100));
                double roundedNewPrice = Math.round(newPrice * 10) / 10.0;
                boolean result = dao.createDiscount(Integer.parseInt(productId), discountType, Double.parseDouble(discountValue), roundedNewPrice, startDate, endDate, status);
                if (result) {
                    url = getPerSonalProductServelt;
                }

            } else {
                newPrice = (Double.parseDouble(priceOriginal) - Double.parseDouble(discountValue));
                double roundedNewPrice = Math.round(newPrice * 10) / 10.0;
                double newDiscountValue = (Double.parseDouble(discountValue) / Double.parseDouble(priceOriginal)) * 100;
                double roundedNewDiscountValue = Math.round(newDiscountValue * 10) / 10.0;
                boolean result = dao.createDiscount(Integer.parseInt(productId), "percentage", roundedNewDiscountValue, roundedNewPrice, startDate, endDate, status);
                if (result) {
                    url = getPerSonalProductServelt;
                }

            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DiscountProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(DiscountProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
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
