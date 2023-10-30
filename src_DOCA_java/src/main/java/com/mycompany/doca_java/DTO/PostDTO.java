/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.doca_java.DTO;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author Admin
 */
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class PostDTO implements Serializable {

    private int postId;
    private List<Integer> categoryId;
    private int userId;
    private String postContent;
    private String postImage;
    private boolean isPublic;
    private Timestamp timePosted;
    private String status;
    private String reason;

    public PostDTO(int userId, String postContent, String postImage, boolean isPublic, Timestamp timePosted, String status, String reason) {
        this.userId = userId;
        this.postContent = postContent;
        this.postImage = postImage;
        this.isPublic = isPublic;
        this.timePosted = timePosted;
        this.status = status;
        this.reason = reason;
    }

    public PostDTO(int postId, int userId, String postContent, String postImage, boolean isPublic, Timestamp timePosted, String status, String reason) {
        this.postId = postId;
        this.userId = userId;
        this.postContent = postContent;
        this.postImage = postImage;
        this.isPublic = isPublic;
        this.timePosted = timePosted;
        this.status = status;
        this.reason = reason;
    }
    
    
    
}
