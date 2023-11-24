/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.doca_java.DAO;

import com.mycompany.doca_java.util.DBconnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import javax.naming.NamingException;

/**
 *
 * @author Admin
 */
public class AccessCountDAO {

    public boolean isAccessCountExists(LocalDate date) throws SQLException, ClassNotFoundException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBconnect.makeConnection();
            String sql = "SELECT COUNT(*) FROM access_counts WHERE date = ?";
            stm = con.prepareStatement(sql);
            stm.setObject(1, date);
            rs = stm.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0;
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
        return false;
    }

    public void createAccessCount(LocalDate date) throws SQLException, ClassNotFoundException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBconnect.makeConnection();
            String sql = "INSERT INTO access_counts (date, count) VALUES (?, 0)";
            stm = con.prepareStatement(sql);
            stm.setObject(1, date);
            stm.executeUpdate();
            rs = stm.executeQuery();

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

    public int getAccessCount() throws SQLException, ClassNotFoundException, NamingException {
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        int count = 0;
        try {

            con = DBconnect.makeConnection();
            String sql = "SELECT count FROM access_counts WHERE date = ?";
            stmt = con.prepareStatement(sql);
            stmt.setObject(1, LocalDate.now());
            rs = stmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt("count");
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return count;
    }

    public void updateAccessCount(int count) throws SQLException, ClassNotFoundException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBconnect.makeConnection();
            String sql = "UPDATE access_counts SET count = ? WHERE date = ?";
            stm = con.prepareStatement(sql);
            stm.setInt(1, count);
            stm.setObject(2, LocalDate.now());
            stm.executeUpdate();
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
