<%-- 
    Document   : accountmanage
    Created on : Oct 15, 2023, 2:13:31 PM
    Author     : Admin
--%>

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
       <div class="main-content">
        <div class="row row-content justify-content-center">
            <div class="col-sm-8">
                <!--Edit profile  -->
                <div class="container px-4 mt-4 edit-profile">
                    <hr class="mt-0 mb-4">
                    <div class="row">
                        <div class="col-sm-4">
                            <!-- Profile picture card-->
                            <div class="card mb-4 mb-xl-0">
                                <div class="card-header">Ảnh đại diện</div>
                                <div class="card-body text-center">
                                    <!-- Profile picture image-->
                                    <img class="img-account-profile rounded-circle" src="assets/images/toc-ro-beo-.jpg"
                                        alt="">
                                    <hr />
                                    <!-- Profile picture upload button-->
                                    <div class="input-group">
                                        <label class="input-group-text" for="inputGroupFile01">Tải lên</label>
                                        <input type="file" class="form-control" id="inputGroupFile01">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <!-- Account details card-->
                            <div class="card mb-4">
                                <div class="card-header">Thông tin tài khoản</div>
                                <div class="card-body">
                                    <form>
                                        <!-- Form Group (username)-->
                                        <div class="mb-3">
                                            <label class="small mb-1" for="inputUsername">Họ và Tên <span
                                                    class="red-star">*</span></label>
                                            <input class="form-control" id="inputUsername" type="text"
                                                placeholder="Họ và Tên" value="">
                                        </div>

                                        <!-- Form Group (Phone)-->
                                        <div class="mb-3">
                                            <label class="small mb-1" for="inputPhone">Số điện thoại <span
                                                    class="red-star">*</span></label>
                                            <input class="form-control" id="inputPhone" type="tel"
                                                placeholder="Enter your phone number" value="0343243454">
                                        </div>

                                        <!-- Form Address -->
                                        <div class="mb-3">
                                            <label class="small mb-1" for="inputAddress">Địa chỉ</span></label><br>
                                            <select class="form-select form-select-sm mb-3 rounded-pill" id="city"
                                                aria-label=".form-select-sm">
                                                <option value="" selected>Chọn tỉnh thành</option>
                                            </select>

                                            <select class="form-select form-select-sm mb-3" id="district"
                                                aria-label=".form-select-sm">
                                                <option value="" selected>Chọn quận huyện</option>
                                            </select>

                                            <select class="form-select form-select-sm" id="ward"
                                                aria-label=".form-select-sm">
                                                <option value="" selected>Chọn phường xã</option>
                                            </select>
                                            <script>
                                                var citis = document.getElementById("city");
                                                var districts = document.getElementById("district");
                                                var wards = document.getElementById("ward");
                                                var Parameter = {
                                                    url: "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json",
                                                    method: "GET",
                                                    responseType: "application/json",
                                                };
                                                var promise = axios(Parameter);
                                                promise.then(function (result) {
                                                    renderCity(result.data);
                                                });

                                                function renderCity(data) {
                                                    for (const x of data) {
                                                        citis.options[citis.options.length] = new Option(x.Name, x.Id);
                                                    }
                                                    citis.onchange = function () {
                                                        district.length = 1;
                                                        ward.length = 1;
                                                        if (this.value != "") {
                                                            const result = data.filter(n => n.Id === this value);

                                                            for (const k of result[0].Districts) {
                                                                district.options[district.options.length] = new Option(k.Name, k.Id);
                                                            }
                                                        }
                                                    };
                                                    district.onchange = function () {
                                                        ward.length = 1;
                                                        const dataCity = data.filter((n) => n.Id === citis.value);
                                                        if (this.value != "") {
                                                            const dataWards = dataCity[0].Districts.filter(n => n.Id === this.value)[0].Wards;

                                                            for (const w of dataWards) {
                                                                wards.options[wards.options.length] = new Option(w.Name, w.Id);
                                                            }
                                                        }
                                                    };
                                                }
                                            </script>
                                        </div>

                                        <div class="mb-3">
                                            <label class="small mb-1" for="inputAddress">Địa chỉ cụ thể</span></label>
                                            <input class="form-control" id="inputAddress" type="text"
                                                placeholder="Tên đường, số nhà, ..." value="">
                                        </div>

                                        <!-- Form Row-->
                                        <div class="row gx-3 mb-3">
                                            <!-- Form Group (phone number)-->
                                            <div class="col-md-6">
                                                <label class="small mb-1" for="inputEmailAddress">Địa chỉ email</label>
                                                <input class="form-control" id="inputEmailAddress" type="email"
                                                    placeholder="Địa chỉ email" value="">
                                            </div>
                                            <!-- Form Group (birthday)-->
                                            <div class="col-md-6">
                                                <label class="small mb-1" for="inputBirthday">Ngày/ tháng/ năm
                                                    sinh</label>
                                                <input class="form-control" id="inputBirthday" type="date"
                                                    name="birthday" value="">
                                            </div>
                                        </div>
                                        <!-- Save changes button-->
                                        <button class="btn btn-primary btn-content" type="button">Lưu thay đổi</button>
                                    </form>
                                </div>
                            </div>
                            <div class="card mb-4">
                                <div class="card-header">Liên kết mạng xã hội</div>
                                <div class="card-body">
                                    <form>
                                        <button class="btn btn-primary btn-content" type="button"><svg width="20"
                                                height="20" viewBox="0 0 20 20" fill="none"
                                                xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                    d="M18.8002 10.1951C18.8002 9.47569 18.7405 8.95069 18.6112 8.40625H10.2041V11.6534H15.1389C15.0394 12.4604 14.5022 13.6757 13.3082 14.4923L13.2915 14.601L15.9496 16.6133L16.1338 16.6312C17.8251 15.1048 18.8002 12.859 18.8002 10.1951Z"
                                                    fill="#4285F4"></path>
                                                <path
                                                    d="M10.2043 18.7499C12.6219 18.7499 14.6515 17.9721 16.134 16.6305L13.3084 14.4915C12.5523 15.0068 11.5375 15.3665 10.2043 15.3665C7.83642 15.3665 5.8267 13.8402 5.11029 11.7305L5.00528 11.7392L2.24129 13.8295L2.20514 13.9277C3.6776 16.786 6.70216 18.7499 10.2043 18.7499Z"
                                                    fill="#34A853"></path>
                                                <path
                                                    d="M5.11025 11.7322C4.92122 11.1878 4.81182 10.6044 4.81182 10.0016C4.81182 9.39881 4.92122 8.8155 5.1003 8.27106L5.09529 8.15511L2.29666 6.03125L2.2051 6.07381C1.59823 7.25994 1.25 8.59191 1.25 10.0016C1.25 11.4113 1.59823 12.7432 2.2051 13.9294L5.11025 11.7322Z"
                                                    fill="#FBBC05"></path>
                                                <path
                                                    d="M10.2043 4.63331C11.8857 4.63331 13.0199 5.34303 13.6666 5.93612L16.1937 3.525C14.6417 2.11528 12.6219 1.25 10.2043 1.25C6.70216 1.25 3.6776 3.21387 2.20514 6.07218L5.10034 8.26944C5.8267 6.15972 7.83642 4.63331 10.2043 4.63331Z"
                                                    fill="#EB4335"></path>
                                            </svg><a> Liên kết với google</a></button>
                                    </form>
                                </div>
                            </div>
                            <div class="card mb-4">
                                <div class="card-header">Mật khẩu</div>
                                <div class="card-body">
                                    <form>
                                        <div class="form-change-password">
                                            <div class="row">
                                                <div class="col-12 col-sm-6 mb-3">
                                                    <div class="mb-2"><b>Thay đổi mật khẩu</b></div>
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label>Mật khẩu hiện tại <span
                                                                        class="red-star">*</span></label>
                                                                <input class="form-control" type="password"
                                                                    placeholder="••••••">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class = "form-group">
                                                                <label>Mật khẩu mới <span
                                                                        class="red-star">*</span></label>
                                                                <input class="form-control" type="password"
                                                                    placeholder="••••••">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label>Xác nhận mật khẩu <span
                                                                        class="red-star">*</span></label>
                                                                <input class="form-control" type="password"
                                                                    placeholder="••••••">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <button class="btn btn-primary btn-content" type="button">Lưu thay đổi</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </body>
</html>
