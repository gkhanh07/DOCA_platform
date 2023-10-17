<%-- 
    Document   : search
    Created on : Jun 12, 2023, 2:43:16 PM
    Author     : Admin
--%>

<%--<%@page import="java.util.List"%>--%>
<%--<%@page import="nhatdm.registration.RegistrationDTO"%>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Search</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <font color="red">
        <c:set var="userUsing" value="${sessionScope.USER}"/>
        Welcome, ${userUsing.fullname}
        </font>
        <form action="DispatchServlet">
            Search Values: <input type="text" name="txtSearchValues" value="${param.txtSearchValues}" />
            <input type="submit" value="Search" name="btAction" />
        </form><br>
        <c:set var="searchValues" value="${param.txtSearchValues}" ></c:set>
        <c:if test="${not empty searchValues}">
            <c:set var="result" value="${requestScope.SEARCH_RESULT}"></c:set>
            <c:if test="${not empty result}">
                <table border="1">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Username</th>
                            <th>Password</th>
                            <th>FullName</th>
                            <th>Role</th>
                            <th>Delete</th>
                            <th>Update</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${result}" var="dto" varStatus="counter" >
                        <form action="DispatchServlet">
                            <tr>
                                <td>${counter.count}</td>
                                <td>${dto.username}
                                    <input type="hidden" name="txtUserName" value="${dto.username}" />
                                </td>
                                <td>
                                    <input type="text" name="txtPassword" value="${dto.password}" />
                                </td>
                                <td>${dto.fullname}</td>
                                <td>
                                    <input type="checkbox" name="checkRole" value="ON" 
                                           <c:if test="${dto.role}">checked="checked"</c:if> />
                                    </td> 
                                    <td>
                                    <c:url var="deleteLink" value="DispatchServlet">
                                        <c:param name="btAction" value="delete"></c:param>
                                        <c:param name="pk" value="${dto.username}"></c:param>
                                        <c:param name="lastSearchValue" value="${searchValues}"></c:param>
                                    </c:url>
                                    <c:if test="${userUsing.username != dto.username}"><a href="${deleteLink}">Delete</a></c:if>
                                    <c:if test="${userUsing.username == dto.username}">Using</c:if>
                                </td>
                                <td>
                                    <input type="submit" name="btAction" value="Update" />
                                    <input type="hidden" name="lastSearchValues" value="${searchValues}" />
                                </td>
                            </tr>
                        </form>
                    </c:forEach>
                </tbody>
            </table>

        </c:if>
        <c:if test="${empty result}">
            <h2> No has record is matched</h2>
        </c:if>
        </c:if> <br>
            <form action="DispatchServlet">
                <input type="submit" value="Logout" name="btAction"/> 
            </form>
    <%--
    <%
    Cookie [] cookies = request.getCookies();
    if(cookies != null){
        String username="";
//            Cookie newstCookie = cookies[cookies.length-1];
//            String username = newstCookie.getName();
           for(Cookie cookie : cookies){
               String temp = cookie.getName();
               if (!temp.equals("JSESSIONID")){
               username = temp;
           }
           }
    %>
    <font style="color: orange"  >
        Welcome, <%= username %>
    </font>
    <%
    }
    
    %>
    
    <div><h1 style="color: blue">Search Page</h1></div>
    <form action="DispatchServlet">
        Search Values: <input type="text" name="txtSearchValues" value="<%= request.getParameter("txtSearchValues")%>" />
        <input type="submit" value="Search" name="btAction" />
    </form>
    <br>
     <form action="DispatchServlet">
        <input type="submit" value="Logout" name="btAction" />
    </form>
    <br>
    <%
        String searchValue = request.getParameter("txtSearchValues");

            if (searchValue != null) {
                List<RegistrationDTO> result
                        = (List<RegistrationDTO>) request.getAttribute("SEARCH_RESULT");
                if (result != null) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>UserName</th>
                    <th>Password</th>
                    <th>Fullname</th>
                    <th>Role</th>
                    <th>Delete</th>
                    <th>Update</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 0;
                    for (RegistrationDTO dto : result) {
                        String urlRewriting ="DispatchServlet"
                                +"?btAction=delete"
                                +"&pk=" + dto.getUsername()
                                +"&lastSearchValue=" + searchValue;
                %>
                
            <form action="DispatchServlet">
                <tr>
                    <td>
                        <%=++count%>
                    </td>
                    <td>
                        <%=dto.getUsername()%>
                        <input type="hidden" name="txtUserName" value="<%= dto.getUsername() %>" />
                    </td>
                    <td>
                        <input type="text" name="txtPassword" value="<%=dto.getPassword()%>" />
                        
                    </td>
                    <td>
                        <%=dto.getFullname()%>
                    </td>
                    <td>
                        <input type="checkbox" name="checkRole" value="Admin" 
                               <%
                               if(dto.isRole()){
                                   %>
                                   checked="checked"
                               <%
                               }
                               %>
                               />
                    </td>
                    <td>
                        <a href="<%=urlRewriting%>">Delete</a>
                    </td>
                    <td>
                        <input type="hidden" name="lastSearchValues" value="<%= searchValue %>" />
                        <input type="submit" value="Update" name="btAction" />
                    </td>
                </tr>
            </form>
                
                <%
                    }
                %>
            </tbody>
        </table>


        <%
        } else {
        %>
        <h2>No record is matched!!!</h2>
        <%
                }
            }

        %>--%>
</body>
</html>
