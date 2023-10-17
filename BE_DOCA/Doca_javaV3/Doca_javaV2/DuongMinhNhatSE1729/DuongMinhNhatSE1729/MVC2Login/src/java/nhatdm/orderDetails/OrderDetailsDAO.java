/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhatdm.orderDetails;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.naming.NamingException;
import nhatdm.tblOrder.TblOrderDTO;
import nhatdm.utils.DBHeplper;

/**
 *
 * @author Admin
 */
public class OrderDetailsDAO implements Serializable {

    public boolean insertOrderDetail(OrderDetailsDTO dto) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            //1. make connection 
            con = DBHeplper.makeConnetion();
            if (con != null) {
                //2.create sql String
                String sql = "Insert into orderDetails ("
                        + "sku ,orderId ,price ,quantity ,total "
                        + ") Values (" + "? , ? , ? , ? , ? )";
                //3.create stm obj
                stm = con.prepareStatement(sql);
                stm.setString(1, dto.getSku());
                stm.setString(2, dto.getOrderId());
                stm.setDouble(3, dto.getPrice());
                stm.setInt(4, dto.getQuantity());
                stm.setDouble(5, dto.getTotal());
              
                //4.execute
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
