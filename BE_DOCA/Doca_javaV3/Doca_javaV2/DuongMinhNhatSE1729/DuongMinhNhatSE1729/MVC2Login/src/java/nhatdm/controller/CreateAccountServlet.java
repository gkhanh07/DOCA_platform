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
import nhatdm.registration.RegistrationCreateError;
import nhatdm.registration.RegistrationDAO;
import nhatdm.registration.RegistrationDTO;
import nhatdm.utils.MyApplicationConstants;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CreateAccountServlet", urlPatterns = {"/CreateAccountServlet"})
public class CreateAccountServlet extends HttpServlet {

//    private final String ERROR_PAGE = "createNewAccount.jsp";
//    private final String LOGIN_PAGE = "login.html";

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
        String username = request.getParameter("txtUserName");
        String password = request.getParameter("txtPassword");
        String comfirm = request.getParameter("txtComfirm");
        String fullname = request.getParameter("txtFullName");
        boolean foundErr = false;
        RegistrationCreateError errors = new RegistrationCreateError();
        //1.Get contextScope
        ServletContext context = this.getServletContext();
        //2.Get SiteMaps
        Properties siteMaps = (Properties) context.getAttribute("SITEMAPS");
        //3.Get SiteMaps to get  url Pattern
        String url = siteMaps.getProperty(MyApplicationConstants.CreateAccountFeature.ERROR_PAGE);
        try {
            //1. check all users error
            if (username.trim().length() < 6 || username.trim().length() > 30) {
                foundErr = true;
                errors.setUsernameLengthErr("usernmame is inputed from 6 to 30 chracters");

            }
            if (password.trim().length() < 8 || username.trim().length() > 30) {
                foundErr = true;
                errors.setPasswordLengthErr("Password is inputed from 6 to 30 chracters");
            }
            if (!comfirm.trim().equals(password.trim())) {
                foundErr = true;
                errors.setComfirmMatched("Comfirm is not Matched");
            }
            if (fullname.trim().length() < 2 || username.trim().length() > 50) {
                foundErr = true;
                errors.setFullnameLengthErr("FUllname is inputed from 2 to 50 chracters");
            }
            
            if (foundErr) {
                request.setAttribute("CREATE_ERROR", errors);
            } else {
                RegistrationDAO dao = new RegistrationDAO();
                RegistrationDTO account = new RegistrationDTO(username, password, fullname, false);
                boolean result = dao.createAccount(account);
                if(result){
                    url = siteMaps.getProperty(MyApplicationConstants.CreateAccountFeature.LOGIN_PAGE);
                }
            }
            //2. Call Dao
            //3. Process result
        } catch (SQLException ex) {
            log("createNewACCOUNT_SQL" + ex.getMessage());
            errors.setUsernameIsExisted(username + ": is Existed");
            request.setAttribute("CREATE_ERROR", errors);
        } catch (NamingException ex) {
            log("createNewACCOUNT_SQL" + ex.getMessage());
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
