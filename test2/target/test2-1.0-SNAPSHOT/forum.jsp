<%-- 
    Document   : forum
    Created on : Oct 4, 2023, 10:16:52 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
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
        <link rel="stylesheet" href="assets/css/standar-style.css">
        <link rel="stylesheet" href="assets/css/forum-style-V3.css">

    </head>

    <body>
        <c:set var="Posts" value="${requestScope.listInPage}"/>
        <c:set var="listCategory" value="${requestScope.listCategory}"/>

        <jsp:include page="header.jsp" />

        <div class="main-content">
            <div class="row row-content justify-content-center">

                <div class="col-sm-8 ">
                    <div class="card create-post-card">
                        <div class="card-body d-flex align-items-center">
                            <div class="profile-image-container">
                                <img src="assets/images/spa.jpg" alt="Profile Image" class="rounded-circle profile-image">
                            </div>
                            <button type="button" class="btn btn-light btn-createpost btn-block p-0 ml-2 rounded-pill "
                                    data-bs-toggle="modal" data-bs-target="#exampleModal">
                                <div class="d-flex justify-content-start">
                                    <i class="fa fa-edit ml-3 mt-1"></i>
                                    Cùng chia sẽ nội dung về chó mèo
                                </div>

                            </button>
                            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                                 aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Your Post</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close">&times;</button>
                                        </div>
                                        <div class="modal-body">
                                            <form>
                                                <div class="mb-3">
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="checkbox" id="inlineCheckbox1"
                                                               value="option1">
                                                        <label class="form-check-label" for="inlineCheckbox1">Story</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="checkbox" id="inlineCheckbox2"
                                                               value="option2">
                                                        <label class="form-check-label" for="inlineCheckbox2">Training
                                                            Tips</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="checkbox" id="inlineCheckbox2"
                                                               value="option3">
                                                        <label class="form-check-label" for="inlineCheckbox2">Care
                                                            Tips</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="checkbox" id="inlineCheckbox2"
                                                               value="option4">
                                                        <label class="form-check-label" for="inlineCheckbox2">Events</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="checkbox" id="inlineCheckbox2"
                                                               value="option5">
                                                        <label class="form-check-label" for="inlineCheckbox2">Lost</label>
                                                    </div>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="message-text" class="col-form-label">Content:
                                                    </label>
                                                    <textarea class="form-control" id="message-text" rows="7"></textarea>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="formFile" class="form-label"><i class="fa fa-picture-o"></i>
                                                        Choose images: </label>
                                                    <input class="form-control" type="file" id="formFile">
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary"
                                                    data-bs-dismiss="modal">Close</button>
                                            <button type="button" class="btn btn-primary">Post</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>


                    <div class="container rounded-pill p-0" style="background-color: #CAD2C5;">
                        <nav class="navbar navbar-dark navbar-expand-xxl ">

                            <button class="navbar-toggler" type="button" data-toggle="collapse"
                                    data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent"
                                    aria-expanded="false" aria-label="Toggle navigation">
                                <i class="fa-sharp fa-solid fa-bars" style="color: #000000;"></i>
                            </button>

                            <ul class="collapse nav nav-tabs navbar-light justify-content-center border-0"
                                id="navbarToggleExternalContent">
                                <c:forEach items="${listCategory}" var="category">
                                    <c:set var="selectedCategoryID" value="${category.categoryID}" />
                                    <li class="nav-item rounded-pill ">
                                        <a style="height: 80%;" class="nav-link rounded-pill mt-1 ${indexcategoryID==category.categoryID ? "active" : " "}"
                                           href="forumServlet?categoryID=${selectedCategoryID}" >
                                            <strong style="color: black;">${category.categoryName}</strong></a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </nav>
                    </div>



                    <div class="row justify-content-center">
                        <div class="tab-content col-md-10">
                            <c:forEach items="${Posts}" var="post">
                                <div role="tabpanel" class="tab-pane fade show active " id="${indexcategoryID}">
                                    <div class="post my-4 border rounded position-relative">
                                        <div class="post-header">
                                            <div class="profile-info">
                                                <c:forEach items="${ListOfUser}" var="user">
                                                    <c:if test="${user.user_ID==post.userId}">
                                                        <c:set var="userName" value="${user.userName}"/>
                                                        <c:set var="userAvatar" value="${user.avatar}"/>
                                                    </c:if>
                                                </c:forEach>
                                                <img src="${userAvatar}"
                                                     alt="Profile Image"
                                                     class="rounded-circle profile-image">
                                                <div class="profile-details">

                                                    <a href="#" class="username">${userName}</a>
                                                    <div class="post-time text-muted">${post.timePosted}</div>
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
                                            <p class="post-text" data-toggle="modal" data-target="#myModal">${post.postContent}</p>
                                            <img class="img-content"data-toggle="modal" data-target="#myModal" src="${post.postImage}" alt="Post Image">
                                        </div>
                                        <div class="post-footer">
                                            <button class="btn btn-light flex-grow-1 btn_in_post"><i
                                                    class="fas fa-thumbs-up"></i>
                                                Thích</button>
                                            <button class="btn  flex-grow-1 btn-light btn_in_post"
                                                    onclick="toggleCommentForm()"><i class="fas fa-comment"></i> Bình luận</button>
                                            <a href="#"> <button class="btn btn-light flex-grow-1 btn_in_post"><i
                                                        class="fas fa-share"></i>
                                                    Chia
                                                    sẻ</button></a>


                                        </div>
                                        <div id="commentForm" class="comment-form2" style="display: none;">
                                            <textarea class="form-control" placeholder="Write a comment..."></textarea>
                                            <button class="btn btn-primary mt-2" onclick="submitComment()"><i
                                                    class="fa-solid fa-circle-up fa-rotate-90"></i></button>

                                        </div>
                                        <div class="comment mt-5">
                                            <img src="https://bedental.vn/wp-content/uploads/2022/11/1e8063154fdf3dcbb07edf0ad2df326a.jpg" alt="Avatar" class="profile-image">
                                            <div class="comment-details">
                                                <p class="comment-username">John Doe</p>
                                                <p class="comment-content">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
                                            </div>
                                        </div>
                                        <div class="comment mt-5">
                                            <img src="https://bedental.vn/wp-content/uploads/2022/11/1e8063154fdf3dcbb07edf0ad2df326a.jpg" alt="Avatar" class="profile-image">
                                            <div class="comment-details">
                                                <p class="comment-username">John Doe</p>
                                                <p class="comment-content">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>


                        </div>



                    </div>

                    <!--modal-->
                    <div class="modal fade" id="myModal" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">                               
                                <div class="modal-body">
                                    <div class="tab-content col-md-10">
                                        <c:forEach items="${Posts}" var="post">
                                            <div role="tabpanel" class="tab-pane fade show active " id="${indexcategoryID}">
                                                <div class="post my-4 border rounded position-relative">
                                                    <div class="post-header">
                                                        <div class="profile-info">
                                                            <c:forEach items="${ListOfUser}" var="user">
                                                                <c:if test="${user.user_ID==post.userId}">
                                                                    <c:set var="userName" value="${user.userName}"/>
                                                                    <c:set var="userAvatar" value="${user.avatar}"/>
                                                                </c:if>
                                                            </c:forEach>
                                                            <img src="${userAvatar}"
                                                                 alt="Profile Image"
                                                                 class="rounded-circle profile-image">
                                                            <div class="profile-details">

                                                                <a href="#" class="username">${userName}</a>
                                                                <div class="post-time text-muted">${post.timePosted}</div>
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
                                                        <img class="img-content" src="${post.postImage}" alt="Post Image">
                                                    </div>
                                                    <div class="post-footer">
                                                        <button class="btn btn-light flex-grow-1 btn_in_post"><i
                                                                class="fas fa-thumbs-up"></i>
                                                            Thích</button>
                                                        <button class="btn  flex-grow-1 btn-light btn_in_post"
                                                                onclick="toggleCommentForm()"><i class="fas fa-comment"></i> Bình luận</button>
                                                        <a href="#"> <button class="btn btn-light flex-grow-1 btn_in_post"><i
                                                                    class="fas fa-share"></i>
                                                                Chia
                                                                sẻ</button></a>


                                                    </div>
                                                    <div id="commentForm" class="comment-form2" style="display: none;">
                                                        <textarea class="form-control" placeholder="Write a comment..."></textarea>
                                                        <button class="btn btn-primary mt-2" onclick="submitComment()"><i
                                                                class="fa-solid fa-circle-up fa-rotate-90"></i></button>

                                                    </div>
                                                    <div class="comment mt-5">
                                                        <img src="https://bedental.vn/wp-content/uploads/2022/11/1e8063154fdf3dcbb07edf0ad2df326a.jpg" alt="Avatar" class="profile-image">
                                                        <div class="comment-details">
                                                            <p class="comment-username">John Doe</p>
                                                            <p class="comment-content">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
                                                        </div>
                                                    </div>
                                                    <div class="comment mt-5">
                                                        <img src="https://bedental.vn/wp-content/uploads/2022/11/1e8063154fdf3dcbb07edf0ad2df326a.jpg" alt="Avatar" class="profile-image">
                                                        <div class="comment-details">
                                                            <p class="comment-username">John Doe</p>
                                                            <p class="comment-content">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>


                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>

                    <nav aria-label="Page navigation ">
                        <c:set var="numberPage" value="${requestScope.numberPage}"/>
                        <ul class="pagination justify-content-center">
                            <c:forEach begin="1" end="${numberPage}" var="i">
                                <li class="page-item rounded-pill ${indexPage==i?"active":""}" >
                                    <a class="page-link rounded-pill" href="forumServlet?index=${i}&categoryID=${indexcategoryID}">${i}</a>
                                </li>
                            </c:forEach> 


                        </ul>
                    </nav>


                </div>


            </div>
        </div>










        <script>
            function toggleCommentForm() {
                const commentForm = document.getElementById('commentForm');
                commentForm.style.display = commentForm.style.display === 'none' ? 'block' : 'none';
            }
            function submitComment() {
                const commentText = document.querySelector('#commentForm textarea').value;
                // Do something with the comment, e.g., send it to the server
                console.log('Comment submitted:', commentText);
            }
        </script>

        <script>
            function toggleOptions(button) {
                const options = button.nextElementSibling;
                options.style.display = options.style.display === 'none' ? 'block' : 'none';
            }
        </script>


    </body>
</html>
