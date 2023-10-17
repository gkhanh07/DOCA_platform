<%-- 
    Document   : insertAccount
    Created on : Jun 27, 2023, 2:31:19 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>        
<!DOCTYPE html>
<html>
    <head>
        <title>Create</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1 style="color: red"> CREATE NEW ACCOUNT </h1>
        <form action="DispatchServlet" method="post">
            Username: <input type="text" name="txtUserName" value="" />(6-20 characters)<br>
            <font style="color: red">
            <c:set var="errors" value="${requestScope.CREATE_ERROR}" />
            <c:if test="${not empty errors}" >
                <c:if test="${errors.usernameLengthErr != null}">
                    ${errors.usernameLengthErr} <br>
                </c:if>
            </c:if>
            </font>
            Password: <input type="password" name="txtPassword" value="" />(8-30 characters)<br>
            <font style="color: red">
            <c:if test="${errors.passwordLengthErr != null}">
                ${errors.passwordLengthErr} <br>
            </c:if>
            </font>
            Comfirm: <input type="password" name="txtComfirm" value=""/><br>
            <font style="color: red">
            <c:if test="${errors.comfirmMatched != null}">
                ${errors.comfirmMatched} <br>
            </c:if>
            </font>
            Full Name: <input type="text" name="txtFullName" value="" />(2-50 characters)<br>
            <font style="color: red">
            <c:if test="${errors.fullnameLengthErr != null}">
                ${errors.fullnameLengthErr} <br>
            </c:if>
            </font>
            <input type="submit" value="Create New Account" name="btAction" />
            <input type="reset" value="Reset"  />
        </form><br>
        <font style="color: red">
        <c:if test="${errors.usernameIsExisted != null}">
            ${errors.usernameIsExisted} 
        </c:if>
        </font>
    </body>
</html>
