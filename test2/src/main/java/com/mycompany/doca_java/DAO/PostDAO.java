/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.doca_java.DAO;

import com.mycompany.doca_java.DTO.PostDTO;
import com.mycompany.doca_java.util.DBconnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author Admin
 */
public class PostDAO {

    private List<PostDTO> ListOfPost;

    public List<PostDTO> getListOfPost() {
        return ListOfPost;
    }

    public void getAllThePost() throws SQLException, ClassNotFoundException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBconnect.makeConnection();
            if (con != null) {
                //2.create sql string
                String sql = "SELECT post_id\n"
                        + "      ,[user_id]\n"
                        + "      ,[post_content]\n"
                        + "      ,[post_image]\n"
                        + "      ,[isPublic]\n"
                        + "      ,[timePosted]\n"
                        + "      ,[status]\n"
                        + "      ,[reason]\n"
                        + "  FROM post";
                //3.create stm obj
                stm = con.prepareStatement(sql);
                //4.execute
                rs = stm.executeQuery();
                //5.process (Note: Luu y Khi SU DUNG IF/WHILE)
                while (rs.next()) {
                    int postId = rs.getInt("post_id");
                    int userId = rs.getInt("user_id");

                    String postContent = rs.getString("post_content");
                    String postImage = rs.getString("post_image");
                    boolean isPublic = rs.getBoolean("isPublic");

                    Date timePosted = rs.getDate("timePosted");

                    String status = rs.getString("status");
                    String reason = rs.getString("reason");

                    //5.1.2 set properties of pro
                    PostDTO post = new PostDTO(postId, userId, postContent, postImage, isPublic, timePosted, status, reason);
                    //5.2 add data to list
                    if (this.ListOfPost
                            == null) {
                        this.ListOfPost = new ArrayList<>();

                    }//end account list has not existed

                    this.ListOfPost.add(post);
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

}
