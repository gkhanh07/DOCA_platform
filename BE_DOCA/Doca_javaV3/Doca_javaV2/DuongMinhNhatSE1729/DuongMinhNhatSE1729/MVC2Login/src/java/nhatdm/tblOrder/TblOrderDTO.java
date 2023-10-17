/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhatdm.tblOrder;

import java.io.Serializable;
import java.sql.Date;


import java.util.UUID;

/**
 *
 * @author Admin
 */
public class TblOrderDTO implements Serializable {

    private String id;
    private Date date;
    private double total;

    public TblOrderDTO() {
    }

    public TblOrderDTO(String id, Date date, double total) {
        this.id = id;
        this.date = date;
        this.total = total;
    }

    /**
     * @return the id
     */
    public String getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * @return the date
     */
    public Date getDate() {
        return date;
    }

    /**
     * @param date the date to set
     */
    public void setDate(Date date) {
        this.date = date;
    }

    /**
     * @return the total
     */
    public double getTotal() {
        return total;
    }

    /**
     * @param total the total to set
     */
    public void setTotal(double total) {
        this.total = total;
    }

}
