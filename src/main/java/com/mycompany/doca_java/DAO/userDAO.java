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
                        + "      ,[fullname]\n"
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
                    String fullname = rs.getString("fullname");
                    result = new userDTO(user_ID, username, password, Gender, email, email, status, roleID, avatar, fullname);
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
    
    
public boolean createUser(userDTO user) {
    Connection con = null;
        try {
            con = DBconnect.makeConnection();
            if (con != null) {
                String sql = "INSERT INTO users ([username], "
                        + "[password], "
                        + "[Gender], "
                        + "[email], "
                        + "[mobile_num], "
                        + "[status], "
                        + "[role_id], "
                        + "[avatar], "
                        + "[fullname]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, user.getUserName());
                ps.setString(2, user.getPassword());
                ps.setString(3, user.getGender());
                ps.setString(4, user.getEmail());
                ps.setString(5, user.getMobileNum());
                ps.setBoolean(6, user.isStatus());
                ps.setBoolean(7, true);
                ps.setString(8, user.getAvatar());
                ps.setString(9, user.getFullname());
                int rowsAffected = ps.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (SQLException | ClassNotFoundException | NamingException e) {
            e.printStackTrace();
        }
        return false;
    }

public boolean isUsernameAvailable(String username) {
    Connection con = null;
    try {
        con = DBconnect.makeConnection();
        if (con != null) {
            String sql = "SELECT COUNT(*) FROM users WHERE username = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                return count == 0; // If count is 0, the username is available
            }
        }
    } catch (SQLException | ClassNotFoundException | NamingException e) {
        e.printStackTrace();
    }
    return false;
}
    public boolean isEmailAvailable(String email) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = DBconnect.makeConnection();
            if (con != null) {
                String sql = "SELECT COUNT(*) FROM users WHERE email = ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, email);
                rs = ps.executeQuery();

                if (rs.next()) {
                    int count = rs.getInt(1);
                    return count == 0; // If count is 0, the email is available; otherwise, it's taken.
                }
            }
        } catch (SQLException | ClassNotFoundException | NamingException e) {
            e.printStackTrace();
        } finally {
            // Close resources (rs, ps, con)
        }

        return false; // Return false in case of an error
    }
    
}
