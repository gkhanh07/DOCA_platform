/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.doca_java.DAO;

import com.mycompany.doca_java.DTO.saveProductDTO;
import com.mycompany.doca_java.util.DBconnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author Admin
 */
public class saveProductDAO {

    private List<saveProductDTO> listOfSaveProduct = new ArrayList<>();

    public List<saveProductDTO> getListOfSaveProduct() {
        return listOfSaveProduct;
    }

    public void getSaveProductByuserID(int userID) throws SQLException, ClassNotFoundException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBconnect.makeConnection();
            if (con != null) {
                //2.create sql string
                String sql = "SELECT sp.product_id\n"
                        + "FROM saveProduct sp\n"
                        + "JOIN users u ON sp.user_id = u.user_id\n"
                        + "WHERE u.user_id = ?";
                //3.create stm obj
                stm = con.prepareStatement(sql);
                stm.setInt(1, userID);
                //4.execute
                rs = stm.executeQuery();
                //5.process (Note: Luu y Khi SU DUNG IF/WHILE)
                while (rs.next()) {
                    int productId = rs.getInt("product_id");
                    //5.1.2 set properties of pro
                    saveProductDTO savedProduct = new saveProductDTO(productId);

                    //5.2 add data to list
                    if (this.listOfSaveProduct
                            == null) {
                        this.listOfSaveProduct = new ArrayList<>();

                    }//end account list has not existed

                    this.listOfSaveProduct.add(savedProduct);
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

    public boolean createSaveProduct(int userID, int productId) throws SQLException, ClassNotFoundException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            con = DBconnect.makeConnection();
            if (con != null) {
                //2.create sql string
                String sql = "INSERT INTO saveProduct (user_id, product_id)\n"
                        + "VALUES (?, ?);";
                //3.create stm obj
                stm = con.prepareStatement(sql);
                stm.setInt(1, userID);
                stm.setInt(2, productId);
                //4.execute
                int effectRows = stm.executeUpdate();
                //5.process (Note: Luu y Khi SU DUNG IF/WHILE)
                if (effectRows > 0) {
                    result = true;
                }
            }//end connect is available
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
