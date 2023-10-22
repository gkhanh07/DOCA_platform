<%-- 
    Document   : market.jsp
    Created on : Oct 4, 2023, 10:27:35 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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


        <link rel="stylesheet" href="assets/css/standar-style.css">
        <link rel="stylesheet" href="assets/css/forum-style-V3.css">
        <!-- Link JS -->


        <script>
            $(function () {
                $("#header").load("header.jsp");
            });
        </script>
        <script>
            window.addEventListener('DOMContentLoaded', (event) => {
                var successMessage = "<c:out value='${successMessage}' />";
                if (successMessage) {
                    alert(successMessage);
                }
            });
        </script>
    </head>

    <body>
        <div id="header"></div>

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
                                    <form action="PostForum" method="post" enctype="multipart/form-data">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Bài đăng của bạn</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                        aria-label="Close">&times;</button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="mb-3">
                                                    <div class="form-check form-check-inline">
                                                        <input name="category" class="form-check-input" type="checkbox" id="inlineCheckbox1"
                                                               value="5" checked>
                                                        <label class="form-check-label" for="inlineCheckbox1" >Câu chuyện</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input name="category" class="form-check-input" type="checkbox" id="inlineCheckbox2"
                                                               value="6">
                                                        <label class="form-check-label" for="inlineCheckbox2">Mẹo huấn luyệnn</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input name="category" class="form-check-input" type="checkbox" id="inlineCheckbox3"
                                                               value="7">
                                                        <label class="form-check-label" for="inlineCheckbox2">Mẹo chắm sóc</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input name="category" class="form-check-input" type="checkbox" id="inlineCheckbox4"
                                                               value="8">
                                                        <label class="form-check-label" for="inlineCheckbox2">Sự kiện</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input name="category" class="form-check-input" type="checkbox" id="inlineCheckbox5"
                                                               value="9">
                                                        <label class="form-check-label" for="inlineCheckbox2">Chó mèo thất lạc</label>
                                                    </div>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="message-text" class="col-form-label">Nội dung:
                                                    </label>
                                                    <textarea name="content" class="form-control" id="message-text" rows="7"></textarea>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="formFile" class="form-label"><i class="fa fa-picture-o"></i>
                                                        Chọn ảnh: </label>
                                                    <input class="form-control" type="file" id="formFile" name="file"  multiple>
                                                    <img id="previewImage" src="#" alt="Preview" style="max-width: 200px; max-height: 200px; display: none;">
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="submit" class="btn btn-primary">Đăng</button>
                                            </div>
                                        </div>
                                    </form>
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
                                <li class="nav-item ">
                                    <a style="height: 80%;" class="nav-link active rounded-pill mt-1" href="#story"
                                       role="tab" data-toggle="tab"><strong style="color: black;">Câu chuyện</strong></a>
                                </li>
                                <li class="nav-item">
                                    <a style="height: 80%;" class="nav-link rounded-pill mt-1" href="#training" role="tab"
                                       data-toggle="tab"><strong style="color: black;">Mẹo huấn luyện</strong></a>
                                </li>
                                <li class="nav-item">
                                    <a style="height: 80%;" class="nav-link rounded-pill mt-1" href="#Care" role="tab"
                                       data-toggle="tab"><strong style="color: black;">Mẹo chắm sóc</strong></a>
                                </li>
                                <li class="nav-item">
                                    <a style="height: 80%;" class="nav-link rounded-pill mt-1" href="#Events" role="tab"
                                       data-toggle="tab"><strong style="color: black;">Sự Kiện</strong></a>
                                </li>
                                <li class="nav-item">
                                    <a style="height: 80%;" class="nav-link rounded-pill mt-1" href="#Lost" role="tab"
                                       data-toggle="tab"><strong style="color: black;">Chó mèo thất lạc</strong></a>
                                </li>
                            </ul>
                        </nav>
                    </div>



                    <div class="row justify-content-center">
                        <div class="tab-content col-md-10">
                            <div role="tabpanel" class="tab-pane fade show active " id="story">


                                <div class="post my-4 border rounded position-relative">
                                    <div class="post-header">
                                        <div class="profile-info">
                                            <img src="assets/images/doge.jpeg" alt="Profile Image"
                                                 class="rounded-circle profile-image">
                                            <div class="profile-details">
                                                <a href="#" class="username">Khánh left-hand</a>
                                                <div class="post-time text-muted">09/23/2023</div>
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
                                        <img src="assets/images/doge.jpeg" alt="Post Image">
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
                                </div>


                            </div>

                            <div role="tabpanel" class="tab-pane fade show  " id="training">
                                <div class="post my-4 border rounded position-relative">
                                    <div class="post-header">
                                        <div class="profile-info">
                                            <img src="assets/images/doge.jpeg" alt="Profile Image"
                                                 class="rounded-circle profile-image">
                                            <div class="profile-details">
                                                <a href="#" class="username">Khánh left-hand</a>
                                                <div class="post-time text-muted">09/23/2023</div>
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
                                        <p class="post-text ">Chào mọi người! Hôm nay, tui muốn chia sẻ với các bạn một số
                                            cách để giúp chú chó của tôi ăn đúng giờ. 

                                            Đầu tiên, tui luôn lựa chọn một thời gian cố định cho bữa ăn hàng ngày. Điều này
                                            giúp tạo ra một sự dự đoán cho chó và giúp họ biết rõ khi nào là thời gian ăn.

                                            Một điều khác tui làm là chọn một nơi cố định để chó ăn. Điều này giúp họ hiểu
                                            rằng họ nên ăn tại đó và không nên lấy thức ăn đi đâu khác.

                                            Khi tui cho chó ăn, tui sử dụng một từ lệnh như "ăn" hoặc "làm việc" để báo hiệu
                                            rằng đây là thời điểm để ăn. 

                                            Tui cũng luôn nhớ rằng không nên cho chó ăn từ bàn của mình. Việc này giúp duy
                                            trì kỷ luật trong việc ăn của chó và không làm xáo trộn bữa ăn của tôi.

                                            Nếu chó không ăn hết trong khoảng thời gian cố định, tui sẽ loại bỏ thức ăn và
                                            không cho ăn thêm cho đến bữa tiếp theo. Điều này giúp khuyến khích chó ăn đúng
                                            giờ.

                                            Cuối cùng, tui luôn thưởng cho chó khi họ ăn đúng cách và hoàn thành bữa ăn. Một
                                            ít lời khen và một miếng bánh nhỏ có thể là một cách tuyệt vời để khích lệ chó.

                                            Nhớ rằng, việc huấn luyện chó đòi hỏi kiên nhẫn và tình yêu. Hãy tạo môi trường
                                            tích cực cho chó, nơi họ cảm thấy thoải mái trong quá trình ăn uống. 

                                            Chia sẻ những cách bạn huấn luyện chó ăn đúng giờ và kinh nghiệm của bạn nha! 
                                        </p>
                                        <img src="assets/images/doge.jpeg" alt="Post Image">
                                    </div>
                                    <div class="post-footer">
                                        <button class="btn btn-light btn_in_post flex-grow-1"><i
                                                class="fas fa-thumbs-up"></i>
                                            Thích</button>
                                        <button class="btn btn-light btn_in_post flex-grow-1"
                                                onclick="toggleCommentForm()"><i class="fas fa-comment"></i> Bình luận</button>
                                        <a href="#"> <button class="btn btn-light btn_in_post flex-grow-1"><i
                                                    class="fas fa-share"></i>
                                                Chia
                                                sẻ</button></a>


                                    </div>
                                    <div id="commentForm2" class="comment-form2" style="display: none;">
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
