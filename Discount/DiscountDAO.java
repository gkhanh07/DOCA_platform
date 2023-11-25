/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.doca_java.DAO;

import com.mycompany.doca_java.DTO.DiscountDTO;
import com.mycompany.doca_java.util.DBconnect;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author Admin
 */
public class DiscountDAO {

    public boolean createDiscount(int productId, String discountType, double discountValue, double newPrice, Date startDate, Date endDate, boolean status) throws ClassNotFoundException, NamingException, SQLException {
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DBconnect.makeConnection();
            if (con != null) {
                String sql = "INSERT INTO [dbo].[discount]\n"
                        + "           ([productId]\n"
                        + "           ,[discount_type]\n"
                        + "           ,[discount_amount]\n"
                        + "           ,[new_price]\n"
                        + "           ,[start_date]\n"
                        + "           ,[end_date]\n"
                        + "           ,[statusDiscount])\n"
                        + "     VALUES\n"
                        + "           (?, ?, ?, ?, ?, ?, ?)";
                ps = con.prepareStatement(sql);
                ps.setInt(1, productId);
                ps.setString(2, discountType);
                ps.setDouble(3, discountValue);
                ps.setDouble(4, newPrice);
                java.sql.Date sqlStartDate = new java.sql.Date(startDate.getTime());
                java.sql.Date sqlEndDate = new java.sql.Date(endDate.getTime());
                ps.setDate(5, sqlStartDate);
                ps.setDate(6, sqlEndDate);
                ps.setBoolean(7, status);

                int rowsAffected = ps.executeUpdate();
                if (rowsAffected > 0) {
                    return true;
                }
            }
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public void updateDiscountStatus() throws SQLException, ClassNotFoundException, NamingException {
        Connection con = null;
        PreparedStatement stmt = null;

        try {
            con = DBconnect.makeConnection();
            if (con != null) {
                // Lấy ngày hiện tại
                LocalDate currentDate = LocalDate.now();
                // Câu lệnh SQL UPDATE
                String sql = "UPDATE discount SET statusDiscount = (CASE WHEN ? >= start_date AND ? <= end_date THEN 1 ELSE 0 END)";
                stmt = con.prepareStatement(sql);
                stmt.setObject(1, currentDate);
                stmt.setObject(2, currentDate);

                // Thực thi câu lệnh UPDATE
                stmt.executeUpdate();

            }
        } finally {
            if (stmt != null) {
                stmt.close();
            }
            if (con != null) {
                con.close();
            }
        }

    }

    public List<DiscountDTO> listSaled(boolean status, int productId, int userId) throws SQLException, ClassNotFoundException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<DiscountDTO> list = new ArrayList<>();
        try {
            //1.make connection
            con = DBconnect.makeConnection();
            if (con != null) {
                //2.create sql string
                String sql = " SELECT d.discount_id, d.productId, d.discount_type, d.discount_amount, d.new_price, d.start_date, d.end_date, d.statusDiscount,\n"
                        + "       p.product_id, p.user_id, p.category_id, p.title, p.description, p.product_image, p.is_free, p.price, p.address, p.timePosted, p.isPublic, p.status, p.reason\n"
                        + "FROM discount AS d\n"
                        + "JOIN product AS p ON p.product_id = d.productId\n"
                        + "WHERE p.product_id = ? AND p.user_id = ?;";
                //3.create stm obj
                stm = con.prepareStatement(sql);

                //4.execute
                rs = stm.executeQuery();
                //5.process (Note: Luu y Khi SU DUNG IF/WHILE)
                while (rs.next()) {
//              
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }

            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }

        }
        return list;
    }
}
