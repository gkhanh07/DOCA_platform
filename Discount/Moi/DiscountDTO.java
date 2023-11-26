/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.doca_java.DTO;

import java.sql.Date;
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
public class DiscountDTO {

    private int userId;
    private int productId;
    private double discount_amount;
    private double new_price;
    private Date start_date;
    private Date end_date;
    private boolean statusDiscount;

    public DiscountDTO(int productId, double discount_amount, double new_price, Date start_date, Date end_date, boolean statusDiscount) {
        this.productId = productId;
        this.discount_amount = discount_amount;
        this.new_price = new_price;
        this.start_date = start_date;
        this.end_date = end_date;
        this.statusDiscount = statusDiscount;
    }
    
}
