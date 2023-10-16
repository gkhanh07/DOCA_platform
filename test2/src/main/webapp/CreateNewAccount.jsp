<%-- 
    Document   : CreateNewAccount
    Created on : 16 thg 10, 2023, 09:46:53
    Author     : minhluan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
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
        <!-- STYLE CSS -->
        <link rel="stylesheet" href="assets/css/signup-style.css">
    </head>

    <body>
<!--        style="background-image: url('images/bg-registration-form-1.jpg'); -->
        <div class="wrapper">
            <div class="inner">
                <div class="image-holder">
                    <img src="assets/images/close-up-belgian-shepherd-dog-cat_191971-18280.jpg" alt="">
                </div>
                <form action="">
                    <h3>Registration Form</h3>
                    <div class="form-group">
                        <input type="text" placeholder="First Name" class="form-control">
                        <input type="text" placeholder="Last Name" class="form-control">
                    </div>
                    <div class="form-wrapper">
                        <input type="text" placeholder="Username" class="form-control">
                        <i class="zmdi zmdi-account"></i>
                    </div>
                    <div class="form-wrapper">
                        <input type="text" placeholder="Email Address" class="form-control">
                        <i class="zmdi zmdi-email"></i>
                    </div>
                    <div class="form-wrapper">
                        <input type="number" placeholder="Phone number" class="form-control">
                        <i class="zmdi zmdi-phone"></i>
                    </div>
                    <div class="form-wrapper">
                        <select name="" id="" class="form-control">
                            <option value="" disabled selected>Gender</option>
                            <option value="male">Male</option>
                            <option value="femal">Female</option>
                            <option value="other">Other</option>
                        </select>
                        <i class="zmdi zmdi-caret-down" style="font-size: 17px"></i>
                    </div>
                    <div class="form-wrapper">
                        <input type="password" placeholder="Password" class="form-control">
                        <i class="zmdi zmdi-lock"></i>
                    </div>
                    <div class="form-wrapper">
                        <input type="password" placeholder="Confirm Password" class="form-control">
                        <i class="zmdi zmdi-lock"></i>
                    </div>
                    <button>Register
                        <i class="zmdi zmdi-arrow-right"></i>
                    </button>
                    <p class="footer">Đã có tài khoản ? <a href="login.jsp">Đăng nhập</a></p>
                </form>

            </div>
        </div>

    </body>

</html>
