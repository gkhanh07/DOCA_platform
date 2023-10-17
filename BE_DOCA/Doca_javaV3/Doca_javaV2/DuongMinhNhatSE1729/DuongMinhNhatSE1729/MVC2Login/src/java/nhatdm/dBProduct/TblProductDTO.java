/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhatdm.dBProduct;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class TblProductDTO implements Serializable{
    private String sku;
    private String name;
    private int quantity;
    private double price;
    private boolean bit;

    public TblProductDTO() {
    }

    public TblProductDTO(String sku, String name, int quantity, double price, boolean bit) {
        this.sku = sku;
        this.name = name;
        this.quantity = quantity;
        this.price = price;
        this.bit = bit;
    }

    /**
     * @return the sku
     */
    public String getSku() {
        return sku;
    }

    /**
     * @param sku the sku to set
     */
    public void setSku(String sku) {
        this.sku = sku;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the quantity
     */
    public int getQuantity() {
        return quantity;
    }

    /**
     * @param quantity the quantity to set
     */
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    /**
     * @return the price
     */
    public double getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(double price) {
        this.price = price;
    }

    /**
     * @return the bit
     */
    public boolean isBit() {
        return bit;
    }

    /**
     * @param bit the bit to set
     */
    public void setBit(boolean bit) {
        this.bit = bit;
    }
    
}
