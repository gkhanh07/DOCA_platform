/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.doca_java.Controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.util.UUID;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.DefaultCredentialsProvider;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;
import software.amazon.awssdk.services.s3.model.PutObjectResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "upload", urlPatterns = {"/upload"})
@MultipartConfig
public class upload extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String AWS_ACCESS_KEY = "AKIAVDT5DESUVVIMH3LK";
    private static final String AWS_SECRET_KEY = "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";
    private static final String AWS_REGION = "ap-southeast-1";
    private static final String AWS_BUCKET_NAME = "docabucket";
    private static final String AWS_OBJECT_KEY_PRE = "AA-";

    public static String generateUniqueObjectKey() {
        String uniqueId = UUID.randomUUID().toString();
        return AWS_OBJECT_KEY_PRE + uniqueId;
    }

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
        String objectKey = generateUniqueObjectKey();
        Part filePart = request.getPart("file"); // Lấy đối tượng Part chứa file được upload
        String fileName = getFileName(filePart);

        // Tạo một đối tượng File tạm để lưu trữ file được upload
        File tempFile = File.createTempFile(fileName, "");
        filePart.write(tempFile.getAbsolutePath());

        try {
            AwsBasicCredentials awsCredentials = AwsBasicCredentials.create(AWS_ACCESS_KEY, AWS_SECRET_KEY);

            S3Client s3Client = S3Client.builder()
                    .region(Region.of(AWS_REGION))
                    .credentialsProvider(StaticCredentialsProvider.create(awsCredentials))
                    .build();

            PutObjectRequest putObjectRequest = PutObjectRequest.builder()
                    .bucket(AWS_BUCKET_NAME)
                    .key(objectKey)
                    .build();

            PutObjectResponse s3Response = s3Client.putObject(putObjectRequest, Path.of(tempFile.getAbsolutePath()));

            if (s3Response != null && s3Response.sdkHttpResponse().isSuccessful()) {
                response.getWriter().println("Upload thành công!");
            } else {
                response.getWriter().println("Upload thất bại!");
            }
        } finally {
            tempFile.delete(); // Xóa file tạm sau khi upload
        }
    }

    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] elements = contentDisposition.split(";");

        for (String element : elements) {
            if (element.trim().startsWith("filename")) {
                return element.substring(element.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
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
