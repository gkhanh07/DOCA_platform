/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.doca_java.DTO;

import java.io.Serializable;
import java.util.Date;
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
public class ProductDTO implements Serializable{

    private int productId;
    private int userId;
    private int categoryId;
    private String title;
    private String description;
    private String productImage;
    private boolean isFree;
    private float price;
    private String address;
    private Date timePosted;
    private boolean isPublic;
    private String status;
    private String reason; 

  
    
    
    
}
