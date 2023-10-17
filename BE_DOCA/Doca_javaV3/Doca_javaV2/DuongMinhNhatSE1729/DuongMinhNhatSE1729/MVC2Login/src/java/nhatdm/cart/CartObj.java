/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhatdm.cart;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import javax.naming.NamingException;
import nhatdm.dBProduct.TblProductDAO;
import nhatdm.dBProduct.TblProductDTO;
import nhatdm.tblOrder.TblOrderDAO;
import nhatdm.tblOrder.TblOrderDTO;

/**
 *
 * @author Admin
 */
public class CartObj implements Serializable {

    private Map<String, Integer> items;

    public Map<String, Integer> getItems() {
        return items;
    }

    public void addItemToCart(String sku) {
        //Ngan chua do
        if (sku == null) {
            return;
        }
        if (sku.trim().isEmpty()) {
            return;
        }
        //1. check existed items (cai gio co chua)
        if (this.items == null) {
            this.items = new HashMap<>();
        }
        //2. check exsited item
        int quantity = 1;
        if (this.items.containsKey(sku)) {//check do co ton tai hay chua
            quantity = this.items.get(sku) + 1;
        }
        //3. update items
        this.items.put(sku, quantity);
    }

    public void addItemToCartWithQuantity(String sku, int quantityAdd) {
        //Ngan chua do
        if (sku == null) {
            return;
        }
        if (sku.trim().isEmpty()) {
            return;
        }
        //1. check existed items (cai gio co chua)
        if (this.items == null) {
            this.items = new HashMap<>();
        }
        //2. check exsited item
        int totalQuantity = quantityAdd;
        if (this.items.containsKey(sku)) {//check do co ton tai hay chua
            totalQuantity = this.items.get(sku)+quantityAdd;
        }
        //3. update items
        this.items.put(sku, totalQuantity);
    }

    public void removeItemFromCart(String sku) {
        //1. check cai ngan chua do ton tai hay ko Check exsited items
        if (this.items == null) {
            return;
        }
        //2. check exsited item
        if (this.items.containsKey(sku)) {
            //3. Remove item
            this.items.remove(sku);
            if (this.items.isEmpty()) {
                this.items = null;
            }
        }
    }

    public TblProductDTO getItemProperties(String sku) throws SQLException, NamingException {
        if (sku == null) {
            return null;
        }
        TblProductDAO dao = new TblProductDAO();
        TblProductDTO dto = dao.getPropertiesItems(sku);
        return dto;
    }
    public double getTotal() throws SQLException, NamingException{
        double total = 0;
        for (String key : items.keySet()){
            total += getItemProperties(key).getPrice() * items.get(key);
        }
        return total; 
    }
    

}
