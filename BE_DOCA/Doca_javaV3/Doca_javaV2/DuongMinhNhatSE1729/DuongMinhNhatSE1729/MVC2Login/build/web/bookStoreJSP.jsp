<%-- 
    Document   : bookStoreJSP
    Created on : Jun 22, 2023, 12:05:57 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.Map"%>
<%@page import="nhatdm.cart.CartObj"%>
<%@page import="nhatdm.dBProduct.TblProductDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Store</title>
    </head>
    <body>
        Customer: <c:if test="${not empty sessionScope.USER}"><font style="color: red">${sessionScope.USER.fullname}</font></c:if>
        <c:if test="${empty sessionScope.USER}"><font style="color: red">GUEST</font></c:if><br>

            <h1 style="color: red">Welcome to Book Store</h1>
            <form action="DispatchServlet">
                Search book : <input type="text" name="txtSearchBook" 
                                     value="${param.txtSearchBook}" />
            <input type="submit" value="Search Book" name="btAction" />
        </form><br>
        <c:set var="searchBook" value="${param.txtSearchBook}"/>
        <c:if test="${not empty searchBook}">
            <c:set var="result" value="${requestScope.RESULT_SEARCH_BOOK}"/>
            <c:if test="${not empty result}">
                <table border="1">
                    <thead>
                    <form action="DispatchServlet">
                        <tr>
                            <th>Select</th>
                            <th>Quantity</th>
                            <th>No.</th>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Status</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="dto" items="${result}" varStatus="counter">
                                <tr>
                                    <td>
                                        <c:if test="${dto.bit == true}">
                                            <input type="checkbox" name="checkBuy" value="${dto.sku}"/> 
                                            <input type="hidden" name="lastSearchBook" value="${searchBook}"
                                            </c:if>
                                    </td>
                                    <td> 
                                        <input  type="number" name="quantityOf${dto.sku}" value="1" />
                                    </td>
                                    <td>${counter.count}</td>
                                    <td>${dto.name}</td>
                                    <td>${dto.price}</td>
                                    <td>
                                        <c:if test="${dto.bit == true}">
                                            Stocking
                                        </c:if>
                                        <c:if test="${dto.bit == false}">
                                            Sold out
                                        </c:if>
                                    </td> 
                                </tr>
                            </c:forEach>
                            <tr>
                                <td colspan="4"><input  style="margin: 5px" type="submit" value="Add Items to Cart" name="btAction"/></td>
                                <td colspan="2"><input  style="margin: 5px" type="submit" value="View your cart FullHD" name="btAction" /></td>
                            </tr>
                    </form>
                </tbody>
            </table>

        </c:if>
        <c:if test="${ empty result}">
            <h2 style="color: violet">No has available Item in Store</h2>
        </c:if>
    </c:if>






    <%--  <h1>Welcome to Book Store</h1>
    <form action="DispatchServlet">
        Search book : <input type="text" name="txtSearchBook" 
                             value="<%= request.getParameter("txtSearchBook")%>" />
        <input type="submit" value="Search Book" name="btAction" />
    </form><br>
    
    <%

            String searchBooks = request.getParameter("txtSearchBook");
            if (searchBooks != null) {
                List<TblProductDTO> result
                        = (List<TblProductDTO>) request.getAttribute("RESULT_SEARCH_BOOK");
                if (result != null) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>Select</th>
                    <th>Quantity</th>
                    <th>No.</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
            <form action="DispatchServlet">
                <%
                    int count = 0;
                    String status = "sold out";
                    for (TblProductDTO dto : result) {
                        if (dto.isBit()) {
                            status = "Stocking";
                        }
                %>
                <tr>
                    <td> <input type="checkbox" name="checkBuy" 
                                value="<%= dto.getSku()%>" 
                                <% if (session != null) {
                                        CartObj cart = (CartObj) session.getAttribute("CART_OF_CUST");
                                        if (cart != null) {
                                            Map<String, Integer> items = cart.getItems();
                                            if (items != null) {
                                                for (String key : items.keySet()) {
                                                    if (key.equals(dto.getSku())) {
                                %>checked="checked"<%
                                                    }
                                                }
                                            }
                                        }
                                    }%>



                                /> 
                        <input type="hidden" name="lastSearchBook" value="<%= searchBooks%>" />
                    </td>
                    <td> <input  type="number" name="quantityNumber" value="1" /> </td> 
                    <td><%= ++count%></td>
                    <td><%= dto.getName()%></td>
                    <td><%= dto.getPrice()%></td>
                    <td><%= status%></td>
                </tr>

                <%
                    }
                %>

                <tr>
                    <td colspan="4"><input  style="margin: 5px" type="submit" value="Add Items to Cart" name="btAction"/></td>
                    <td colspan="2"><input  style="margin: 5px" type="submit" value="View your cart FullHD" name="btAction" /></td>
                </tr>
            </form>
        </tbody>
    </table>
    <% if (session != null) {
            CartObj cart = (CartObj) session.getAttribute("CART_OF_CUST");
            if (cart != null) {
                Map<String, Integer> items = cart.getItems();
                if (items != null) {
                    for (String key : items.keySet()) {
    %> 
    <h5 style="color: red">Add <%= cart.getItemProperties(key).getName()%> to cart is SUCCESS</h5>
    <%
                    }
                }
            }
        } %>


    <%
    } else {
    %>
    <h2>The Item is not available in the Store</h2>
    <%
            }
        }
    %>--%>


</body>
</html>
