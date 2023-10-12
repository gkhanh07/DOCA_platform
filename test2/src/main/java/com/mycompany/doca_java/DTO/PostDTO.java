/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.doca_java.DTO;

import java.io.Serializable;
import java.util.Date;
//import lombok.AllArgsConstructor;
//
//import lombok.Getter;
//import lombok.NoArgsConstructor;
//import lombok.Setter;
//import lombok.ToString;

/**
 *
 * @author Admin
 */
public class PostDTO implements Serializable {

    private int postId;
    private int userId;
    private String postContent;
    private String postImage;
    private boolean isPublic;
    private Date timePosted;
    private String status;
    private String reason;

    public PostDTO() {
    }

    public PostDTO(int postId, int userId, String postContent, String postImage, boolean isPublic, Date timePosted, String status, String reason) {
        this.postId = postId;
        this.userId = userId;
        this.postContent = postContent;
        this.postImage = postImage;
        this.isPublic = isPublic;
        this.timePosted = timePosted;
        this.status = status;
        this.reason = reason;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getPostContent() {
        return postContent;
    }

    public void setPostContent(String postContent) {
        this.postContent = postContent;
    }

    public String getPostImage() {
        return postImage;
    }

    public void setPostImage(String postImage) {
        this.postImage = postImage;
    }

    public boolean isIsPublic() {
        return isPublic;
    }

    public void setIsPublic(boolean isPublic) {
        this.isPublic = isPublic;
    }

    public Date getTimePosted() {
        return timePosted;
    }

    public void setTimePosted(Date timePosted) {
        this.timePosted = timePosted;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

}
