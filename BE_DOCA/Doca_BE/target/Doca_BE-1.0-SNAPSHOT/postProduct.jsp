<%-- 
    Document   : post.jsp
    Created on : Oct 10, 2023, 3:01:30 PM
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

        <title>Forum</title>
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

        <!-- Link CSS -->
        <link rel="stylesheet" href="assets/css/standar-style.css">
        <link rel="stylesheet" href="assets/css/post-style.css">
        <script>
            $(function () {
                $("#header").load("header.jsp");
            });
        </script>
    </head>

    <body>
        <div id="header"></div>

        <div class="main-content">
            <div class="row row-content justify-content-center">

                <div class="col-sm-8 mt-5">

                    <!-- viết code vào đây -->


                    <h1>Bài đăng bán của bạn</h1>

                    <form action="DispatchServlet">
                        <button name="btAction" type="submit" class="submit mt-5 mb-5 btn btn-primary form-control" value="test">Test</button>
                    </form>
                    <form action="DispatchServlet" method="get">
                        <h5>Danh mục đăng tin</h5>
                        <div class="dropdown mt-3 mb-3">
                            <select class="form-select" aria-label="Default select example" name="category_Product">
                                <option value="accessory">Phụ kiện</option>
                                <option value="food">Thức ăn</option>
                                <option value="cage">Chuồng động vật</option>
                                <option value="4">Khác</option>
                            </select>
                        </div>
                        <div class="mt-3 mb-3">
                            <label for="img" class="form-label">Hình Ảnh</label>
                            <input type="file" class="form-control" id="img" name="img" multiple required>
                        </div>
                        <div class="mt-3 mb-3">
                            <label for="title" class="form-label">Tiêu đề</label>
                            <input type="text" class="form-control" id="title" name="title" required>
                        </div>
                        <div class="mb-3">
                            <label for="price" class="form-label">Giá tiền</label>
                            <input type="text" class="form-control" id="price" name="price" required>
                        </div>
                        <div class="mb-3">
                            <label for="content" class="form-label">Nội dung</label>
                            <textarea class="form-control" id="content" name="content" rows="5" required></textarea>
                        </div>
                        <!-- bat dau modal -->
                        <div class="container mt-3">
                            <!-- Button mở modal -->
                            <button type="button" class="btn btn-primary form-control" data-toggle="modal"
                                    data-target="#myModal">
                                Địa chỉ
                            </button>

                            <!-- Modal -->
                            <div class="modal" id="myModal">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <!-- Modal Header -->
                                        <div class="modal-header" data-toggle="collapse" data-target="#categoryList">
                                            <h4 class="modal-title">Địa chỉ</h4>
                                        </div>

                                        <!-- Modal body -->

                                        <div class="col-6">
                                            <select class="form-select form-select-sm mb-3" id="city"
                                                    aria-label=".form-select-sm" name="city"> 
                                                <option value="" selected>Chọn tỉnh thành</option>
                                            </select>

                                            <select class="form-select form-select-sm mb-3" id="district"
                                                    aria-label=".form-select-sm" name="district">
                                                <option value="" selected>Chọn quận huyện</option>
                                            </select>

                                            <select class="form-select form-select-sm mb-3" id="ward"
                                                    aria-label=".form-select-sm" name="ward">
                                                <option value="" selected>Chọn phường xã</option>
                                            </select>
                                            <!--                                            <div class="mb-3">
                                                                                            <label for="title" class="form-label">Địa chỉ cụ thể</label>
                                                                                            <input type="text" class="form-control" id="title" name="title" required>
                                                                                        </div>-->
                                        </div>

                                        <!-- Modal footer -->
                                        <div class="modal-footer">

                                            <button type="submit" class="btn btn-secondary"
                                                    data-dismiss="modal">Đóng</button>
                                            <button type="submit" class="btn btn-secondary"
                                                    value="done">Xong</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button name="btAction" type="submit" class="submit mt-5 mb-5 btn btn-primary form-control" value="postProduct">Đăng bài</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
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
                        const result = data.filter(n => n.Id === this.value);

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
</html>
