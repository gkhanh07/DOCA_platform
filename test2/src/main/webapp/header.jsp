<%-- 
    Document   : header.jsp
    Created on : Oct 4, 2023, 10:21:56 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<header>
    <c:set var="Owner" value="${sessionScope.USER_NAME}"/>
    <form action="DispatchServlet">

        <nav class="navbar navbar-dark navbar-expand-sm fixed-top navbar-color p-0 header">
            <div class="container-fluid d-flex justify-content-center">
                <nav class="navbar navbar-light">
                    <a class="navbar-brand" href="#">
                        <img src="assets/images/logoDoca.png" class="rounded-circle" width="100px" height="100px" alt="">
                    </a>
                </nav>
                <div class="container-fluid d-flex justify-content-between navbar-contain mt-5   ">
                    <div class="dropdown ">
                        <button class="btn dropdown-toggle rounded-pill button_in_header  btn-light border-0" type="button"
                                id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-bars" aria-hidden="true"></i><span id="currentPageName"> Danh mục</span>
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" href="forumServlet">Bảng tin</a>

                             <a class="dropdown-item" href="marketServlet">Chợ</a>

                        </div>
                    </div>
                    <div class="navbar-search " style="width: 50%;">
                        <form action="">
                            <div class="input-group bg-light">
                                <input type="text" class="form-control" placeholder="Tìm kiếm" name="search">
                                <div class="input-group-btn button-search">
                                    <button class="btn btn-default " type="submit"><i class="fa fa-search"></i></button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div>
                        <a href="#" class="btn-notification btn  btn-light border-0 rounded-pill button_in_header">
                            <i class="fa fa-bell"></i>
                            <span class="badge p-0">3</span>
                        </a>
                        <a class="btn btn-light border-0 rounded-pill button_in_header" href="#" role="button"><i
                                class="fa-solid fa-message"></i></a>

                        <a class="btn  btn-light border-0 rounded-pill button_in_header" href="post-product.html"
                           role="button"><i class="fa-solid fa-pen-to-square"></i>
                            Tạo Bài Bán</a>

                        <a class="btn  btn-light border-0 rounded-pill button_in_header" href="#" role="button"
                           onclick="toggleMenuForm()"><i class="fa fa-user-circle" aria-hidden="true"></i> Ben</a>
                    </div>
                </div>
            </div>


        </nav>
        <div class="setting position-absolute shadow-lg bg-body rounded " id="settingForm" style="display: none; right: 3%;">
            <div class="card">
                <div class="card-body">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item"> <a href="" style="color: black;">quản lý tài khoản</a></li>
                        <li class="list-group-item"><a href="" style="color: black;">quản lý tin </a></li>
                        <li class="list-group-item"><a href="personal-product.html" style="color: black;">quản lý sản phẩm</a>
                        </li>
                        <li class="list-group-item"><a href="ListProductSaved" style="color: black;">tin đã lưu</a></li>
                        <li class="list-group-item"> <a href="" style="color: black;">logout</a></li>
                    </ul>

                </div>
            </div>
        </div>
    </form>

</header>

<script>
    function toggleMenuForm() {
        const commentForm = document.getElementById('settingForm');
        commentForm.style.display = commentForm.style.display === 'none' ? 'block' : 'none';
    }
</script>
<script>
    // Lấy URL hiện tại
    var currentURL = window.location.href;

    // Lấy phần tử có id là "currentPageName"
    var currentPageName = document.getElementById("currentPageName");

    // Kiểm tra URL và đặt nội dung cho phần tử <span>
    if (currentURL.includes("forum.jsp")) {
        currentPageName.textContent = "Bảng tin";
    } else if (currentURL.includes("market.jsp")) {
        currentPageName.textContent = "Chợ";
    }
</script>