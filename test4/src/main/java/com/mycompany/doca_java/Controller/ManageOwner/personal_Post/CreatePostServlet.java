/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.doca_java.Controller.ManageOwner.personal_Post;

import com.mycompany.doca_java.DAO.PostDAO;
import com.mycompany.doca_java.DTO.PostDTO;
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
import jakarta.servlet.http.Part;
import java.io.File;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;

/**
 *
 * @author Admin
 */
@MultipartConfig
@WebServlet(name = "PostForum", urlPatterns = {"/PostForum"})
public class CreatePostServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String postSuccess = "forumServlet";
    private static final String Status = "pending";
    private static final String error = "Error.html";
    private final String LOGIN_PAGE = "login.jsp";

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
        LocalDateTime currentDateTime = LocalDateTime.now();
        // Chuyển đổi thành kiểu dữ liệu Timestamp
        Timestamp timePosted = Timestamp.valueOf(currentDateTime);
        response.setContentType("text/html;charset=UTF-8");
        String url = error;
        HttpSession session = request.getSession();
        userDTO account = (userDTO) session.getAttribute("USER_NAME");
        try {
            if (account != null) {
                /* TODO output your page here. You may use following sample code. */
                String[] categorys = request.getParameterValues("category");
                String content = request.getParameter("content");
                Part filePart = request.getPart("file");
                String uploadDir = "C:\\Users\\Admin\\Desktop\\FOR STUDY\\SWP\\Doca_java\\src\\main\\webapp\\imgIn_DOCA";
                String fileName = null;
                String originalFileName = filePart.getSubmittedFileName();
                // Tạo tên file mới
                int dotIndex = originalFileName.lastIndexOf(".");
                if (dotIndex != -1) {
                    String extension = originalFileName.substring(dotIndex);
                    String timestamp = Long.toString(System.currentTimeMillis());
                    fileName = "forum" + timestamp + extension;
                } else {
                    String timestamp = Long.toString(System.currentTimeMillis());
                    fileName = "forum" + timestamp;
                }
                // Tạo đường dẫn file trên server
                String filePath = uploadDir + File.separator + fileName;
               
                // Lưu file
                filePart.write(filePath);
                fileName = "imgIn_DOCA/" + fileName;
                PostDAO dao = new PostDAO();
                PostDTO post;
                if (categorys != null) {

                    post = new PostDTO(account.getUser_ID(), content, fileName, true, timePosted, Status, null);
                    boolean result = dao.createPostForum(post, categorys);
                    if (result) {
                        url = postSuccess;
                        request.setAttribute("successMessage", "Đăng bài thành công (Chờ duyệt)!");
                    }

                }
            }
            else{
                url=LOGIN_PAGE;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CreatePostServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CreatePostServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(CreatePostServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
           response.sendRedirect(url);
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
