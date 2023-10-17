<%-- 
    Document   : viewCart
    Created on : Jun 19, 2023, 1:36:44 PM
    Author     : Admin
--%>

<%@page import="java.util.Map"%>
<%@page import="nhatdm.cart.CartObj"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Store</title>
    </head>
    <body>
        <h1>Your cart include</h1>
        <%
            //1.Cust goes his/her cart's place ()den noi lay gio cua cust
            if (session != null) {//neu co thi show
                //2.Cust takes his/her cart
                CartObj cart = (CartObj)session.getAttribute("CART");
                if (cart != null) {
                    //3.Cust gets items lay ngan chua do
                    Map <String, Integer> items = cart.getItems();
                    if (items != null) {
                        //4.Cust picks all items up
        %>

        
        <form action="DispatchServlet">

            <table border="1">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Name</th>
                        <th>Quantity</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int count = 0;
                        for (String key : items.keySet()) {
                    %>

                    <tr>
                        <td>
                            <%= ++count%>
                        </td>
                        <td>
                            <%= key%>
                        </td>
                        <td>
                            <%= items.get(key)%>
                        </td>
<!--                        <td>

                            <input type="checkbox" name="checkItem" value="<%=key%>" />

                        </td>
                    <tr>
                        <td colspan="3" >
                            <a href="shooping.html">add more item to your cart </a>
                        </td>
                        <td>
                            <input type="submit" value="add more item to your cart" name="btAction" />
                        </td>
                        <td>
                            <input type="submit" value="remove" name="btAction" />
                        </td> 
                    </tr>
                    </tr>-->

                    <%
                        }//traveser ech item
                    %>
                    
                </tbody>
            </table>
        </form>
        <%
                        return;
                    }//end items has existed
                }//car has existed

            }//end session has exsited

        %>
        <h2>No carts is existed</h2>
    </body>
</html>
