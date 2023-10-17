/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhatdm.tblOrder;

import java.io.Serializable;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.DateTimeException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import static java.util.Collections.list;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import nhatdm.bill.BillObj;
import nhatdm.cart.CartObj;
import nhatdm.utils.DBHeplper;

/**
 *
 * @author Admin
 */
public class TblOrderDAO implements Serializable {

    public boolean insertTblOrder(CartObj cart, TblOrderDTO dto) throws SQLException, NamingException, ParseException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;
        String id = UUID.randomUUID().toString().replace("-", "").substring(0, 8);
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm");
        LocalDateTime now = LocalDateTime.now();
        // Format LocalDateTime to String
        String formattedDateTime = dtf.format(now);
        // Convert formatted date string to java.util.Date object
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
        java.util.Date parsedUtilDate = sdf.parse(formattedDateTime);
        // Convert java.util.Date to java.sql.Date
        java.sql.Date sqlDate = new java.sql.Date(parsedUtilDate.getTime());
        dto.setDate(sqlDate);
        dto.setId(id);
        dto.setTotal(cart.getTotal());
        try {
            //1. make connection 
            con = DBHeplper.makeConnetion();
            if (con != null) {
                //2.create sql String
                String sql = "Insert into tblOrder ("
                        + "id, date, total "
                        + ") Values(" + "? , ? , ? )";
                //3.create stm obj
                stm = con.prepareStatement(sql);
                stm.setString(1, id);
                stm.setDate(2, sqlDate);
                stm.setDouble(3, cart.getTotal());
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
    private List<BillObj> billObj;

    public List<BillObj> getBillObj() {
        return billObj;
    }

    public void printBill(/*TblOrderDTO orderId*/  BillObj billId) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
       BillObj bill = null;
        try {
            con = DBHeplper.makeConnetion();
            if (con != null) {
                String sql = "Select t.id as tid, t.date , t.total as total, o.total as totalItem,o.sku, o.price, o.quantity, p.name "
                        + "From orderDetails o Join tblOrder t "
                        + "On t.id = o.orderId "
                        + "Join tblProduct p "
                        + "On o.sku = p.sku "
                        + "Where t.id = ? and p.sku = ? ";
                stm = con.prepareStatement(sql);
//                stm.setString(1, orderId.getId());
                stm.setString(1, billId.getIdOrder());
                stm.setString(2, billId.getSku());
                
                rs = stm.executeQuery();
                while (rs.next()) {
                    if (this.billObj == null) {
                        this.billObj = new ArrayList<>();
                    }
                    String id = rs.getString("tid");
                    String sku = rs.getString("sku");
                    java.sql.Date date = rs.getDate("date");
                    Double totalBill = rs.getDouble("total");
                    Double totalItem = rs.getDouble("totalItem");
                    Double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    String name = rs.getString("name");
                    bill = new BillObj(id, date, totalBill, totalItem, sku, price, quantity, name);
                    this.billObj.add(bill);
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
}
