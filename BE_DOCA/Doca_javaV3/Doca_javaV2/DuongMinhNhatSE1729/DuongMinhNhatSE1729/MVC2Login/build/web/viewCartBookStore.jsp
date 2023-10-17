<%-- 
    Document   : viewCartBookStore
    Created on : Jun 25, 2023, 4:01:04 PM
    Author     : Admin
--%>

<%@page import="java.util.Map"%>
<%@page import="nhatdm.cart.CartObj"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Book Store</title>
    </head>
    <body>
       Customer: <c:if test="${not empty sessionScope.USER}"><font style="color: red">${sessionScope.USER.fullname}</font></c:if>
        <c:if test="${empty sessionScope.USER}"><font style="color: red">GUEST</font></c:if><br>
        
        <h1 style="color: red">Your Cart Include</h1>
        <c:if test="${not empty sessionScope}">
            <c:set var="cart" value="${sessionScope.CART_OF_CUST}" />
            <c:if test="${not empty cart}">
                <c:if test="${not empty cart.items }">
                    <table border="1">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>Sku</th>
                                <th>Name</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                        <form action="DispatchServlet">

                            <c:forEach var="obj" items="${cart.items}" varStatus="counter">
                                <c:set var="itemProperties" value="${cart.getItemProperties(obj.key)}" />
                                <tr>
                                    <td>
                                        ${counter.count}
                                    </td>
                                    <td>
                                        ${obj.key}
                                    </td>
                                    <td>
                                        ${itemProperties.name}
                                    </td>
                                    <td>
                                        ${itemProperties.price}
                                    </td>
                                    <td>
                                        ${obj.value}
                                    </td>
                                    <td>
                                        <input type="checkbox" name="checkItemDel" value="${obj.key}"
                                    </td> 
                                </tr>
                            </c:forEach>
                            <tr>
                                <td colspan="5" >
                                    <c:set var="lastSearchBook" value="${param.lastSearchBook}"/>
                                    <input type="hidden" name="lastSearchItem" value="${lastSearchBook}" />
                                    <c:url var="buyLink" value="DispatchServlet">
                                        <c:param name="btAction" value="Search Book"></c:param>
                                        <c:param name="txtSearchBook" value="${lastSearchBook}"></c:param>
                                    </c:url>
                                    <div style="margin: 5px"><a href="${buyLink}">Click here to continous buy book</a></div>
                                </td>
                                <td >
                                    <input style="margin: 5px" type="submit" value="Remove Items From Cart" name="btAction" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2"><input width="20px" style="margin: 20px" type="submit" value="CheckOut" name="btAction" /></td>
                                <td colspan="4"><h2 style="color: red">Total : ${cart.getTotal()}</h2></td>
                            </tr>
                        </form>
                    </tbody>
                </c:if>
                <c:if test="${empty cart.items }">
                    <c:set var="lastSearchBook" value="${param.lastSearchBook}"/>
                                    <input type="hidden" name="lastSearchItem" value="${lastSearchBook}" />
                                    <c:url var="buyLink" value="DispatchServlet">
                                        <c:param name="btAction" value="Search Book"></c:param>
                                        <c:param name="txtSearchBook" value="${lastSearchBook}"></c:param>
                                    </c:url>
                    <h4 style="color: blue"><a href="${buyLink}">Click here to continous buy book</a></h4>
                    <h2>You are remove all item from your Cart</h2>
                </c:if>
            </c:if>
        </c:if>
        <c:if test="${empty cart}">
            <h2>Your Cart Is Null</h2>
        </c:if>
</body>














<%--      <%
          if (session != null) {
              CartObj cart = (CartObj) session.getAttribute("CART_OF_CUST");
              if (cart != null) {
                  Map<String, Integer> items = cart.getItems();
                  if (items != null) {
      %>
      <table border="1">
          <thead>
              <tr>
                  <th>No.</th>
                  <th>Sku</th>
                  <th>Name</th>
                  <th>Price</th>
                  <th>Quantity</th>
                  <th>Action</th>
              </tr>
          </thead>
          <tbody>
          <form action="DispatchServlet">
              <% String searchBook = request.getParameter("lastSearchBook");
                  String urlRewriting = "DispatchServlet"
                          + "?btAction=Search Book"
                          + "&txtSearchBook=" + searchBook;
                  int count = 0;
                  for (String key : items.keySet()) {
              %>
              <tr>
                  <td><%=++count%></td>
                  <td>
                      <%= key%>
                      <input type="hidden" name="txtSku" value="<%= key%>" />
                  </td>
                  <td><%= cart.getItemProperties(key).getName()%></td>
                  <td>
                      <%= cart.getItemProperties(key).getPrice()%>
                      <input type="hidden" name="txtPrice" value="<%= cart.getItemProperties(key).getPrice()%>"/>
                  </td>
                  <td>
                      <input type="number" name="txtQuantity" value="<%=items.get(key)%>" />
                  </td>
                  <td> <input type="checkbox" name="checkItemDel" value="<%=key%>" /> </td>
              </tr>
              <%
                  }

                %>
                <tr>
                    <td colspan="5" >
                        <div style="margin: 5px"><a href="<%= urlRewriting%>">Click here to continous buy book</a></div>
                    </td>
                    <td >
                        <input style="margin: 5px" type="submit" value="Remove Items From Cart" name="btAction" />
                    </td>
                </tr>
                <tr>
                    <td><input width="20px" style="margin: 20px" type="submit" value="CheckOut" name="btAction" /></td>
                <tr>
            </form>
        </tbody>
    </table>

    <%                        return;
                }
            }//end cart

        }//end of session
    %>

    <h2>No record existed</h2>
</body>--%>
</html>
