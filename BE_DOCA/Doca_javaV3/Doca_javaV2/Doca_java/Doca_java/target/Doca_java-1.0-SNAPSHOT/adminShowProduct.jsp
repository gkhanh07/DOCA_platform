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

        <link rel="stylesheet" href="assets/css/marketv2.css">
        <link rel="stylesheet" href="assets/css/standar-style.css">
        <link rel="stylesheet" href="assets/css/forum-style-V3.css">
        <!-- Link JS -->


        <script>
            $(function () {
                $("#header").load("header.jsp");
            });
        </script>
    </head>
    <body>
        <c:set var="Products" value="${requestScope.listOfProduct}"/>
        <h1>Admin page</h1>
        <form action="DispatchServlet">
            <div class="tab-content">
                <c:forEach items="${Products}" var="product">
                    <div style="position: relative; border-bottom: 1px solid rgb(224, 224, 224);">
                        <a href="product-detail.html" class="sell d-flex" style="width: 100%;">
                            <c:set var="img" value="ImgUploadByUser/${product.productImage}"/>
                            <img class="image" src=${img} alt="Hình ảnh">
                            <div class="font">
                                <c:set var="title" value="${product.title}"/>
                                <h5><strong>${title}</strong></h5>
                                <c:set var="price" value="${product.price}"/>
                                <h6 style="color:rgb(242, 106, 106);">${price} đ</h6>
                                <c:set var="address" value="${product.address}"/>
                                <h6 style="font-size: 15px; opacity: 0.5;">${address}</h6>
                            </div>
                        </a>

                        <span class="like-icon">
                            <c:if test="${empty SaveProducts}">
                                <c:set var="color" value="gray" />
                            </c:if>
                            <c:if test="${not empty SaveProducts}">
                                <c:forEach items="${SaveProducts}" var="saveproduct">
                                    <c:when  test="${saveproduct.productId eq product.productId}">
                                        <c:set var="color" value="red" />
                                    </c:when >
                                    <c:otherwise>
                                        <c:set var="color" value="gray" />
                                    </c:otherwise>
                                </c:forEach>
                            </c:if>
                            <button type="submit" name="btAction" value="saveProduct" class="fa fa-heart border-0 p-0" 
                                    style="color: ${color}; cursor: pointer; position: absolute; bottom: 30px; right: 40px;">
                                <input type="hidden" name="productID" value="${product.productId}" />
                            </button>
                        </span>
                    </div>
                </c:forEach>
            </div>  
        </form>
    </body>
</html>
