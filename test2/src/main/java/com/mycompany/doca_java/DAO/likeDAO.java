/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.doca_java.DAO;

import com.mycompany.doca_java.DTO.commentDTO;
import com.mycompany.doca_java.DTO.likeDTO;
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
 * @author minhluan
 */
public class likeDAO {

    private List<likeDTO> listOfLike = new ArrayList<>();

    public List<likeDTO> getListOfLike() {
        return listOfLike;
    }

    public void getAllLike() throws SQLException, ClassNotFoundException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBconnect.makeConnection();
            if (con != null) {
                //2.create sql string
                String sql = "SELECT * FROM [like] ";
                //3.create stm obj
                stm = con.prepareStatement(sql);
                //4.execute
                rs = stm.executeQuery();
                //5.process (Note: Luu y Khi SU DUNG IF/WHILE)
                while (rs.next()) {
                    int likeId = rs.getInt("like_id");
                    int userId = rs.getInt("user_id");
                    int postID = rs.getInt("post_id");
//
//                    commentDTO comment = new commentDTO(commentId, userId, postID, commentDes);
                    likeDTO like = new likeDTO(likeId, userId, postID);
                    if (this.listOfLike
                            == null) {
                        this.listOfLike = new ArrayList<>();

                    }
                    this.listOfLike.add(like);
                }
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
    
    public boolean insertLike(int userId, int postId)
            throws SQLException, ClassNotFoundException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            con = DBconnect.makeConnection();
            if (con != null) {
                // Create SQL string
                String sql = "insert into [like](post_id,user_id) values (?,?)";
                // Create stm obj
                stm = con.prepareStatement(sql);
                // Set parameter values
                stm.setInt(1, userId);
                stm.setInt(2, postId);              
                // Execute query
                int effectRows = stm.executeUpdate();
                //5.process (Note: Luu y Khi SU DUNG IF/WHILE)
                if (effectRows > 0) {
                    result = true;
                }
            }
        } finally {
            // Close resources
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;
    }
    
        public boolean deleteLike(int likeId) throws SQLException, ClassNotFoundException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            con = DBconnect.makeConnection();
            if (con != null) {
//sql query
                String sql = "delete [like] where like_id = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, likeId);
                int effectRows = stm.executeUpdate();
                if (effectRows > 0) {
                    result = true;
                }
            }
        } finally {
            // Close resources
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
