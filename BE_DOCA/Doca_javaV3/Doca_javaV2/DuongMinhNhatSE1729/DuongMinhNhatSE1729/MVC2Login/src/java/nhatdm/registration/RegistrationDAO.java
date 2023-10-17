/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhatdm.registration;

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
public class RegistrationDAO implements Serializable {

   // public boolean checkLogin(String username, String password) throws SQLException, /*ClassNotFoundException*/ NamingException {
    public RegistrationDTO checkLogin(String username, String password) throws SQLException, /*ClassNotFoundException*/ NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        RegistrationDTO result = null;
        try {
            //1. make connection 
            con = DBHeplper.makeConnetion();
            if (con != null) {
                //2.create sql String
                String sql = "Select lastname ,isAdmin "
                        + "From Registration "
                        + "Where username = ? "
                        + "And password = ?";
                //3.create stm obj
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                //4.execute
                rs = stm.executeQuery();
                //5.Precess
                if (rs.next()) {
                    //5.map : get data from ResultSet & set data prorperties DTO
                    String fullname = rs.getString("lastname");
                    boolean role = rs.getBoolean("isAdmin");
                    result = new RegistrationDTO(username, password, fullname, role);
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
        return result;
    }
    private List<RegistrationDTO> accountList;

    public List<RegistrationDTO> getAccountList() {
        return accountList;
    }

    public void searchLastName(String searchValues) throws SQLException, /*ClassNotFoundException*/ NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1 make connection
            con = DBHeplper.makeConnetion();
            if (con != null) {
                //2.create sql String
                String sql = "Select username ,password ,lastname ,isAdmin "
                        + "From Registration "
                        + "Where lastname Like ?";
                //3.create stm obj
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + searchValues + "%");
                //4.execute query
                rs = stm.executeQuery();
                //5 process
                while (rs.next()) {
                    //5.1 map
                    //5.1.1 get data from ResultSet
                    String username = rs.getString("username");
                    String password = rs.getString("password");
                    String fullname = rs.getString("lastname");
                    boolean role = rs.getBoolean("isAdmin");
                    //5.1.2 set propertie of DTO
                    RegistrationDTO dto = new RegistrationDTO(username, password, fullname, role);
                    //5.2 add data to list
                    if (this.accountList == null) {
                        this.accountList = new ArrayList<RegistrationDTO>();
                    }//end account list has not exist
                    this.accountList.add(dto);
                }//end map DB to DTO
            }//end connecttion is available
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

    public boolean deleteAccount(String username) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;

        boolean result = false;
        try {
            //1. make connection 
            con = DBHeplper.makeConnetion();
            if (con != null) {
                //2.create sql String
                String sql = "Delete From Registration "
                            + "Where username = ?";
                //3.create stm obj
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
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
    
    public boolean update(String username,String password, boolean role) throws SQLException, NamingException{
        Connection con = null;
        PreparedStatement stm = null;

        boolean result = false;
        try {
            //1. make connection 
            con = DBHeplper.makeConnetion();
            if (con != null) {
                //2.create sql String
                String sql = "Update Registration "
                            +"Set password = ?, "
                            +"isAdmin = ? "
                            +"Where username = ?";
                //3.create stm obj
                stm = con.prepareStatement(sql);
                stm.setString(1, password);
                stm.setBoolean(2, role);
                stm.setString(3, username);
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
    public boolean createAccount (RegistrationDTO account) throws SQLException,NamingException{
        Connection con = null;
        PreparedStatement stm = null;

        boolean result = false;
        try {
            //1. make connection 
            con = DBHeplper.makeConnetion();
            if (con != null) {
                //2.create sql String
                String sql = "Insert into Registration ("
                            +"username, password, lastname, isAdmin"
                        +") Values(" +"? , ? , ? , ? )";
                //3.create stm obj
                stm = con.prepareStatement(sql);
                stm.setString(1,account.getUsername());
                stm.setString(2, account.getPassword());
                stm.setString(3, account.getFullname());
                stm.setBoolean(4, account.isRole());
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
