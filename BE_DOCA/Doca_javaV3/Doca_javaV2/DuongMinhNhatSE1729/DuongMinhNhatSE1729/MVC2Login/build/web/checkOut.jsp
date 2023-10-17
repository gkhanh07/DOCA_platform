<%-- 
    Document   : checkOut
    Created on : Jul 3, 2023, 9:02:55 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check Out</title>
    </head>
    <body>
        <h1 style="color: red ; text-align :center "> YOUR BILL:</h1>
        <c:set var="bill" value="${requestScope.Bill_Of_Cus}" ></c:set>
        <c:if test="${not empty bill}" >

            <h3 style=" text-align :center">ID of Bill: ${bill.id} </h3>
            <h3 style=" text-align :center ">Date: ${bill.date}</h3>

            <c:set var="orederDetail" value="${requestScope.List_OrderDetails_Items}"/>
            <c:if test="${not empty orederDetail}">

                <table style="margin: auto" border="1">
                    <thead>
                        <tr>
                            <th>Sku</th>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="listOrder" items="${orederDetail}" varStatus="count">
                            <tr>
                                <td>${listOrder.sku}</td>
                                <td>${listOrder.name}</td>
                                <td>${listOrder.price}</td>
                                <td>${listOrder.quantity}</td>
                                <td>${listOrder.totalItem}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>

            <h2 style=" text-align :center ;color: orange">Total: ${bill.total}</h2>

        </c:if>

        <h2 style="color: red"><a href="bookStoreHTML.html">Shopping Page</a></h2>

    </body>
</html>
