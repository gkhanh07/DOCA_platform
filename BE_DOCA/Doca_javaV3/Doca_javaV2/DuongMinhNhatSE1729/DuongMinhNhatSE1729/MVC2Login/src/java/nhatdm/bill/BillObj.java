/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhatdm.bill;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author Admin
 */
public class BillObj implements Serializable {

    private String idOrder;
    private Date date;
    private double total;
    private double totalItem;
    private String sku;
    private double price;
    private int quantity;
    private String name;

    public BillObj() {
    }

    public BillObj(String idOrder, Date date, double total, double totalItem, String sku, double price, int quantity, String name) {
        this.idOrder = idOrder;
        this.date = date;
        this.total = total;
        this.totalItem = totalItem;
        this.sku = sku;
        this.price = price;
        this.quantity = quantity;
        this.name = name;
    }

    

    public double getTotalItem() {
        return totalItem;
    }

    public void setTotalItem(double totalItem) {
        this.totalItem = totalItem;
    }

    public String getIdOrder() {
        return idOrder;
    }

    public void setIdOrder(String idOrder) {
        this.idOrder = idOrder;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getSku() {
        return sku;
    }

    public void setSku(String sku) {
        this.sku = sku;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
