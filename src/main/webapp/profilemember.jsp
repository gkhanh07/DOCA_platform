<%-- 
    Document   : profilemember
    Created on : Oct 15, 2023, 2:28:28 PM
    Author     : Admin
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <title>Account</title>
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

         <link rel="stylesheet" href="assets/css/forum-style.css">
        <link rel="stylesheet" href="assets/css/standar-style.css">
        <link rel="stylesheet" href="assets/css/profilePrivate.css">
        
        <!-- Link JS -->


        <!--        <script>
                    $(function () {
                        $("#header").load("header.jsp");
                    });
                </script>-->
    </head>
    <body>
       <jsp:include page="header.jsp" />
       <section style="background-color: #eee;">
        <div class="container py-5 ">
            <div class="row">
                <div class="col-lg-4">
                    <div class="card mb-4">
                        <div class="card-body text-center">
                            <img src="assets/images/doge2.webp" alt="avatar" class="rounded-circle img-fluid"
                                style="width: 150px;">
                            <h5 class="my-3">Ben mặt xệ</h5>

                        </div>
                    </div>
                    <div class="card mb-4 mb-lg-0">
                        <div class="card-body p-0">
                            <ul class="list-group list-group-flush rounded-3">
                                <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                    <i class="fa fa-calendar"></i>
                                    <p class="mb-0">Đã tham gia: 2 Tháng 11 Ngày</p>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                    <i class="fa fa-map-marker" style="color: #333333;"></i>
                                    <p class="mb-0">Địa chỉ: <i>Hồ Chí Minh, Thủ Đức</i> </p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8">

                    <div class="row m-0">
                        <ul class="nav nav-tabs" id="myTabs">
                            <li class="nav-item ">
                                <a class="nav-link text-dark active" id="product-tab" data-toggle="tab"
                                    href="#product">Bài rao bán</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-dark " id="post-tab" data-toggle="tab" href="#post">
                                    Bài đăng thông tin</a>
                            </li>
                        </ul>
                    </div>
                    <div class="tab-content" class="row">
                        <div id="product" class="tab-pane fade show active">
                            <div class="card-group justify-content-center">

                                <c:forEach items="${Products}" var="product">
                                    <div  style="position: relative; border-bottom: 1px solid rgb(224, 224, 224);">
                                        <a href="productDetailServlet?productId=${product.productId}" class="sell d-flex" style="width: 100%;">
                                            <img class="image" src="assets/images/${product.productImage}" alt="${product.title}">
                                            <div class="font">
                                                <h5><strong>${product.title}</strong></h5>
                                                <h6 style="color:rgb(242, 106, 106);">${product.price} đ</h6>
                                                <h6 style="font-size: 15px; opacity: 0.5;">${product.address}</h6>
                                            </div>
                                        </a>
                                    </div>
                                </c:forEach>

                            </div>
                        </div>
                        
                        <div id="post" class="tab-pane fade">
                            <div class="card-group justify-content-center">
                                <div class="post my-4 border rounded position-relative">
                                    <div class="post-header">
                                        <div class="profile-info">
                                            <img src="assets/images/doge2.webp" alt="Profile Image"
                                                class="rounded-circle profile-image">
                                            <div class="profile-details">
                                                <a href="#" class="username">Ben mặt xệ</a>
                                                <div class="post-time text-muted">Posted on: September 23, 2077</div>
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
                                        <p class="post-text">Hehe hôm nay tui đi nghỉ mát.</p>
                                        <img src="assets/images/doge2.webp" alt="Post Image">
                                    </div>
                                    <div class="post-footer">
                                        <button class="btn btn-primary flex-grow-1"><i class="fas fa-thumbs-up"></i>
                                            Thích</button>
                                        <button class="btn btn-primary flex-grow-1" onclick="toggleCommentForm()"><i
                                                class="fas fa-comment"></i> Bình luận</button>
                                        <a href="#"> <button class="btn btn-primary flex-grow-1"><i
                                                    class="fas fa-share"></i> Chia sẻ</button></a>


                                    </div>
                                    <div id="commentForm" class="comment-form" style="display: none;">
                                        <textarea class="form-control" placeholder="Write a comment..."></textarea>
                                        <button class="btn btn-primary mt-2" onclick="submitComment()"><i
                                                class="fa-solid fa-circle-up fa-rotate-90"></i></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </section>
    </body>
</html>
