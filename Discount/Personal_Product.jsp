<%-- 
    Document   : Personal_product
    Created on : Oct 16, 2023, 10:17:15 PM
    Author     : Admin
--%>

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
        <!-- <link rel="stylesheet" href="assets/css/personal-post-style.css"> -->
        <link rel="stylesheet" href="assets/css/standar-style.css">



    </head>

    <body>
        <jsp:include page="header.jsp" />
        <c:set var="listProductOfPersonal" value="${requestScope.listProductOfPersonal}"/>
        <c:set var="message" value="${requestScope.Message}"/>
        <c:set var="IN" value="${sessionScope.IN}"/>



        <div class="main-content">
            <div class="row row-content justify-content-center">

                <div class="col-sm-8 ">

                    <!-- viết code vào đây -->
                    <div class="container mt-5 justify-content-center">
                        <h1>Quản lý sản phẩm của bạn</h1>

                        <div class="row-content">
                            <nav class="navbar navbar-light navbar-expand-lg container-fluid rounded-pill"
                                 style="background-color: #CAD2C5;"
                                 >

                                <div class="container justify-content-center">

                                    <ul class="nav nav-tabs border-0">
                                        <li class="nav-item rounded-pill">
                                            <a class="nav-link ${IN eq 'display' ? 'active' : ''} rounded-pill mt-1" href="#display" role="tab" data-toggle="tab">
                                                <strong style="color: black;">Đang hiển thị</strong>
                                            </a>
                                        </li>
                                        <li class="nav-item rounded-pill">
                                            <a class="nav-link ${IN eq 'denied' ? 'active' : ''} rounded-pill mt-1" href="#denied" role="tab" data-toggle="tab">
                                                <strong style="color: black;">Bị từ chối</strong>
                                            </a>
                                        </li>
                                        <li class="nav-item rounded-pill">
                                            <a class="nav-link ${IN eq 'waiting' ? 'active' : ''} rounded-pill mt-1" href="#waiting" role="tab" data-toggle="tab">
                                                <strong style="color: black;">Chờ duyệt</strong>
                                            </a>
                                        </li>
                                        <li class="nav-item rounded-pill">
                                            <a class="nav-link ${IN eq 'saled' ? 'active' : ''} rounded-pill mt-1" href="#saled" role="tab" data-toggle="tab">
                                                <strong style="color: black;">Đã bán</strong>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </nav>

                        </div>
                        <!-- content -->
                        <div class="tab-content mt-5 pb-5">
                            <div role="tabpanel" class="tab-pane fade ${IN eq 'display' ? 'show active' : ''}" id="display"> 
                                <c:set var="countDisplay" value="0" />
                                <c:forEach items="${listProductOfPersonal}" var="product">
                                    <c:if test="${product.status eq 'approved'}">
                                        <c:set var="countDisplay" value="${count + 1}" />
                                        <img class="col-sm-6 image-content mt-5 img-fluid"
                                             src="${product.productImage}" alt="Hình ảnh">
                                        <div class="font">
                                            <h5>${product.title}</h5>
                                            <h6>giá tiền: <span id="productPrice-${product.productId}">${product.price}</span></h6>
                                            <p>${product.address}</p>
                                            <p>
                                                Sản phẩm đang ở chế độ:
                                                <span class="${product.isPublic() ? 'text-success' : 'text-danger'}">
                                                    ${product.isPublic() ? 'Công khai' : 'Ẩn'}
                                                </span>
                                            </p>
                                            <c:forEach items="${listOfCountSaveproduct}" var="countSave">
                                                <c:if test="${countSave.productId== product.productId}">
                                                    <a href="getListUserHavedSaveProduct?productId=${product.productId}">Sản phẩm có  ${countSave.countSave} lượt quan tâm</a>
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                        <a class="btn btn-primary" href="goUpdateProduct?ProductID=${product.productId}&IN=display" >sửa sản phẩm</a>
                                        <a class="btn btn-secondary" href="SetIsPublic?ProductID=${product.productId}&isPublic=${product.isPublic()}&IN=display">

                                            <c:choose>
                                                <c:when test="${product.isPublic()}">
                                                    Ẩn sản phẩm <i class="fa fa-eye-slash"></i>
                                                </c:when>
                                                <c:otherwise>
                                                    Hiện sản phẩm <i class="fa fa-eye"></i>
                                                </c:otherwise>
                                            </c:choose>
                                        </a>
                                        <c:if test="${product.price > 0}">
                                            <button class="btn btn-danger" data-toggle="modal" data-target="#discountModal-${product.productId}">
                                                Giảm giá sản phẩm <i class="fas fa-percent"></i>
                                            </button>
                                        </c:if>



                                        <div class="modal fade" id="discountModal-${product.productId}" tabindex="-1" role="dialog" aria-labelledby="discountModalLabel-${product.productId}"
                                             aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="discountModalLabel-${product.productId}">Tạo mã giảm giá</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="discount-suggestions">
                                                            <button class="btn btn-outline-secondary" onclick="applyDiscountSuggestion(${product.productId}, 10)">10%</button>
                                                            <button class="btn btn-outline-secondary" onclick="applyDiscountSuggestion(${product.productId}, 20)">20%</button>
                                                            <button class="btn btn-outline-secondary" onclick="applyDiscountSuggestion(${product.productId}, 50)">50%</button>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="discountType-${product.productId}">Loại giảm giá:</label>
                                                            <select class="form-control" id="discountType-${product.productId}" onchange="updateDiscountLabel(${product.productId})">
                                                                <option value="percentage">Phần trăm</option>
                                                                <option value="amount">Số tiền</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="discountValue-${product.productId}">Giá trị giảm giá:</label>
                                                            <div class="input-group">
                                                                <input type="text" class="form-control" id="discountValue-${product.productId}" oninput="updateDiscountResult(${product.productId})">
                                                                <div class="input-group-append">
                                                                    <span class="input-group-text" id="discountLabel-${product.productId}"></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="discountStartDate-${product.productId}">Ngày bắt đầu giảm giá:</label>
                                                            <input type="date" class="form-control" name="dateStart" id="discountStartDate-${product.productId}">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="discountEndDate-${product.productId}">Ngày kết thúc giảm giá:</label>
                                                            <input type="date" class="form-control" name="dateEnd"  id="discountEndDate-${product.productId}">
                                                        </div>

                                                        <div id="discountResult-${product.productId}" style="display: none;">
                                                            Giá trị giảm giá của bạn cho sản phẩm này là: <span id="discountAmount-${product.productId}"></span>
                                                        </div>
                                                        <div>
                                                            Giá sau khi giảm giá: <span id="newPrice-${product.productId}"></span>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                                        <form action="DiscountProductServlet">
                                                            <!-- Các trường ẩn để lưu trữ các giá trị -->
                                                            <input type="hidden" name="productId" id="productId" value="${product.productId}">
                                                            <input type="hidden" name="priceOriginal" id="priceOri" value="${product.price}">
                                                            <input type="hidden" name="discountType" id="discountType" value="">
                                                            <input type="hidden" name="discountValue" id="discountValue" value="">
                                                            <input type="hidden" name="discountStartDate" id="discountStartDate" value="">
                                                            <input type="hidden" name="discountEndDate" id="discountEndDate" value="">

                                                            <button type="submit" class="btn btn-success">Giảm giá</button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <script>

                                            function updateDiscountLabel(productId) {
                                                var discountType = document.getElementById("discountType-" + productId).value;
                                                var discountLabel = document.getElementById("discountLabel-" + productId);

                                                if (discountType === "percentage") {
                                                    discountLabel.textContent = "%";
                                                } else if (discountType === "amount") {
                                                    discountLabel.textContent = "VND";
                                                }
                                            }
                                            function updateDiscountStartDate(productId) {
                                                var discountStartDateInput = document.getElementById("discountStartDate-" + productId);
                                                var discountStartDateHiddenInput = document.getElementById("discountStartDate");

                                                discountStartDateInput.addEventListener("change", function () {
                                                    var startDateValue = discountStartDateInput.value;
                                                    discountStartDateHiddenInput.value = startDateValue;
                                                });
                                            }

                                            function updateDiscountEndDate(productId) {
                                                var discountEndDateInput = document.getElementById("discountEndDate-" + productId);
                                                var discountEndDateHiddenInput = document.getElementById("discountEndDate");

                                                discountEndDateInput.addEventListener("change", function () {
                                                    var endDateValue = discountEndDateInput.value;
                                                    discountEndDateHiddenInput.value = endDateValue;
                                                });
                                            }

                                            function updateDiscountResult(productId) {

                                                var discountType = document.getElementById("discountType-" + productId).value;
                                                var discountValue = document.getElementById("discountValue-" + productId).value;
                                                var discountAmount = document.getElementById("discountAmount-" + productId);
                                                var productPriceElement = document.getElementById("productPrice-" + productId);
                                                var productPrice = parseFloat(productPriceElement.textContent);

                                                if (discountType === "percentage") {
                                                    var discountedPrice = productPrice * (100 - discountValue) / 100;
                                                    var discountPercentage = discountValue + "%";
                                                    discountAmount.textContent = discountPercentage;
                                                } else if (discountType === "amount") {
                                                    var discountedPrice = productPrice - discountValue;
                                                    var discountPercentage = ((productPrice - discountedPrice) / productPrice) * 100 + "%";
                                                    var roundedPercentage = parseFloat(discountPercentage).toFixed(1);
                                                    discountAmount.textContent = discountValue + " VND (" + roundedPercentage + "%)";
                                                }

                                                document.getElementById("discountResult-" + productId).style.display = "block";

                                                // Hiển thị giá trị mới của product.price
                                                var newPriceElement = document.getElementById("newPrice-" + productId);
                                                newPriceElement.textContent = discountedPrice.toFixed(2); // Làm tròn đến 2 chữ số thập phân
                                                // Cập nhật giá trị của input hidden
                                                var discountValueInput = document.getElementById("discountValue");
                                                discountValueInput.value = discountValue;


                                                // Cập nhật giá trị của các trường ẩn

                                                document.querySelector(`input[name="discountType"][value="${productId}"]`).value = discountType;
                                                document.querySelector(`input[name="discountValue"][value="${productId}"]`).value = discountValue;
                                                // Gọi hàm cập nhật giá trị discountStartDate
                                                updateDiscountStartDate(productId);
// Gọi hàm cập nhật giá trị discountEndDate
                                                updateDiscountEndDate(productId);

                                            }


                                            function applyDiscountSuggestion(productId, discountPercentage) {
                                                document.getElementById("discountType-" + productId).value = "percentage";
                                                document.getElementById("discountValue-" + productId).value = discountPercentage;
                                                updateDiscountLabel(productId);
                                                updateDiscountResult(productId);

                                                // Cập nhật giá trị của các trường ẩn

                                                document.querySelector(`input[name="discountType"][value="${productId}"]`).value = "percentage";
                                                document.querySelector(`input[name="discountValue"][value="${productId}"]`).value = discountPercentage;
                                                // Gọi hàm cập nhật giá trị discountStartDate
                                                updateDiscountStartDate(productId);
                                                // Gọi hàm cập nhật giá trị discountEndDate
                                                updateDiscountEndDate(productId);
                                            }
                                        </script>
                                        <hr>
                                    </c:if>
                                </c:forEach>
                                <c:if test="${countDisplay eq 0}">
                                    <p>${message}</p>
                                </c:if>
                            </div>

                            <div role="tabpanel" class="tab-pane fade ${IN eq 'denied' ? 'show active' : ''} " id="denied">
                                <c:set var="countDenied" value="0" />
                                <c:forEach items="${listProductOfPersonal}" var="product">
                                    <c:if test="${product.status eq 'rejected'}">
                                        <c:set var="countDenied" value="${count + 1}" />
                                        <img class="col-sm-6 image-content mt-5 img-fluid"
                                             src="${product.productImage}" alt="Hình ảnh">
                                        <div class="font">
                                            <h5>${product.title}</h5>
                                            <h6>giá tiền: <fmt:formatNumber value="${product.price}" type="currency" currencyCode="VND" /></h6>
                                            <p>${product.address}</p>
                                            <p>Lí do từ chối: ${product.reason}</p>
                                            <p class="text-warning">Tin đăng này không được sửa. Vui lòng đăng tin khác!</p>
                                        </div>

                                        <a class="btn btn-success" href="UpdateProduct.jsp">Đăng sản phẩm mới</a>
                                        <hr>
                                    </c:if>
                                </c:forEach>
                                <c:if test="${countDenied eq 0}">
                                    <p>${message}</p>
                                </c:if>
                            </div>
                            <div role="tabpanel" class="tab-pane fade  ${IN eq 'waiting' ? 'show active' : ''}  " id="waiting">
                                <c:set var="countWaiting" value="0" />
                                <c:forEach items="${listProductOfPersonal}" var="product">
                                    <c:if test="${product.status eq 'pending'}">
                                        <c:set var="countWaiting" value="${count + 1}" />
                                        <img class="col-sm-6 image-content mt-5 img-fluid"
                                             src="${product.productImage}" alt="Hình ảnh">
                                        <div class="font">
                                            <h5>${product.title}</h5>
                                            <h6>giá tiền: <fmt:formatNumber value="${product.price}" type="currency" currencyCode="VND" /></h6>
                                            <p>${product.address}</p>
                                            <p>Đang chờ </p>     
                                        </div>
                                        <a class="btn btn-primary" href="goUpdateProduct?ProductID=${product.productId}&IN=waiting" >sửa sản phẩm</a>

                                        <hr> 
                                    </c:if>
                                </c:forEach>
                                <c:if test="${countWaiting eq 0}">
                                    <p>${message}</p>
                                </c:if>
                            </div>



                            <div role="tabpanel" class="tab-pane fade  ${IN eq 'saled' ? 'show active' : ''}  " id="saled">
                                <c:set var="countsaled" value="0" />
                                <c:forEach items="${listProductOfPersonal}" var="product">
                                    <c:if test="${product.status eq 'saled'}">
                                        <c:set var="countsaled" value="${count + 1}" />
                                        <img class="col-sm-6 image-content mt-5 img-fluid"
                                             src="${product.productImage}" alt="Hình ảnh">
                                        <div class="font">
                                            <h5>${product.title}</h5>
                                            <h6>giá tiền: <fmt:formatNumber value="${product.price}" type="currency" currencyCode="VND" /></h6>
                                            <p>${product.address}</p>
                                            <p>Đã bán </p>     
                                        </div>
                                        <a class="btn btn-primary" href="resaledProduct?producID=${product.productId}" >Bán lại sản phẩm</a>

                                        <hr> 
                                    </c:if>
                                </c:forEach>
                                <c:if test="${countsaled eq 0}">
                                    <p>${message}</p>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>

    </body>
</html>
