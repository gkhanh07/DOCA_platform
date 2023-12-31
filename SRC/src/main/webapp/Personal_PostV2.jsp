
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


        <title>DOCA</title>
        <!-- Link Iconn  -->
        <link rel="stylesheet" href="fontawesome-free-6.4.2-web/css/fontawesome.css"> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

        <!-- jQuery first, then Popper.js, then Bootstrap JS. -->

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>

        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>


        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> 

        <!--  -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Link CSS -->
        <!-- <link rel="stylesheet" href="assets/css/personal-post-style.css"> -->
        <link rel="stylesheet" href="assets/css/standar-style.css">


    </head>
    <style>
        .display {
            transition: transform 0.3s, filter 0.3s;
            margin-left:10px;
            margin-right:10px;
        }

        .display:hover {
            transform: scale(1.05); /* Hiệu ứng nổi lên khi di chuột vào */
            filter: brightness(90%); /* Màu tối đi khi di chuột vào */
        }
        .denied {
            transition: transform 0.3s, filter 0.3s;
            margin-left:10px;
            margin-right:10px;
        }

        .denied:hover {
            transform: scale(1.05); /* Hiệu ứng nổi lên khi di chuột vào */
            filter: brightness(90%); /* Màu tối đi khi di chuột vào */
        }
        .waiting {
            transition: transform 0.3s, filter 0.3s;
            margin-left:10px;
            margin-right:10px;
        }

        .waiting:hover {
            transform: scale(1.05); /* Hiệu ứng nổi lên khi di chuột vào */
            filter: brightness(90%); /* Màu tối đi khi di chuột vào */
        }
        .action {
            transition: transform 0.3s, filter 0.3s;
        }

        .action:hover {
            transform: scale(1.05); /* Hiệu ứng nổi lên khi di chuột vào */
            filter: brightness(90%); /* Màu tối đi khi di chuột vào */
        }
    </style>
    <body>
        <jsp:include page="header.jsp" />
        <c:set var="listPostOfPersonal" value="${requestScope.listPostOfPersonal}"/>
        <!-- Modal -->

        <div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-labelledby="successModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="successModalLabel">Thành công!</h5>
                        <button type="submit" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p id="messageDel"></p>
                        <p id="messageUpdate"></p>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-secondary"
                                data-dismiss="modal">Đóng</button>
                    </div>
                </div>
            </div>
        </div>


        <div class="main-content">
            <div class="row row-content justify-content-center">
                <div class="col-sm-8 ">

                    <!-- viết code vào đây -->
                    <div class="container mt-5 justify-content-center">
                        <h1>Quản lý bài viết của bạn</h1>
                        <div class="row-content">
                            <nav class="navbar navbar-light navbar-expand-lg container-fluid rounded-pill"
                                 style="background-color: #CAD2C5;"
                                 >

                                <div class="container justify-content-center">

                                    <ul class="nav nav-tabs border-0">
                                        <li class="nav-item rounded-pill display">
                                            <a class="nav-link active rounded-pill mt-1" href="#display" role="tab"
                                               data-toggle="tab"><strong style="color: black;">Đang hiển thị</strong></a>
                                        </li>
                                        <li class="nav-item rounded-pill denied">
                                            <a class="nav-link rounded-pill mt-1" href="#denied" role="tab"
                                               data-toggle="tab"><strong style="color: black;">Bị từ
                                                    chối</strong></a>
                                        </li>
                                        <li class="nav-item rounded-pill waiting">
                                            <a class="nav-link rounded-pill mt-1" href="#waiting" role="tab"
                                               data-toggle="tab"><strong style="color: black;">Chờ
                                                    duyệt</strong></a>
                                        </li>
                                    </ul>
                                </div>
                            </nav>

                        </div>
                        <!-- content -->
                        <div class="tab-content">

                            <div role="tabpanel" class="tab-pane fade show active" id="display"> 
                                <c:set var="countDisplay" value="0" />
                                <c:forEach items="${listPostOfPersonal}" var="post">
                                    <c:if test="${post.status eq 'approved'}">
                                        <c:set var="countDisplay" value="${count + 1}" />
                                        <div class="font">
                                            <p>${post.postContent}</p>
                                        </div>
                                        <img class="col-sm-6 image-content img-fluid"
                                             src="${post.postImage}" alt="Hình ảnh">                                       
                                        <p>
                                            Bài viết đang ở chế độ:
                                            <span class="${post.isPublic() ? 'text-success' : 'text-danger'}">
                                                ${post.isPublic() ? 'Công khai' : 'Ẩn'}
                                            </span>
                                        </p>
                                        <button class="action btn btn-primary" onclick="openEditForm(${post.postId})">Sửa bài viết</button>
                                        <!--                                        <form action="DeletePostByUserServlet">
                                                                                    <input type="hidden" name="postId" value="${post.postId}" />
                                                                                    <input type="submit" value="xoá bài viết">
                                                                                </form>-->
                                        <a class="action btn btn-secondary" href="SetIsPublicPost?postId=${post.postId}&isPublic=${post.isPublic()}">
                                            <c:choose>
                                                <c:when test="${post.isPublic()}">
                                                    Ẩn bài viết <i class="fa fa-eye-slash"></i>
                                                </c:when>
                                                <c:otherwise>
                                                    Hiện bài viết <i class="fa fa-eye"></i>
                                                </c:otherwise>
                                            </c:choose>
                                        </a>
                                        <!-- Popup Form -->
                                        <div class="modal fade" id="edit-form${post.postId}" tabindex="-1" aria-labelledby="exampleModalLabel"
                                             aria-hidden="true">
                                            <div class="modal-dialog ">
                                                <form  action="UpdatePostByUserServlet" onsubmit="return validateFormUpdate()" method="post" enctype="multipart/form-data" >
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">Chỉnh sửa bài viết</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                                    aria-label="Close">&times;</button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="mb-3">
                                                                <div class="form-check form-check-inline">
                                                                    <input name="categoryInUpdate" class="form-check-input" type="checkbox" id="inlineCheckbox1"
                                                                           value="5" <c:forEach var="categorys" items="${post.categoryId}">
                                                                               <c:if test="${categorys == 5}">checked</c:if>
                                                                           </c:forEach>
                                                                           >
                                                                    <label class="form-check-label" for="inlineCheckbox1">Câu chuyện</label>
                                                                </div>
                                                                <div class="form-check form-check-inline">
                                                                    <input name="categoryInUpdate" class="form-check-input" type="checkbox" id="inlineCheckbox2" 
                                                                           value="6" <c:forEach var="categorys" items="${post.categoryId}">
                                                                               <c:if test="${categorys == 6}">checked</c:if>
                                                                           </c:forEach>
                                                                           >
                                                                    <label class="form-check-label" for="inlineCheckbox2">Mẹo huấn luyện</label>
                                                                </div>
                                                                <div class="form-check form-check-inline">
                                                                    <input name="categoryInUpdate" class="form-check-input" type="checkbox" id="inlineCheckbox3"
                                                                           value="7" <c:forEach var="categorys" items="${post.categoryId}">
                                                                               <c:if test="${categorys == 7}">checked</c:if>
                                                                           </c:forEach>
                                                                           >
                                                                    <label class="form-check-label" for="inlineCheckbox3">Mẹo chăm sóc</label>
                                                                </div>
                                                                <div class="form-check form-check-inline">
                                                                    <input name="categoryInUpdate" class="form-check-input" type="checkbox" id="inlineCheckbox4"
                                                                           value="8" <c:forEach var="categorys" items="${post.categoryId}">
                                                                               <c:if test="${categorys == 8}">checked</c:if>
                                                                           </c:forEach>
                                                                           >
                                                                    <label class="form-check-label" for="inlineCheckbox4">Sự kiện</label>
                                                                </div>
                                                                <div class="form-check form-check-inline">
                                                                    <input name="categoryInUpdate" class="form-check-input" type="checkbox" id="inlineCheckbox5"
                                                                           value="9" <c:forEach var="categorys" items="${post.categoryId}">
                                                                               <c:if test="${categorys == 9}">checked</c:if>
                                                                           </c:forEach>
                                                                           >
                                                                    <label class="form-check-label" for="inlineCheckbox5">Chó mèo thất lạc</label>
                                                                </div>
                                                                <p id="error-message" style="color: red; display: none;">Vui lòng chọn ít nhất một checkbox.</p>
                                                            </div><!-- comment -->


                                                            <div class="mb-3">
                                                                <label for="message-text" class="col-form-label">Nội dung:</label>
                                                                <textarea name="content" class="form-control" id="message-text" rows="7">${post.postContent}</textarea>
                                                            </div>
                                                            <img class="col-sm-6 image-content mt-5 img-fluid"
                                                                 src="${post.postImage}" alt="Hình ảnh">
                                                            <div class="mb-3">
                                                                <label for="formFile" class="form-label"><i class="fa fa-picture-o"></i>
                                                                    Chọn ảnh mới: </label>
                                                                <input class="form-control" type="file" id="formFile" name="file"  multiple>
                                                                <input type="hidden" name="OldImg" value="${post.postImage}" />
                                                                <img id="previewImage" src="#" alt="Preview" style="max-width: 200px; max-height: 200px; display: none;">
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer container">
                                                            <input type="hidden" name="postId" value="${post.postId}" />
                                                            <div class="row">
                                                                <p class="col-sm-10 m-0 text-warning">Xác nhận cập nhật sẽ đưa bài viết của bạn về trạng thái chờ duyệt hãy chắc rằng những thay đổi của bạn là hợp lý</p>
                                                                <button type="submit" class="action btn btn-primary col-sm-2 p-0" >Cập nhật</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>  
                                            </div>
                                        </div>

                                        <hr>
                                    </c:if>
                                </c:forEach>
                                <c:if test="${countDisplay eq 0}">
                                    <p>${Message}</p>
                                </c:if>
                            </div>

                            <div role="tabpanel" class="tab-pane fade" id="denied">
                                <c:set var="countDenied" value="0" />
                                <c:forEach items="${listPostOfPersonal}" var="post">
                                    <c:if test="${post.status eq 'rejected'}">
                                        <c:set var="countDenied" value="${count + 1}" />
                                        <div class="font">
                                            <p>${post.postContent}</p>
                                        </div>
                                        <img class="col-sm-6 image-content img-fluid"
                                             src="${post.postImage}" alt="Hình ảnh">

                                        <p>Lí do từ chối: ${post.reason}</p>
                                        <button class="action btn btn-primary" onclick="openEditForm(${post.postId})">Sửa bài viết</button>
                                        <!-- Popup Form -->
                                        <div class="modal fade" id="edit-form${post.postId}" tabindex="-1" aria-labelledby="exampleModalLabel"
                                             aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                                                <form  action="UpdatePostByUserServlet" onsubmit="return validateFormUpdate()" method="post" enctype="multipart/form-data" >
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">Chỉnh sửa bài viết</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                                    aria-label="Close">&times;</button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="mb-3">
                                                                <div class="form-check form-check-inline">
                                                                    <input name="categoryInUpdate" class="form-check-input" type="checkbox" id="inlineCheckbox1"
                                                                           value="5" <c:forEach var="categorys" items="${post.categoryId}">
                                                                               <c:if test="${categorys == 5}">checked</c:if>
                                                                           </c:forEach>
                                                                           >
                                                                    <label class="form-check-label" for="inlineCheckbox1">Câu chuyện</label>
                                                                </div>
                                                                <div class="form-check form-check-inline">
                                                                    <input name="categoryInUpdate" class="form-check-input" type="checkbox" id="inlineCheckbox2" 
                                                                           value="6" <c:forEach var="categorys" items="${post.categoryId}">
                                                                               <c:if test="${categorys == 6}">checked</c:if>
                                                                           </c:forEach>
                                                                           >
                                                                    <label class="form-check-label" for="inlineCheckbox2">Mẹo huấn luyện</label>
                                                                </div>
                                                                <div class="form-check form-check-inline">
                                                                    <input name="categoryInUpdate" class="form-check-input" type="checkbox" id="inlineCheckbox3"
                                                                           value="7" <c:forEach var="categorys" items="${post.categoryId}">
                                                                               <c:if test="${categorys == 7}">checked</c:if>
                                                                           </c:forEach>
                                                                           >
                                                                    <label class="form-check-label" for="inlineCheckbox3">Mẹo chăm sóc</label>
                                                                </div>
                                                                <div class="form-check form-check-inline">
                                                                    <input name="categoryInUpdate" class="form-check-input" type="checkbox" id="inlineCheckbox4"
                                                                           value="8" <c:forEach var="categorys" items="${post.categoryId}">
                                                                               <c:if test="${categorys == 8}">checked</c:if>
                                                                           </c:forEach>
                                                                           >
                                                                    <label class="form-check-label" for="inlineCheckbox4">Sự kiện</label>
                                                                </div>
                                                                <div class="form-check form-check-inline">
                                                                    <input name="categoryInUpdate" class="form-check-input" type="checkbox" id="inlineCheckbox5"
                                                                           value="9" <c:forEach var="categorys" items="${post.categoryId}">
                                                                               <c:if test="${categorys == 9}">checked</c:if>
                                                                           </c:forEach>
                                                                           >
                                                                    <label class="form-check-label" for="inlineCheckbox5">Chó mèo thất lạc</label>
                                                                </div>
                                                                <p id="error-message" style="color: red; display: none;">Vui lòng chọn ít nhất một checkbox.</p>
                                                            </div><!-- comment -->


                                                            <div class="mb-3">
                                                                <label for="message-text" class="col-form-label">Nội dung:</label>
                                                                <textarea name="content" class="form-control" id="message-text" rows="7">${post.postContent}</textarea>
                                                            </div>
                                                            <img class="col-sm-6 image-content mt-5 img-fluid"
                                                                 src="${post.postImage}" alt="Hình ảnh">
                                                            <div class="mb-3">
                                                                <label for="formFile" class="form-label"><i class="fa fa-picture-o"></i>
                                                                    Chọn ảnh mới: </label>
                                                                <input class="form-control" type="file" id="formFile" name="file"  multiple>
                                                                <input type="hidden" name="OldImg" value="${post.postImage}" />
                                                                <img id="previewImage" src="#" alt="Preview" style="max-width: 200px; max-height: 200px; display: none;">
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer container">
                                                            <input type="hidden" name="postId" value="${post.postId}" />
                                                            <div class="row">
                                                                <p class="col-sm-10 m-0 text-warning">Xác nhận cập nhật sẽ đưa bài viết của bạn về trạng thái chờ duyệt hãy chắc rằng những thay đổi của bạn là hợp lý</p>
                                                                <button type="submit" class="action btn btn-primary col-sm-2 p-0" >Cập nhật</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>  
                                            </div>
                                        </div>


                                        <hr>
                                    </c:if>
                                </c:forEach>
                                <c:if test="${countDenied eq 0}">
                                    <p>${Message}</p>
                                </c:if>
                            </div>
                            <div role="tabpanel" class="tab-pane fade " id="waiting">
                                <c:set var="countWaiting" value="0" />
                                <c:forEach items="${listPostOfPersonal}" var="post">
                                    <c:if test="${post.status eq 'pending'}">
                                        <c:set var="countWaiting" value="${count + 1}" />
                                        <c:set var="countDisplay" value="${count + 1}" />
                                        <div class="font">
                                            <p>${post.postContent}</p>
                                        </div>
                                        <img class="col-sm-6 image-content img-fluid"
                                             src="${post.postImage}" alt="Hình ảnh">
                                        <p>Trạng thái bài đăng: Chờ duyệt</p>
                                        <button class="action btn btn-primary" onclick="openEditForm(${post.postId})">Sửa bài viết</button>
                                        <!-- Popup Form -->
                                        <div class="modal fade" id="edit-form${post.postId}" tabindex="-1" aria-labelledby="exampleModalLabel"
                                             aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                                                <form  action="UpdatePostByUserServlet" onsubmit="return validateFormUpdate()" method="post" enctype="multipart/form-data" >
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">Chỉnh sửa bài viết</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                                    aria-label="Close">&times;</button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="mb-3">
                                                                <div class="form-check form-check-inline">
                                                                    <input name="categoryInUpdate" class="form-check-input" type="checkbox" id="inlineCheckbox1"
                                                                           value="5" <c:forEach var="categorys" items="${post.categoryId}">
                                                                               <c:if test="${categorys == 5}">checked</c:if>
                                                                           </c:forEach>
                                                                           >
                                                                    <label class="form-check-label" for="inlineCheckbox1">Câu chuyện</label>
                                                                </div>
                                                                <div class="form-check form-check-inline">
                                                                    <input name="categoryInUpdate" class="form-check-input" type="checkbox" id="inlineCheckbox2" 
                                                                           value="6" <c:forEach var="categorys" items="${post.categoryId}">
                                                                               <c:if test="${categorys == 6}">checked</c:if>
                                                                           </c:forEach>
                                                                           >
                                                                    <label class="form-check-label" for="inlineCheckbox2">Mẹo huấn luyện</label>
                                                                </div>
                                                                <div class="form-check form-check-inline">
                                                                    <input name="categoryInUpdate" class="form-check-input" type="checkbox" id="inlineCheckbox3"
                                                                           value="7" <c:forEach var="categorys" items="${post.categoryId}">
                                                                               <c:if test="${categorys == 7}">checked</c:if>
                                                                           </c:forEach>
                                                                           >
                                                                    <label class="form-check-label" for="inlineCheckbox3">Mẹo chăm sóc</label>
                                                                </div>
                                                                <div class="form-check form-check-inline">
                                                                    <input name="categoryInUpdate" class="form-check-input" type="checkbox" id="inlineCheckbox4"
                                                                           value="8" <c:forEach var="categorys" items="${post.categoryId}">
                                                                               <c:if test="${categorys == 8}">checked</c:if>
                                                                           </c:forEach>
                                                                           >
                                                                    <label class="form-check-label" for="inlineCheckbox4">Sự kiện</label>
                                                                </div>
                                                                <div class="form-check form-check-inline">
                                                                    <input name="categoryInUpdate" class="form-check-input" type="checkbox" id="inlineCheckbox5"
                                                                           value="9" <c:forEach var="categorys" items="${post.categoryId}">
                                                                               <c:if test="${categorys == 9}">checked</c:if>
                                                                           </c:forEach>
                                                                           >
                                                                    <label class="form-check-label" for="inlineCheckbox5">Chó mèo thất lạc</label>
                                                                </div>
                                                                <p id="error-message" style="color: red; display: none;">Vui lòng chọn ít nhất một checkbox.</p>
                                                            </div><!-- comment -->


                                                            <div class="mb-3">
                                                                <label for="message-text" class="col-form-label">Nội dung:</label>
                                                                <textarea name="content" class="form-control" id="message-text" rows="7">${post.postContent}</textarea>
                                                            </div>
                                                            <img class="col-sm-6 image-content mt-5 img-fluid"
                                                                 src="${post.postImage}" alt="Hình ảnh">
                                                            <div class="mb-3">
                                                                <label for="formFile" class="form-label"><i class="fa fa-picture-o"></i>
                                                                    Chọn ảnh mới: </label>
                                                                <input class="form-control" type="file" id="formFile" name="file"  multiple>
                                                                <input type="hidden" name="OldImg" value="${post.postImage}" />
                                                                <img id="previewImage" src="#" alt="Preview" style="max-width: 200px; max-height: 200px; display: none;">
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer container">
                                                            <input type="hidden" name="postId" value="${post.postId}" />
                                                            <div class="row">
                                                                <p class="col-sm-10 m-0 text-warning">Xác nhận cập nhật sẽ đưa bài viết của bạn về trạng thái chờ duyệt hãy chắc rằng những thay đổi của bạn là hợp lý</p>
                                                                <button type="submit" class="action btn btn-primary col-sm-2 p-0" >Cập nhật</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>  
                                            </div>
                                        </div>
                                        <hr>
                                    </c:if>
                                </c:forEach>
                                <c:if test="${countWaiting eq 0}">
                                    <p>${Message}</p>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>

        <script>
            function validateFormUpdate() {
                var checkboxes = document.querySelectorAll('input[name="categoryInUpdate"]');
                var checked = false;
                console.log(checked);
                for (var i = 0; i < checkboxes.length; i++) {
                    if (checkboxes[i].checked) {
                        checked = true;
                        break;
                    }
                }
                if (!checked) {
                    document.getElementById('error-message').style.display = 'block';
                }
                return checked;
            }
        </script>
        <script>
            function openEditForm(postId) {
                $('#edit-form' + postId).modal('show');
            }

            function closeEditForm(postId) {
                $('#edit-form' + postId).modal('hide');
            }

            function saveChanges() {
                var editedContent = $('#edited-content').val();
                // Thực hiện các thay đổi và lưu bài viết tại đây
                closeEditForm(); // Đóng popup sau khi hoàn thành
            }
        </script>
        <script>
            var messageDelElement = document.getElementById('messageDel');
            <% String messageDel = (String) request.getAttribute("Message_Del");
                if (messageDel != null && !messageDel.isEmpty()) { %>
            messageDelElement.innerText = "xóa thành công ";
            $(document).ready(function () {
                $('#successModal').modal('show');
            });
            <% } %>

        </script>
        <script>
            var messageUpdateElement = document.getElementById('messageUpdate');
            <% String messageUpdate = (String) request.getAttribute("successMessage");
                if (messageUpdate != null && !messageUpdate.isEmpty()) { %>
            messageUpdateElement.innerText = "sửa thành công ";
            $(document).ready(function () {
                $('#successModal').modal('show');
            });
            <% } %>
        </script>
        <script>
            document.getElementById('formFile').addEventListener('change', function (e) {
                var file = e.target.files[0];
                var reader = new FileReader();

                reader.onload = function (e) {
                    document.getElementById('previewImage').setAttribute('src', e.target.result);
                    document.getElementById('previewImage').style.display = 'block';
                };

                reader.readAsDataURL(file);
            });
        </script>

    </body>
</html>
