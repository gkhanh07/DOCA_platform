/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.doca_java.DAO;

import com.mycompany.doca_java.DTO.ProductDTO;
import com.mycompany.doca_java.util.DBconnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author Admin
 */
public class ProductDAO {

    private List<ProductDTO> ListOfProduct;

    public List<ProductDTO> getListOfProduct() {
        return ListOfProduct;
    }

    public void getAllTheProduct() throws SQLException, ClassNotFoundException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBconnect.makeConnection();
            if (con != null) {
                //2.create sql string
                String sql = "SELECT product_id, user_id, category_id, title, description, product_image, is_free, price, address, timePosted, isPublic, status, reason "
                        + "FROM product";
                //3.create stm obj
                stm = con.prepareStatement(sql);
                //4.execute
                rs = stm.executeQuery();
                //5.process (Note: Luu y Khi SU DUNG IF/WHILE)
                while (rs.next()) {
                    int productId = rs.getInt("product_id");
                    int userId = rs.getInt("user_id");
                    int categoryId = rs.getInt("category_id");
                    String title = rs.getString("title");
                    String description = rs.getString("description");
                    String productImage = rs.getString("product_image");
                    boolean isFree = rs.getBoolean("is_free");
                    float price = rs.getFloat("price");
                    String address = rs.getString("address");
                    Date timePosted = rs.getDate("timePosted");
                    boolean isPublic = rs.getBoolean("isPublic");
                    String status = rs.getString("status");
                    String reason = rs.getString("reason");

                    //5.1.2 set properties of pro
                    ProductDTO product = new ProductDTO(productId, userId, categoryId, title, description, productImage, isFree, price, address, (Timestamp) timePosted, isPublic, status, reason);

                    //5.2 add data to list
                    if (this.ListOfProduct
                            == null) {
                        this.ListOfProduct = new ArrayList<>();

                    }//end account list has not existed

                    this.ListOfProduct.add(product);
                }//end map DB to DTO
            }//end connect is available
        } finally {
            if (rs != null) {
                rs.close();
            }

            if (stm != null) {
                con.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public boolean createPostProduct(ProductDTO product) throws SQLException, ClassNotFoundException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            con = DBconnect.makeConnection();
            if (con != null) {
                String sql = "INSERT INTO product (user_id, category_id, title, description, product_image, is_free, price, address, timePosted, isPublic, status, reason) "
                        + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                stm = con.prepareStatement(sql);
                stm.setInt(1, product.getUserId());
                stm.setInt(2, product.getCategoryId());
                stm.setString(3, product.getTitle());
                stm.setString(4, product.getDescription());
                stm.setString(5, product.getProductImage());
                stm.setBoolean(6, product.isFree());
                stm.setDouble(7, product.getPrice());
                stm.setString(8, product.getAddress());
                stm.setTimestamp(9, product.getTimePosted());
                stm.setBoolean(10, product.isPublic());
                stm.setString(11, product.getStatus());
                stm.setString(12, product.getReason());

                // Execute the query
                int rowsAffected = stm.executeUpdate();
                if (rowsAffected > 0) {
                    result = true;
                }
            }

        } finally {

            if (stm != null) {
                con.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;
    }

}
