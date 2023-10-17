<%-- 
    Document   : admidShowProductV2
    Created on : Oct 16, 2023, 9:44:31 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

    </head>
    <body>
        <div class="container">
            <h1>Admin Page</h1>

            <ul class="nav nav-tabs mb-4">
                <li class="nav-item">
                    <a class="nav-link active" data-bs-toggle="tab" href="#forum">Forum</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-bs-toggle="tab" href="#product">Product</a>
                </li>
            </ul>

            <div class="tab-content">
                <div class="tab-pane fade show active" id="forum">
                    <div class="list-group">
                        <div class="list-group-item list-group-item-action">
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

                                </div>
                                <div class="post-body">
                                    <p class="post-text">Hehe hôm nay tui đi nghỉ mát.</p>
                                    <img src="assets/images/doge.jpeg" alt="Post Image">
                                </div>
                                <div class="post-footer">
                                    <button class="btn btn-success">Accept</button>
                                    <button class="btn btn-danger">Reject</button>
                                </div>

                            </div>
                        </div>
                        <div class="list-group-item list-group-item-action">
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

                                </div>
                                <div class="post-body">
                                    <p class="post-text">Hehe hôm nay tui đi nghỉ mát.</p>
                                    <img src="assets/images/doge.jpeg" alt="Post Image">
                                </div>
                                <div class="post-footer">
                                    <button class="btn btn-success">Accept</button>
                                    <button class="btn btn-danger">Reject</button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="tab-pane fade" id="product">
                    <div class="list-group">
                        <div class="list-group-item list-group-item-action">
                            <div class="post my-4 border rounded position-relative">
                                <div class="post-header">
                                    <div class="profile-info">
                                        <img src="assets/images/doge.jpeg" alt="Profile Image"
                                             class="rounded-circle profile-image">
                                        <div class="profile-details">
                                            <a href="#" class="username">User Name</a>
                                            <div class="post-time text-muted">10/16/2023</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="post-body">
                                    <a href="product-detail.html" class="sell d-flex" style="width: 30%;">

                                        <img class="image" src="assets/images/download (1).jpg" alt="Hình ảnh">
                                        <div class="font">
                                            <h5><strong>Chuồng chó</strong></h5>
                                            <h6 style="color:rgb(242, 106, 106);">2.500.000 đ</h6>
                                            <h6 style="font-size: 15px; opacity: 0.5;">TP.HCM</h6>
                                        </div>

                                    </a>
                                </div>
                                <div class="post-footer">
                                    <button class="btn btn-success">Accept</button>
                                    <button class="btn btn-danger">Reject</button>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
    </body>
</html>
