/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhatdm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;
import java.util.Map;
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
import javax.servlet.http.HttpSession;
import nhatdm.bill.BillObj;
import nhatdm.cart.CartObj;
import nhatdm.orderDetails.OrderDetailsDAO;
import nhatdm.orderDetails.OrderDetailsDTO;
import nhatdm.registration.RegistrationDTO;
import nhatdm.tblOrder.TblOrderDAO;
import nhatdm.tblOrder.TblOrderDTO;
import nhatdm.utils.MyApplicationConstants;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CheckOutBill", urlPatterns = {"/CheckOutBill"})
public class CheckOutBillServlet extends HttpServlet {

//    private final String CHECK_OUT_PAGE = "checkOut.jsp";
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

        //1.Get contextScope
        ServletContext context = this.getServletContext();
        //2.Get SiteMaps
        Properties siteMaps = (Properties) context.getAttribute("SITEMAPS");
        //3.Get SiteMaps to get  url Pattern
        String url = siteMaps.getProperty(MyApplicationConstants.CheckOutFeature.ERROR_PAGE);
        try {
            HttpSession session = request.getSession(false);
            
            if (session != null) {
                
                CartObj cart = (CartObj) session.getAttribute("CART_OF_CUST");
                if (cart != null) {
                    Map<String, Integer> items = cart.getItems();
                    if (items != null) {
                        TblOrderDAO dao = new TblOrderDAO();
                        TblOrderDTO dto = new TblOrderDTO();
                        boolean result = dao.insertTblOrder(cart, dto);
                        boolean resultOrderDetail = false;
                        if (result) {
                            OrderDetailsDAO daoOrder = new OrderDetailsDAO();
                            OrderDetailsDTO dtoOrderDetails = new OrderDetailsDTO();
                            BillObj bill = new BillObj();
                            for (String key : items.keySet()) {
                                //Set propertie cho orderDetail
                                dtoOrderDetails.setSku(key);
                                bill.setSku(dtoOrderDetails.getSku());
                                
                                dtoOrderDetails.setPrice(cart.getItemProperties(key).getPrice());
                                
                                dtoOrderDetails.setOrderId(dto.getId());
                                bill.setIdOrder(dtoOrderDetails.getOrderId());
                                
                                dtoOrderDetails.setQuantity(items.get(key));
                                
                                dtoOrderDetails.setTotal(dtoOrderDetails.getPrice() * dtoOrderDetails.getQuantity());
                                
                                resultOrderDetail = daoOrder.insertOrderDetail(dtoOrderDetails);

                                //call dall de lay list
                                dao.printBill(bill);
                            }
                            if (resultOrderDetail) {
                                request.setAttribute("Bill_Of_Cus", dto);
                                List<BillObj> itemOrderDetails = dao.getBillObj();
                                request.setAttribute("List_OrderDetails_Items", itemOrderDetails);
                                session.removeAttribute("CART_OF_CUST");
                                if (session.getAttribute("CART_OF_CUST") == null) {
                                    url = siteMaps.getProperty(MyApplicationConstants.CheckOutFeature.CHECKOUT_PAGE);
                                }
                            }
                        }
                    }
                }
            }
            
        } catch (SQLException ex) {
            log("CheckOutBill" + ex.getMessage());
        } catch (NamingException ex) {
            log("CheckOutBill" + ex.getMessage());
        } catch (ParseException ex) {
            log("CheckOutBill" + ex.getMessage());
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
