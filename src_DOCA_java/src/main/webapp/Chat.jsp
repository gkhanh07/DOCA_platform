<%-- 
    Document   : market.jsp
    Created on : Oct 4, 2023, 10:27:35 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags always come first -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <!-- Bootstrap CSS -->
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> 

        <title>Forum</title>
        <!-- Link Iconn  -->
        <link rel="stylesheet" href="fontawesome-free-6.4.2-web/css/fontawesome.css"> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

        <!-- jQuery first, then Popper.js, then Bootstrap JS. -->

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>

        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>


        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


        <!--  -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Link CSS -->

        <link rel="stylesheet" href="assets/css/marketv2.css">
        <link rel="stylesheet" href="assets/css/standar-style.css">
        <link rel="stylesheet" href="assets/css/chat-style.css">
    </head>

    <body>
        <c:set var="ListOfConversation" value="${sessionScope.ListOfConversation}"/>
        <c:set var="ListOfProductInConversation" value="${sessionScope.ListOfProductInConversation}"/>
        <c:set var="ListOfMessage" value="${requestScope.ListOfMessage}"/>
        <c:set var="Owner" value="${sessionScope.USER_NAME}"/>
        <jsp:include page="header.jsp" />
        <div class="menu d-flex justify-content-center " style="margin: 90px 0 0 50px;">

            <div class="product col-sm-7 " >
                <div class="row container p-0">
                    <div class="listConversation col-sm-4 " style="background-color: #A3B18A; height: 500px; overflow: scroll;" >
                        <ul class="list-group">
                            <c:forEach items="${ListOfConversation}" var="conversation">
                                <c:forEach items="${ListOfProductInConversation}" var="Product">
                                    <c:if test="${Product.productId == conversation.product_id }">
                                        <li class="list-group-item border-0 m-1 ${stateConvers eq conversation_id?'active':''}" style="background-color: #A3B18A">
                                            <a class="text-white Conversation-name" href="getMessageInConversation?conversationID=${conversation.conversation_id}">
                                                ${Product.title}</a>
                                        </li>
                                    </c:if>
                                </c:forEach>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="listMessage col-sm-8 pr-0 " style=" height: 500px;background-color: #DAD7CD; " >
                        <!-- Message list content goes here -->
                        <c:choose>
                            <c:when test="${stateConvers eq 0}">
                                <div class="chat-message d-flex justify-content-center align-items-center" style=" height: 400px;">
                                    <p>Chat để kết nối - Cùng nhau làm nên giao dịch tốt nhất!</p>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div style="height: 440px; overflow:scroll;">
                                    <div class="row" >
                                        <c:set var="count" value="0"/>
                                        <c:forEach items="${ListOfMessage}" var="message">
                                            <c:set var="count" value="${count+1}"/>
                                            <c:choose>
                                                <c:when test="${message.user_id eq Owner.user_ID}">
                                                    <div class="col-6 offset-6 pt-2">
                                                        <div class="my-message bg-info text-white pt-2 pb-2 pl-3 pr-3">
                                                            ${message.messages_content}
                                                        </div>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="col-6 pt-2">
                                                        <div class="their-message bg-secondary text-white pt-2 pb-2 pl-3 pr-3">
                                                            ${message.messages_content}
                                                        </div>
                                                    </div>
                                                    <div class="col-6 pt-2">

                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                        <c:if test="${count==0}">
                                            <p>không có tin nhắn nào</p>
                                        </c:if>

                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-8">
                                        <input type="text" class="form-control" placeholder="Type your message">
                                    </div>
                                    <div class="col-4">
                                        <button class="btn btn-primary">Send</button>
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>

        </div>
    </body>
</html>
