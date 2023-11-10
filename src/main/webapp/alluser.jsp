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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <h1>User List</h1>
        <div class="container">
            <form action="DispatchServlet" method="POST" class="mb-3">
                <div class="input-group">
                  <input type="text" name="txtSearch" class="form-control" placeholder="Search by Username" value="${param.txtSearch}">
                    <input type="submit" class="btn btn-primary" value="Search User" name="btAction">
                </div>
            </form>
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>User ID</th>
                            <th>Username</th>
                            <th>Password</th>
                            <th>Gender</th>
                            <th>Email</th>
                            <th>Mobile Number</th>
                            <th>Status</th>

                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${userList}" var="user">
                            <tr>
                        <form action="DispatchServlet" method="Post">
                            <td><input type="hidden" name="user_id" value="${user.user_ID}">${user.user_ID}</td>
                            <td><input type="text" name="txtUsername" value="${user.userName}"></td>
                            <td><input type="text" name="txtPassword" value="${user.password}"></td>
                            <td>${user.gender}</td>
                            <td>${user.email}</td>
                            <td>${user.mobileNum}</td>
                            <td><c:choose>
                                    <c:when test="${user.status}">
                                        <span class="badge bg-success">Unbanned</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge bg-danger">Banned</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${user.status}">
                                        <a href="DeleteUserSerlvet?user_id=${user.user_ID}&action=ban" class="btn btn-danger">Ban Account</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="DeleteUserSerlvet?user_id=${user.user_ID}&action=unban" class="btn btn-success">Unban Account</a>
                                    </c:otherwise>
                                </c:choose></td>
                           
                            <td><button class="btn btn-primary" name="btAction" value="UpdateUser">Update</button></td>
                        </form>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>


    </body>
</html>
