/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhatdm.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author Admin
 */
public class DBHeplper {

    public static Connection makeConnetion() throws /*ClassNotFoundException*/ SQLException, NamingException {
        //1.Get current context (catch NamingExcep)
        Context currentContext = new InitialContext();
        //2. Get web app server context
        Context tomcatContext = (Context) currentContext.lookup("java:comp/env");//mat danh cua tomcat
        //3. Look up  DS from web app context // Dung dung kieu datasource cua sql.DataSource
        DataSource ds = (DataSource) tomcatContext.lookup("DBSE1729");
        //4. Get connection
        Connection con = ds.getConnection();
        return con;

//        //1.load driver
//        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//        //2.create coonect String
//        String url = "jdbc:sqlserver://"
//                +"localhost:1433;" 
//                +"databaseName=SE1729";
//        //3.open connect
//        Connection con = DriverManager.getConnection(url,"sa","sa");
//        //4.return connect to call
//        return con;
    }

}
