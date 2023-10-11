/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.doca_java.DAO;

import com.mycompany.doca_java.DTO.userDTO;
import com.mycompany.doca_java.util.DBconnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;

/**
 *
 * @author Admin
 */
public class userDAO {

    public userDTO checkLogin(String username, String password)
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        userDTO result = null;
        try {
            //1.make connection
            con = DBconnect.makeConnection();
            if (con != null) {
                //2.create sql string
                String sql = "SELECT [user_id]\n"
                        + "      ,[Gender]\n"
                        + "      ,[email]\n"
                        + "      ,[mobile_num]\n"
                        + "      ,[status]\n"
                        + "      ,[role_id]\n"
                        + "      ,[avatar]\n"
                        + "FROM [dbo].[users]\n"
                        + "WHERE [username] = ? AND [password] = ?;";
                //3.create stm obj
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                //4.execute
                rs = stm.executeQuery();
                //5.process (Note: Luu y Khi SU DUNG IF/WHILE)
                if (rs.next()) {
//                    result = true;
                    //map:get data from ResultSet & set data to property's DTO
                    int user_ID = rs.getInt("user_id");
                    String Gender= rs.getString("Gender");
                    String email= rs.getString("email");
                    String phone= rs.getString("mobile_num");
                    boolean status=rs.getBoolean("status");
                    boolean roleID = rs.getBoolean("role_id");
                    String avatar= rs.getString("avatar");
                    result = new userDTO(user_ID, username, password, Gender, email, email, status, roleID, avatar);
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
        return result;
    }
}
