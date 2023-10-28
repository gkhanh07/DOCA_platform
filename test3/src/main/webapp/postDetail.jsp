<%-- 
    Document   : postDetail
    Created on : 18 thg 10, 2023, 18:42:35
    Author     : minhluan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags always come first -->
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



        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- <link rel="stylesheet" href="assets/css/forum-style.css"> -->

    </head>

    <style>
        .img-content{
            height: 615px;
            margin-left: 350px;
        }
    </style>
    <body>
        <c:set var="post" value="${requestScope.postDetail}" />
        <c:set var="listOfComment" value="${requestScope.listOfComment}"/>
        <c:set var="OwnerComment" value="${sessionScope.USER_NAME}"/>

        <jsp:include page="header.jsp" />

        <!--        <div class="mt-3">-->
        <div class="post position-relative mt-3">
            <div class="post-header"style="margin-top:85px">
                <div class="profile-info">

                    <img src="${owner.avatar}"
                         alt="Profile Image"
                         class="rounded-circle profile-image">
                    <div class="profile-details">

                        <a href="#" class="username">${owner.userName}</a>
                        <div class="post-time text-muted">Ngày đăng bài: ${post.timePosted}</div>
                    </div>
                </div>
                <div class="options-button" style="position: absolute; top: 10px; right: 10px;">
                    <button class="btn btn-secondary" onclick="toggleOptions(this)">
                        <i class="fa-solid fa-ellipsis"></i>
                    </button>
                    <div class="options" style="display: none;">

                        <a class="dropdown-item" href="#">Lưu bài viết</a>
                        <a class="dropdown-item" href="#">Tố cáo bài viết</a>
                    </div>
                </div>


            </div>

            <div class="post-body">
                <p class="post-text">${post.postContent}</p>
                <img class="img-content col-sm-6"" src="${post.postImage}" alt="Post Image">
            </div>
            <c:forEach items="${listOfComment}" var="comment">
                <c:if test="${comment.postId==post.postId}">
                    <div class="comment mt-5">
                        <c:forEach items="${ListOfUser}" var="user">
                            <c:if test="${user.user_ID==comment.userId}">
                                <c:set var="userName" value="${user.userName}"/>
                                <c:set var="userAvatar" value="${user.avatar}"/>
                            </c:if>
                        </c:forEach>
                        <div class="user-info-container">
                            <img src=${userAvatar} alt="Avatar" class="profile-image">
                            <p class="comment-username">${userName}</p>
                        </div>
                        <div class="comment-wrapper mt-3 d-inline-block">
                            <div class="comment-details">
                                <p class="comment-content">${comment.commentDes}</p>
                            </div>
                        </div>
                    </div>
                    <!--xoá comment-->
                    <c:if test="${OwnerComment.user_ID==comment.userId}">
                        <a class="delete-comment" href="deleteCommentServlet?commentId=${comment.commentId}&postId=${post.postId}">Xoá comment</a>
                    </c:if>
                </c:if>

            </c:forEach>
        </div>
        <!--        </div>-->
    </body>
    <link rel="stylesheet" href="assets/css/standar-style.css">
    <link rel="stylesheet" href="assets/css/forum-style-V3.css">
</html>
