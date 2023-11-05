<%-- 
    Document   : alluser
    Created on : Nov 1, 2023, 2:38:01 PM
    Author     : Admin
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>User List</h1>
        <table border="1">
            <tr>
                <th>User ID</th>
                <th>Username</th>
                <th>Gender</th>
                <th>Email</th>
                <th>Mobile Number</th>
                <th>Status</th>
                <th>Avatar</th>
                <th>Action</th>
            </tr>
            <c:forEach items="${userList}" var="user">
                <tr>
                    <td>${user.user_ID}</td>
                    <td>${user.userName}</td>
                    <td>${user.gender}</td>
                    <td>${user.email}</td>
                    <td>${user.mobileNum}</td>
                    <td>${user.status}</td>
                    <td>${user.avatar}</td>
                    <td>
                        <a href="DeleteUserServlet?user_id=${user.user_ID}">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
