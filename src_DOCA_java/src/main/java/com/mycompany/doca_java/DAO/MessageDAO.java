/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.doca_java.DAO;

import com.mycompany.doca_java.DTO.MessageDTO;
import com.mycompany.doca_java.util.DBconnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author Admin
 */
public class MessageDAO {

    private List<MessageDTO> ListOfMessage;

    public List<MessageDTO> getListOfConversation() {
        return ListOfMessage;
    }

    public void getListMessageByConversationID(int conversation_id) 
            throws SQLException, ClassNotFoundException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBconnect.makeConnection();
            if (con != null) {
                //2.create sql string
                String sql = " SELECT [conversation_id], [user_id], [messages_content], [messages_time]\n"
                        + "FROM [dbo].[messages]\n"
                        + "WHERE [conversation_id] = ?";
                //3.create stm obj
                stm = con.prepareStatement(sql);
                stm.setInt(1, conversation_id);
                //4.execute
                rs = stm.executeQuery();
                //5.process (Note: Luu y Khi SU DUNG IF/WHILE)
                while (rs.next()) {
                    int user_id = rs.getInt("user_id");
                    String messages_content = rs.getString("messages_content");
                    Timestamp messages_time = rs.getTimestamp("messages_time");

                    MessageDTO message= new MessageDTO(conversation_id, user_id, messages_content, messages_time);
                    if (this.ListOfMessage
                            == null) {
                        this.ListOfMessage = new ArrayList<>();
                    }
                    this.ListOfMessage.add(message);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }

            if (stm != null) {
                con.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
}
