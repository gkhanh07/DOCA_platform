/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.doca_java.DAO;

import com.mycompany.doca_java.DTO.commentDTO;
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
public class commentDAO {

    private List<commentDTO> listOfComment = new ArrayList<>();

    public List<commentDTO> getListOfComment() {
        return listOfComment;
    }

    public void getCommentByPostId(int postId) throws SQLException, ClassNotFoundException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBconnect.makeConnection();
            if (con != null) {
                //2.create sql string
                String sql = "SELECT * FROM comment WHERE post_id = ?";
                //3.create stm obj
                stm = con.prepareStatement(sql);
                stm.setInt(1, postId);
                //4.execute
                rs = stm.executeQuery();
                //5.process (Note: Luu y Khi SU DUNG IF/WHILE)
                while (rs.next()) {
                    int commentId = rs.getInt("comment_id");
                    int userId = rs.getInt("user_id");
                    String commentDes = rs.getString("commentDes");
//
                    commentDTO comment = new commentDTO(commentId, userId, postId, commentDes);
                    if (this.listOfComment
                            == null) {
                        this.listOfComment = new ArrayList<>();

                    }
                    this.listOfComment.add(comment);
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
}
