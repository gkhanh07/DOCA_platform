<%--
Document : accountmanage
Created on : Oct 15, 2023, 2:13:31 PM
Author : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html> <html>
    <head> <!-- Required meta tags always come first --> 
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> 
        <meta http-equiv="x-ua-compatible" content="ie=edge"> <!-- Bootstrap CSS --> <!-- Bootstrap CSS --> 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

        <title>Account</title>
        <!-- Link Iconn  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

        <!-- jQuery first, then Popper.js, then Bootstrap JS. -->

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>

        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>


        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


        <!--  -->   
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>


        <link rel="stylesheet" href="assets/css/standar-style.css">
        <link rel="stylesheet" href="assets/css/profilePrivate.css">   
    </head>
    <body>


        <c:set var="Owner" value="${sessionScope.USER_NAME}"/>
        <jsp:include page="header.jsp" />
        <div class="main-content">
            <div class="row row-content justify-content-center">
                <div class="col-sm-8">
                    <!--Edit profile  -->
                    <div class="container px-4 mt-4 edit-profile">
                        <hr class="mt-0 mb-4">

                        <div class="row">
                            <div class="col-sm-12">
                                <!-- Account details card-->

                                <div class="card mb-4 mb-xl-0">
                                    <div class="card-header">Ảnh đại diện</div>
                                    <div class="card-body text-center">
                                        <!-- Profile picture image-->
                                        <img class="img-account-profile rounded-circle" src="${Owner.avatar}"
                                             alt="" style=" object-fit: cover;
                                             border-radius: 50%;  width: 150px;
                                             height: 150px;">
                                        <h6>${Owner.userName}</h6>
                                        <hr />
                                        <!-- Profile picture upload button-->
                                        <div class="input-group">
                                            <label class="input-group-text" for="inputGroupFile01">Tải lên</label>
                                            <input type="file" class="form-control" id="inputGroupFile01" name="avatar" >
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <div class="container justify-content-center  p-0">
                                        <nav class="navbar navbar-light navbar-expand-lg container-fluid"
                                             style="background-color: #CAD2C5;"
                                             >
                                            <ul class="nav nav-tabs border-0">
                                                <li class="nav-item rounded-pill">
                                                    <a class="nav-link active rounded-pill mt-1" href="#account-info" role="tab"
                                                       data-toggle="tab"><strong style="color: black;">Thông tin cá nhânn</strong></a>
                                                </li>
                                                <li class="nav-item rounded-pill">
                                                    <a class="nav-link rounded-pill mt-1" href="#account-settings" role="tab"
                                                       data-toggle="tab"><strong style="color: black;">Cài đặt tài khoản</strong></a>
                                                </li>
                                            </ul>
                                        </nav>
                                    </div>
                                    <div class="tab-content pb-5">

                                        <div role="tabpanel" class="tab-pane fade show active" id="account-info"> 
                                            <div class="card mb-4">
                                                <div class="card-body">
                                                    <form action="DispatchServlet" method="post"  onsubmit="return validateForm()">
                                                        <!-- Form Group (username)-->
                                                        <div class="mb-3">
                                                            <label class="small mb-1" for="inputUsername" >Usename<span
                                                                    class="red-star">*</span></label>
                                                            <input class="form-control" id="inputUsername" type="text"
                                                                   placeholder="Username" value="${Owner.userName}" name="txtUsername" >
                                                            <c:if test="${not empty requestScope.isUsernameTaken}">
                                                                <div class="text-danger">Tên người dùng đã tồn tại. Vui lòng chọn một tên khác.</div>
                                                            </c:if>

                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="small mb-1" for="inputUsername" >Email<span
                                                                    class="red-star">*</span></label>
                                                            <input class="form-control" id="inputEmail" type="email"
                                                                   placeholder="" value="${Owner.password}" name="txtEmail">
                                                        </div>
                                                        <!-- Form Group (Phone)-->
                                                        <div class="mb-3">
                                                            <label class="small mb-1" for="inputPhone">Số điện thoại <span
                                                                    class="red-star">*</span></label>
                                                            <input class="form-control" id="inputPhone" type="tel"
                                                                   placeholder="Enter your phone number" value="${Owner.mobileNum}" name="txtPhone">
                                                        </div>
                                                        <!-- Form Address -->
                                                        <div class="mb-3">
                                                            <label class="small mb-1">Giới tính</label><br>
                                                            <input type="radio" id="male" name="gender" value="male">
                                                            <label for="male">Nam</label>
                                                            <input type="radio" id="female" name="gender" value="female">
                                                            <label for="female">Nữ</label>
                                                            <input type="radio" id="other" name="gender" value="other">
                                                            <label for="other">Khác</label>
                                                        </div>
                                                        <!-- Form Row-->
                                                        <div class="row gx-3 mb-3">
                                                        </div>
                                                        <!-- Save changes button-->
                                                        <input type="submit" value="Lưu thay đổi" name="btAction" class="btn btn-block btn-primary">
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        <div role="tabpanel" class="tab-pane fade " id="account-settings"> 
                                            <div class="card mb-4">
                                                <div class="card-body">
                                                    <div class="form-change-password">
                                                        <div class="row">
                                                            <div class="col-12 col-sm-6 mb-3">
                                                                <form action="DispatchServlet" method="post"  onsubmit="return validateForm()">
                                                                    <div class="mb-2"><b>Thay đổi mật khẩu</b></div>
                                                                    <div class="row">
                                                                        <div class="col">
                                                                            <div class="form-group">
                                                                                <label class="small mb-1" for="inputCurPassword">Mật khẩu hiện tại <span
                                                                                        class="red-star">*</span></label>
                                                                                <input class="form-control" id="inputCurPassword" type="password" name="txtCurPass"
                                                                                       value="" placeholder="">
                                                                                <c:if test="${requestScope.isCurPasswordIncorrect}">
                                                                                    <div class="text-danger">Mật khẩu hiện tại không đúng. Vui lòng kiểm tra lại.</div>
                                                                                </c:if>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col">
                                                                            <div class = "form-group">
                                                                                <label class="small mb-1" for="inputPassword">Mật khẩu mới <span
                                                                                        class="red-star">*</span></label>
                                                                                <input class="form-control" id="inputPassword" type="password" name="txtPassword"
                                                                                       placeholder="">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col">
                                                                            <div class="form-group">
                                                                                <label class="small mb-1" for="inputConfirm">Xác nhận mật khẩu <span
                                                                                        class="red-star">*</span></label>
                                                                                <input class="form-control" id="inputConfirm" type="password"
                                                                                       placeholder="" name="txtConfirm">
                                                                                <c:if test="${requestScope.isPasswordMismatch}">
                                                                                    <div class="text-danger">Xác nhận mật khẩu không khớp. Vui lòng kiểm tra lại.</div>
                                                                                </c:if>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <input type="submit" value="Đổi mật khẩu" name="btAction" class="btn btn-block btn-primary">
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <script>
                                //giống fomik 
                                function validateForm() {
                                    var username = document.getElementById("inputUsername").value;
                                    var email = document.getElementById("inputEmail").value;
                                    var phone = document.getElementById("inputPhone").value;
                                    if (username === "" || email === "" || phone === "") {
                                        alert("Vui lòng điền đầy đủ thông tin vào các trường bắt buộc");
                                        return false; 
                                    }
                                    return true; 
                                }
                            </script>
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </div>
</body>


</html>