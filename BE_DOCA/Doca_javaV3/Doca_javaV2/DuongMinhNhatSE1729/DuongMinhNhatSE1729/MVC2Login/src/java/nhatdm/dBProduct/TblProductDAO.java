/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhatdm.dBProduct;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import nhatdm.utils.DBHeplper;

/**
 *
 * @author Admin
 */
public class TblProductDAO implements Serializable {

    private List<TblProductDTO> itemsList;

   public List<TblProductDTO> getItemsList() {
        return itemsList;
    }

    public void SearchBook(String searchBookValues) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHeplper.makeConnetion();
            if (con != null) {
                String sql = "Select sku ,name ,quantity ,price ,status "
                        + "From  tblProduct "
                        + "Where name Like ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + searchBookValues + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String sku = rs.getString("sku");
                    String name = rs.getString("name");
                    int quantity = rs.getInt("quantity");
                    double price = rs.getDouble("price");
                    boolean status = rs.getBoolean("status");
                    //Set properties for DTO
                    TblProductDTO dto = new TblProductDTO(sku, name, quantity, price, status);
                    if (this.itemsList == null) {
                        this.itemsList = new ArrayList<TblProductDTO>();
                    }
                    this.itemsList.add(dto);
                }
            }
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
    }

    public TblProductDTO getPropertiesItems(String skuItem) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        TblProductDTO dto = null;
        try {
            con = DBHeplper.makeConnetion();
            if (con != null) {
                String sql = "Select sku ,name ,quantity ,price ,status "
                        + "From  tblProduct "
                        + "Where sku = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, skuItem);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String sku = rs.getString("sku");
                    String name = rs.getString("name");
                    int quantity = rs.getInt("quantity");
                    double price = rs.getDouble("price");
                    boolean status = rs.getBoolean("status");
                    //Set properties for DTO
                    dto = new TblProductDTO(sku, name, quantity, price, status);
                }
            }
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
        return dto;
    }
}
