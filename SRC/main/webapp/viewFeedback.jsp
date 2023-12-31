<%-- 
    Document   : viewFeedback
    Created on : Oct 31, 2023, 1:54:13 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags always come first -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">


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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> 

        <!--  -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Link CSS -->
        <link rel="stylesheet" href="assets/css/standar-style.css">
    </head>

    <body>
        <jsp:include page="header.jsp" />
        <c:set var="feedbackList" value="${requestScope.feedbackWithBuyerList}" />
        <c:set var="seller" value="${requestScope.seller}" />
        <c:set var="listProduct" value="${requestScope.listProduct}" />
        <div class="main-content">
            <div class="row row-content justify-content-center">
                <div class="col-sm-8 ">
                    <p class="text-warning">${haveFeedback}</p>
                    <div class="container mt-5 justify-content-center">
                        <div class="row profile-seller-info mt-5 rounded-pill" style="background-color:#CAD2C5">
                            <img src="${seller.avatar}"
                                 alt="Profile Image"
                                 class="rounded-circle profile-image" style=" object-fit: cover;
                                 border-radius: 50%;  width: 80px;
                                 height: 80px;">
                            <div>
                                <a id="profileLink" href="Profilemember?userId=${seller.user_ID}" class="username ml-2 mt-2 text-dark">
                                    ${seller.userName}</a>
                                    <c:if test="${averageRate > 0.0}">
                                    <div class="row ml-1 ">
                                        <p class="mr-2 mb-1">Điểm đánh giá: ${averageRate}/5</p> 
                                    </div>
                                    <div class="row ml-1 ">
                                        <c:set var="averageRateStr" value="${averageRate}" />
                                        <c:set var="firstDigit" value="${fn:substring(averageRateStr, 0, 1)}" />
                                        <div class="stars-rating">
                                            <c:forEach begin="1" end="${firstDigit}">
                                                <i class="fa fa-star"></i>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${averageRate == 0.0}">
                                    <p class="ml-2">Không có đánh giá</p>
                                </c:if>
                            </div>
                        </div> 
                        <hr>
                        <div class="container feedbackList p-0">
                            <c:forEach items="${feedbackList}" var="feedbackWBuyer">
                                <div class="row profile-seller-info mt-2">
                                    <img src="${feedbackWBuyer.getBuyer().getAvatar()}"
                                         alt="Profile Image"
                                         class="rounded-circle profile-image" style=" object-fit: cover;
                                         border-radius: 50%;  width: 32px;
                                         height: 32px;">
                                    <a id="profileLink" href="Profilemember?userId=${feedbackWBuyer.getBuyer().user_ID}" class="username text-dark">${feedbackWBuyer.getBuyer().getUserName()}</a>
                                </div>
                                <div class="row feedback_content">
                                    <p>${feedbackWBuyer.getFeedback().getFeedback_content()}</p>
                                </div>
                                <div class="row rate">


                                    <c:set var="averageRateStr" value="${feedbackWBuyer.getFeedback().getRate()}" />
                                    <c:set var="firstDigit" value="${fn:substring(averageRateStr, 0, 1)}" />
                                    <div class="stars-rating">
                                        <c:forEach begin="1" end="${firstDigit}">
                                            <i class="fa fa-star"></i>
                                        </c:forEach>
                                    </div>

                                </div>
                                <div class="row product ">
                                    <c:forEach items="${listProduct}" var="product">
                                        <c:if test="${product.productId == feedbackWBuyer.getFeedback().getProduct_id()}">
                                            <a href="productDetailServlet?productId=${product.productId}" class="row m-0" style="width: 100%" >
                                                <img src="${product.productImage}"
                                                     class="col-sm-4 p-0"
                                                     alt="product Image"
                                                     style=" object-fit: cover;
                                                     border-radius: 10%;  max-width: 56px;
                                                     max-height: 56px;">
                                                <p class="col-sm-8">${product.title}</p>
                                            </a>
                                        </c:if>
                                    </c:forEach>
                                </div>
                                <hr class="m-0">
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                                 
    </body>
</html>

