/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.doca_java.DAO;

import com.mycompany.doca_java.DTO.PostDTO;
import com.mycompany.doca_java.DTO.ProductDTO;
import com.mycompany.doca_java.util.DBconnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

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
                    Timestamp timePosted = rs.getTimestamp("timePosted");
                    String status = rs.getString("status");
                    String reason = rs.getString("reason");
                    PostDTO post = new PostDTO(postId, userId, postContent, postImage, isPublic, timePosted, status, reason);
                    if (this.ListOfPost
                            == null) {
                        this.ListOfPost = new ArrayList<>();
                    }
                    this.ListOfPost.add(post);
                }
            }
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

    public void getPostAvailable() throws SQLException, ClassNotFoundException, NamingException {
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
                    Timestamp timePosted = rs.getTimestamp("timePosted");
                    String status = rs.getString("status");
                    String reason = rs.getString("reason");
                    PostDTO post = new PostDTO(postId, userId, postContent, postImage, isPublic, timePosted, status, reason);
                    if (this.ListOfPost
                            == null) {
                        this.ListOfPost = new ArrayList<>();

                    }
                    if (post.isPublic() && post.getStatus().equals("accepted")) {
                        this.ListOfPost.add(post);
                    }
                }
            }
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

    //list for view
    public void getPostByCategoryID(int categoryID) throws SQLException, ClassNotFoundException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBconnect.makeConnection();
            if (con != null) {
                //2.create sql string
                String sql = "SELECT p.post_id, p.user_id, p.post_content, p.post_image, p.isPublic, p.timePosted, p.status, p.reason "
                        + "FROM post p "
                        + "JOIN categoryLinkpost clp ON p.post_id = clp.post_id "
                        + "WHERE clp.category_id = ?";
                //3.create stm obj
                stm = con.prepareStatement(sql);
                stm.setInt(1, categoryID);
                //4.execute
                rs = stm.executeQuery();
                //5.process (Note: Luu y Khi SU DUNG IF/WHILE)
                while (rs.next()) {
                    int postId = rs.getInt("post_id");
                    int userId = rs.getInt("user_id");
                    String postContent = rs.getString("post_content");
                    String postImage = rs.getString("post_image");
                    boolean isPublic = rs.getBoolean("isPublic");
                    Timestamp timePosted = rs.getTimestamp("timePosted");
                    String status = rs.getString("status");
                    String reason = rs.getString("reason");
                    PostDTO post = new PostDTO(postId, userId, postContent, postImage, isPublic, timePosted, status, reason);
                    if (this.ListOfPost
                            == null) {
                        this.ListOfPost = new ArrayList<>();
                    }
                    if (post.isPublic() && (post.getStatus().equals("accepted"))) {
                        this.ListOfPost.add(post);
                    }
                }
            }
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

    public List<PostDTO> getPostsByUserID(int userID)
            throws SQLException, ClassNotFoundException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<PostDTO> listOfPosts = new ArrayList<>();

        try {
            con = DBconnect.makeConnection();
            if (con != null) {
                // Create SQL query
                String sql = "SELECT post_id, user_id, post_content, post_image, isPublic, timePosted, status, reason "
                        + "FROM post "
                        + "WHERE user_id = ?";
                // Create prepared statement
                stm = con.prepareStatement(sql);
                stm.setInt(1, userID);
                // Execute query
                rs = stm.executeQuery();
                // Process the result set
                while (rs.next()) {
                    int postId = rs.getInt("post_id");
                    int userId = rs.getInt("user_id");
                    String postContent = rs.getString("post_content");
                    String postImage = rs.getString("post_image");
                    boolean isPublic = rs.getBoolean("isPublic");
                    Timestamp timePosted = rs.getTimestamp("timePosted");
                    String status = rs.getString("status");
                    String reason = rs.getString("reason");
                    PostDTO post = new PostDTO(postId, userId, postContent, postImage, isPublic, timePosted, status, reason);
                    listOfPosts.add(post);
                }
            }
        } finally {
            // Close resources in the finally block
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

        return listOfPosts;
    }

    public List<PostDTO> searchPostsByDescription(String postDescription)
            throws SQLException, ClassNotFoundException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<PostDTO> listOfPosts = new ArrayList<>();

        try {
            con = DBconnect.makeConnection();
            if (con != null) {
                // Create SQL query
                String sql = "SELECT post_id, user_id, post_content, post_image, isPublic, timePosted, status, reason "
                        + "FROM post "
                        + "WHERE post_content LIKE ?";
                // Create prepared statement
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + postDescription + "%");
                // Execute query
                rs = stm.executeQuery();
                // Process the result set
                while (rs.next()) {
                    int postId = rs.getInt("post_id");
                    int userId = rs.getInt("user_id");
                    String postContent = rs.getString("post_content");
                    String postImage = rs.getString("post_image");
                    boolean isPublic = rs.getBoolean("isPublic");
                    Timestamp timePosted = rs.getTimestamp("timePosted");
                    String status = rs.getString("status");
                    String reason = rs.getString("reason");
                    PostDTO post = new PostDTO(postId, userId, postContent, postImage, isPublic, timePosted, status, reason);
                    listOfPosts.add(post);
                }
            }
        } finally {
            // Close resources in the finally block
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

        return listOfPosts;
    }

    public int getNumberPage(List<PostDTO> ListOfProduct) {
        int totalProduct = ListOfProduct.size();
        if (totalProduct > 0) {
            int countPage = totalProduct / 5;
            if (totalProduct % 5 != 0) {
                countPage++;
            }
            return countPage;
        }
        return 0;
    }

    public List<PostDTO> getPaging(int index, List<PostDTO> ListOfProduct) {
        int start = (index - 1) * 5;
        int end = Math.min(start + 5, ListOfProduct.size());
        List<PostDTO> listInPage = new ArrayList<>();
        for (int i = start; i < end; i++) {
            listInPage.add(ListOfProduct.get(i));
        }
        return listInPage;
    }

    public List<PostDTO> getPostForumsbyStatus(String statusNow) throws SQLException, ClassNotFoundException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<PostDTO> listOfPostByStatus = new ArrayList<>();
        try {
            con = DBconnect.makeConnection();
            if (con != null) {
                //2.create sql string
                String sql = "SELECT [post_id]\n"
                        + "      ,[user_id]\n"
                        + "      ,[post_content]\n"
                        + "      ,[post_image]\n"
                        + "      ,[isPublic]\n"
                        + "      ,[timePosted]\n"
                        + "      ,[status]\n"
                        + "      ,[reason]\n"
                        + "  FROM [dbo].[post]"
                        + " Where status = ? ";
                //3.create stm obj
                stm = con.prepareStatement(sql);
                stm.setString(1, statusNow);
                //4.execute
                rs = stm.executeQuery();
                //5.process (Note: Luu y Khi SU DUNG IF/WHILE)
                while (rs.next()) {
                    int postId = rs.getInt("post_id");
                    int userId = rs.getInt("user_id");
                    String postContent = rs.getString("post_content");
                    String postImage = rs.getString("post_image");
                    boolean isPublic = rs.getBoolean("isPublic");
                    Timestamp timePosted = rs.getTimestamp("timePosted");
                    String status = rs.getString("status");
                    String reason = rs.getString("reason");
                    PostDTO post = new PostDTO(postId, userId, postContent, postImage, isPublic, timePosted, status, reason);
                    listOfPostByStatus.add(post);
                }//end map DB to DTO
            }//end connect is available
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
        return listOfPostByStatus;
    }

    public boolean createPostForum(PostDTO post, String categorys[]) throws SQLException, ClassNotFoundException, NamingException {
        Connection con = null;
        PreparedStatement stmPost = null;
        PreparedStatement stmLink = null;
        boolean result = false;
        try {
            con = DBconnect.makeConnection();
            if (con != null) {
                String sqlInsertPost = "INSERT INTO post (user_id, post_content, post_image, isPublic, timePosted, status, reason) VALUES (?, ?, ?, ?, ?, ?, ?)";
                stmPost = con.prepareStatement(sqlInsertPost, Statement.RETURN_GENERATED_KEYS);
                stmPost.setInt(1, post.getUserId());
                stmPost.setString(2, post.getPostContent());
                stmPost.setString(3, post.getPostImage());
                stmPost.setBoolean(4, post.isPublic());
                stmPost.setTimestamp(5, post.getTimePosted());
                stmPost.setString(6, post.getStatus());
                stmPost.setString(7, post.getReason());

                int rowsAffectedPost = stmPost.executeUpdate();
                if (rowsAffectedPost > 0) {
                    ResultSet generatedKeys = stmPost.getGeneratedKeys();
                    if (generatedKeys.next()) {
                        int postId = generatedKeys.getInt(1);
                        String sqlInsertLinkCategory = "INSERT INTO categoryLinkpost (post_id, category_id) VALUES (?, ?)";
                        stmLink = con.prepareStatement(sqlInsertLinkCategory);
                        for (String category : categorys) {
                            int categoryvalue = Integer.parseInt(category);
                            stmLink.setInt(1, postId);
                            stmLink.setInt(2, categoryvalue);
                            int rowsAffectedLinkCategory = stmLink.executeUpdate();
                            if (rowsAffectedLinkCategory <= 0) {
                                break;
                            }
                        }
                        result = true;
                    }
                }
            }

        } finally {

            if (stmPost != null) {
                stmPost.close();
            }
            if (stmLink != null) {
                stmLink.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;
    }

    public boolean setStatusPostForumByAdmin(String postId, String status, String reason) throws SQLException, ClassNotFoundException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;

        boolean result = false;
        try {
            con = DBconnect.makeConnection();
            if (con != null) {
                String sql = "UPDATE post "
                        + "SET status = ?, reason = ? "
                        + "WHERE post_id = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, status);
                stm.setString(2, reason);
                stm.setString(3, postId);
                int effectRows = stm.executeUpdate();
                //5.Process
                if (effectRows > 0) {
                    result = true;
                }
            }

        } finally {
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
