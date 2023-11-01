/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.doca_java.Controller.loginSignup;

import com.mycompany.doca_java.DAO.userDAO;
import com.mycompany.doca_java.DTO.userDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.naming.NamingException;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CreateNewAccountServlet", urlPatterns = {"/CreateNewAccountServlet"})

public class CreateNewAccountServlet extends HttpServlet {

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
       String username = request.getParameter("txtUsername");
        String password = request.getParameter("txtPassword");
        String confirm = request.getParameter("txtConfirm");
        String gender = request.getParameter("txtGender");
        String email = request.getParameter("txtEmail");
        String mobileNum = request.getParameter("txtPhone");
        boolean status = true;  // Assuming the user is initially active
        boolean roleID = true; // Adjust as needed   
        String avatar = null;
        try {
            userDAO userDAO = new userDAO();
            if (userDAO.isUsernameAvailable(username) && userDAO.isEmailAvailable(email)) {
                Part filePart = request.getPart("avatarFile");
                if (filePart != null && filePart.getSize() > 0) {
                    String originalFileName = filePart.getSubmittedFileName();
                    String uploadDir = "C:\\Users\\Admin\\Desktop\\FOR STUDY\\SWP\\Doca_java\\src\\main\\webapp\\imgIn_DOCA";
                    int dotIndex = originalFileName.lastIndexOf(".");
                    if (dotIndex != -1) {
                        String extension = originalFileName.substring(dotIndex);
                        avatar = username + "Avatar" + extension;
                    } else {
                        avatar = username + "Avatar";
                    }
                    String filePath = uploadDir + File.separator + avatar;
                    filePart.write(filePath);
                    avatar = "imgIn_DOCA/" + avatar;
                } else {
                    avatar = "default.jpg";// Default avatar image 
                }
                userDTO user = new userDTO();
                user.setUserName(username);
                user.setPassword(password);
                user.setGender(gender);
                user.setEmail(email);
                user.setMobileNum(mobileNum);
                user.setStatus(status);
                user.setRoleID(roleID);
                user.setAvatar(avatar);

                boolean registrationSuccessful = userDAO.createUser(user);
                if (registrationSuccessful) {
                    // Registration was successful, you can redirect the user to a success page
                    response.sendRedirect("login.jsp");
                } else {
                    // Registration failed, you can redirect the user to an error page
                    response.sendRedirect("signup.jsp");
                }
            } else {
                if (!userDAO.isUsernameAvailable(username)) {
                    response.sendRedirect("signup.jsp?usernameTaken=true");
                } else {
                    // Email is not available, provide feedback to the user
                    response.sendRedirect("signup.jsp?emailTaken=true");
                }

            }
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (NamingException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
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
