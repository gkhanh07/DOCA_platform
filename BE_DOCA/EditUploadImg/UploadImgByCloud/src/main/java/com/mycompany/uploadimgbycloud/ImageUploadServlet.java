/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.uploadimgbycloud;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

/**
 *
 * @author Admin
 */
@MultipartConfig
@WebServlet(name = "ImageUploadServlet", urlPatterns = {"/upload"})
public class ImageUploadServlet extends HttpServlet {

    private Cloudinary cloudinary;

    @Override
    public void init() throws ServletException {
        super.init();

        // Khởi tạo đối tượng Cloudinary
        cloudinary = new Cloudinary(ObjectUtils.asMap(
                "cloud_name", "dy2t6fuqj",
                "api_key", "895449815491482",
                "api_secret", "ohztXubIe66oY6J6NE_nAtgU7Hw"));
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        // Get the uploaded image file from the request
        Part filePart = request.getPart("imageFile");
        InputStream fileInputStream = filePart.getInputStream();

        // Read the file content into a byte array
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[4096];
        int bytesRead;
        while ((bytesRead = fileInputStream.read(buffer)) != -1) {
            byteArrayOutputStream.write(buffer, 0, bytesRead);
        }
        byte[] fileBytes = byteArrayOutputStream.toByteArray();

        // Upload the image to Cloudinary
        Map<String, Object> uploadResult = cloudinary.uploader().upload(fileBytes, ObjectUtils.emptyMap());

        // Get the public URL of the uploaded image
        String imageUrl = (String) uploadResult.get("url");

        // Store the image URL in the session
        HttpSession session = request.getSession();
        session.setAttribute("imageUrl", imageUrl);

        // Redirect to the image display page
        response.sendRedirect("imageDisplay.jsp");
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
