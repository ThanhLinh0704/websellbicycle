<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>Wish</title>
        <meta name="description" content="">
        <meta name="keywords" content="">

        <!-- Favicons -->
        <link href="assets/img/logo.png" rel="icon">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com" rel="preconnect">
        <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Inter:wght@100;200;300;400;500;600;700;800;900&family=Amatic+SC:wght@400;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">


        <!-- Vendor CSS Files -->
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/aos/aos.css" rel="stylesheet">
        <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

        <!-- Main CSS File -->
        <link href="assets/css/main.css" rel="stylesheet">
    </head>

    <body class="index-page">

        <style>
            .gradient-custom {
                background: #f2f2f2;
            }
        </style>

        <header id="header" class="header d-flex align-items-center sticky-top">
            <div class="container position-relative d-flex flex-column align-items-center">

                <div class="d-flex align-items-center justify-content-between w-100">
                    <a href="wish" class="logo d-flex align-items-center me-auto me-xl-0">
                        <img src="assets/img/logo.png" alt="">
                        <h1 class="sitename">Wish</h1>
                        <span>.</span>
                    </a>

                    <div class="w-100 d-flex justify-content-center mb-3">
                        <form class="d-flex search-bar" action="productsearch" method="GET" style="width: 75%; height: 20%">
                            <input class="form-control me-2" type="search" name="search" placeholder="Tìm kiếm sản phẩn yêu thích của bạn tại đây" aria-label="Search" value="${sessionScope.search}">
                            <button class="btn btn-outline-danger" type="submit">Tìm kiếm</button>
                        </form>
                        <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
                    </div>

                    <c:choose>
                        <c:when test="${empty sessionScope.account}">
                            <a class="btn-getstarted" href="login">Đặt hàng ngay</a>
                        </c:when>
                        <c:otherwise>
                            <div class="dropdown">
                                <span class="btn-getstarted dropdown-toggle" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                                    Xin chào, ${sessionScope.user.name}!
                                </span>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <li><a class="dropdown-item" href="info">Thông tin</a></li>
                                        <c:if test="${sessionScope.account.isAdmin == 1 || sessionScope.account.isSell == 1}">
                                        <li><a class="dropdown-item" href="management">Quản lý</a></li>
                                        </c:if>
                                    <li><a class="dropdown-item" href="cart">Giỏ hàng</a></li>
                                    <li><a class="dropdown-item" href="order">Đơn hàng</a></li>
                                    <li><a class="dropdown-item" href="logout">Đăng xuất</a></li>
                                </ul>
                            </div>
                        </c:otherwise>
                    </c:choose>

                </div>
            </div>
        </header>
        <main class="main">
            <section class="h-100 gradient-custom">
                <div class="container-fluid py-5">
                    <div class="row d-flex justify-content-center my-4">
                        <div class="col-md-10">
                            <div class="card mb-5 shadow-sm">
                                <div class="card-header py-3">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <button class="btn btn-link text-decoration-none fw-bold">
                                            <a href="order">&larr; Quay lại</a>
                                        </button>
                                        <h6 class="fs-5 text-danger mb-0">
                                            Mã đơn hàng: ${order.orderID} | <span class="text-success">${order.statusName}</span>
                                        </h6>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="container my-5">
                                        <div class="card border-0 mb-4 bg-light p-3">
                                            <h5 class="card-title fw-semibold">Địa chỉ nhận hàng</h5>
                                            <p class="card-text"><strong>Họ và tên: ${user.name}</strong></p>
                                            <p class="card-text">Số điện thoại: ${user.phone}</p>
                                            <p class="card-text">Địa chỉ: ${user.address}</p>
                                            <p class="card-text">Ghi chú: ${order.note}</p>
                                            <p class="card-text"><strong>Ngày đặt hàng:</strong> <fmt:formatDate value="${order.orderDate}" pattern="dd/MM/yyyy"/></p>
                                            <c:if test="${order.statusId == 4}">
                                                <p class="mb-0"><strong>Ngày giao hàng:</strong> <fmt:formatDate value="${order.completedDate}" pattern="dd/MM/yyyy"/></p>
                                            </c:if>
                                            <c:if test="${order.statusId == 5}">
                                                <p class="mb-0"><strong>Ngày huỷ đơn:</strong> <fmt:formatDate value="${order.completedDate}" pattern="dd/MM/yyyy"/></p>
                                            </c:if>
                                        </div>

                                        <c:forEach items="${sessionScope.orderDetails}" var="orderDetail">
                                            <div class="card border-0 mb-3 shadow-sm">
                                                <div class="row g-0 align-items-center">
                                                    <div class="col-md-2 d-flex justify-content-center p-2">
                                                        <img src="${orderDetail.image}" alt="Ảnh" class="img-fluid rounded">
                                                    </div>
                                                    <div class="col-md-8 px-4">
                                                        <p class="mb-1"><strong>Tên sản phẩm:</strong> ${orderDetail.productName}</p>
                                                        <p class="mb-1"><strong>Phân loại hàng:</strong> ${orderDetail.categoryName}</p>
                                                        <p class="mb-1"><strong>Số lượng:</strong> ${orderDetail.quantity}</p>
                                                        <p class="mb-1"><strong>Đơn giá:</strong> <fmt:formatNumber value="${orderDetail.price}" type="number" pattern="#,##0"/>đ / chiếc</p>
                                                    </div>
                                                    <div class="col-md-2 text-end pe-3">
                                                        <p class="fs-5 text-danger mb-0"><fmt:formatNumber value="${orderDetail.price * orderDetail.quantity}" type="number" pattern="#,##0"/>đ</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>

                                        <div class="card border-0 p-4 bg-light text-end shadow-sm">
                                            <p class="mb-3"><strong>Giá thành: </strong><fmt:formatNumber value="${sessionScope.total}" type="number" pattern="#,##0"/>đ</p>
                                            <p class="mb-3"><strong>Mã giảm giá: </strong>${order.code}</p>
                                            <p class="fs-5 fw-bold text-danger">Tổng giá trị: <fmt:formatNumber value="${order.totalPrice}" type="number" pattern="#,##0"/>đ</p>
                                            </br>
                                            </br>
                                            <p class="mb-2"><strong>Phương thức thanh toán: </strong>${order.methodName}</p>
                                        </div>
                                        <div class="d-flex justify-content-center my-3">
                                            <form action="order" method="POST">
                                                <input type="hidden" name="orderId" value="${order.orderID}"/>
                                                <button type="submit" name="action" value="confirmPayment" class="btn btn-primary me-2" 
                                                        <c:if test="${order.statusId != 1}">disabled</c:if>>
                                                            Xác nhận thanh toán
                                                        </button>
                                                        <button type="submit" name="action" value="markReceived" class="btn btn-success me-2" 
                                                        <c:if test="${order.statusId != 3}">disabled</c:if>>
                                                            Đã nhận được hàng
                                                        </button>
                                                        <button type="submit" name="action" value="cancelOrder" class="btn btn-danger" 
                                                        <c:if test="${order.statusId != 1 && order.statusId != 2}">disabled</c:if>>
                                                            Huỷ đơn hàng
                                                        </button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </main>
            ```
        <jsp:include page="../layout/footer.jsp"></jsp:include>

        <!-- Scroll Top -->
        <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

        <!-- Preloader -->
        <div id="preloader"></div>

        <!-- Vendor JS Files -->
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>
        <script src="assets/vendor/aos/aos.js"></script>
        <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
        <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
        <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>

        <!-- Main JS File -->
        <script src="assets/js/main.js"></script>


    </body>

</html>
