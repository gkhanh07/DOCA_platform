<%-- 
    Document   : viewCart
    Created on : Jun 19, 2023, 11:32:34 PM
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
        <h1>Your Cart include</h1>
        <%
            if (session != null) {
                CartObj cart = (CartObj) session.getAttribute("CART");
                if (cart != null) {
                    Map<String, Integer> items = cart.getItems();
                    if (items != null) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>Title</th>
                    <th>Quantity</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            <form action="DispatchServlet">
                <%
                    int count = 0;
                    for (String key : items.keySet()) {
                %>
                <tr>
                    <td><%=++count%></td>
                    <td><%= key%></td>
                    <td><%= items.get(key)%></td>
                    <td> <input type="checkbox" name="checkItem" value="<%= key%>" /> </td>
                </tr>
                <%
                    }

                %>
                <tr>
                    <td colspan="3">
                        <a href="bookStore.html">Click here to continous buy book</a>
                    </td>
                    <td>
                        <input type="submit" value="Remove Book From Cart" name="btAction" />
                    </td>
                </tr>
            </form>

        </tbody>
    </table>





    <%                        return;
                }
            }//end cart

        }//end of session
    %>

    <h2>No record existed</h2>
</body>
</html>
