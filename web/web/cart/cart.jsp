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
                <div class="container py-5">
                    <div class="row d-flex justify-content-center my-4">
                        <div class="col-md-8">
                            <div class="card mb-4">
                                <div class="card-header py-3">
                                </div>
                                <div class="card-body">
                                    <c:choose>
                                        <c:when test="${empty sessionScope.productOrders}">
                                            <div class="container py-6">
                                                <div class="row d-flex justify-content-center my-4">
                                                    <div class="col-md-15">
                                                        <div class="alert alert-warning text-center" role="alert">
                                                            Bạn không có sản phẩm nào trong giỏ.
                                                        </div>
                                                        <div class="text-center">
                                                            <a href="product"> Tiếp tục mua hàng </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <!-- Single item -->
                                            <c:forEach items="${sessionScope.productOrders}" var="productOrder">
                                                <form id="updateForm-${productOrder.id}" action="updatequantityproductorder" method="GET">
                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-12 mb-4 mb-lg-0">
                                                            <!-- Image -->
                                                            <div class="bg-image hover-overlay hover-zoom ripple rounded" data-mdb-ripple-color="light">
                                                                <img src="${productOrder.image}"
                                                                     class="w-100" alt="${productOrder.image}" />
                                                                <a href="#">
                                                                    <div class="mask" style="background-color: rgba(251, 251, 251, 0.2)"></div>
                                                                </a>
                                                            </div>
                                                            <!-- Image -->
                                                        </div>

                                                        <div class="col-lg-5 col-md-6 mb-4 mb-lg-0">
                                                            <!-- Data -->
                                                            <p><strong>${productOrder.title}</strong></p>
                                                            <p>${productOrder.name}</p>
                                                            <button onclick="window.location.href = 'deleteproductorder?id=${productOrder.id}'" type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-danger btn-sm me-1 mb-2" data-mdb-tooltip-init
                                                                    title="Remove item">
                                                                <i class="fas fa-trash"></i>
                                                            </button>
                                                            <!-- Data -->
                                                        </div>

                                                        <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">

                                                            <div>
                                                                <label class="form-label" for="form1">Số lượng</label>
                                                            </div>
                                                            <div class="d-flex mb-4" style="max-width: 300px; align-items: center;">
                                                                <button data-mdb-button-init data-mdb-ripple-init class="btn btn-danger px-3 me-2"
                                                                        type="submit" name="action" value="decrease" 
                                                                        onclick="submitForm(event, ${productOrder.id})">
                                                                    <i class="fas fa-minus"></i>
                                                                </button>

                                                                <div data-mdb-input-init class="form-outline text-center">
                                                                    <input id="form-${productOrder.id}" min="1" name="quantity" value="${productOrder.quantity}" type="number" class="form-control" 
                                                                           onchange="updateAction('manual')" 
                                                                           onblur="submitForm(${productOrder.id})"/>
                                                                </div>


                                                                <button data-mdb-button-init data-mdb-ripple-init class="btn btn-danger px-3 ms-2"
                                                                        type="submit" name="action" value="increase" 
                                                                        onclick="submitForm(event, ${productOrder.id})">
                                                                    <i class="fas fa-plus"></i>
                                                                </button>
                                                            </div>

                                                            <input type="hidden" name="action" id="action" value="manual" />
                                                            <input type="hidden" name="productId" value="${productOrder.id}" />

                                                            <script>
                                                                function submitForm(productId) {
                                                                    document.getElementById('updateForm-' + productId).submit();
                                                                }
                                                            </script>

                                                            <!-- Price -->
                                                            <p class="text-start text-md-center">
                                                                <strong>Đơn giá: <fmt:formatNumber value="${productOrder.price}" type="number" pattern="#,##0"/>đ /chiếc</strong>
                                                            </p>
                                                            <!-- Price -->
                                                        </div>
                                                    </div>
                                                    <!-- Single item -->
                                                    <hr class="my-4" />
                                                </form>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card mb-4">
                                <div class="card-header py-3">
                                    <h5 class="mb-0">Thống kê</h5>
                                </div>
                                <form action="confirmcart" method="GET">
                                    <div class="card-body">
                                        <ul class="list-group list-group-flush">
                                            <c:forEach items="${sessionScope.productOrders}" var="productOrder">
                                                <li
                                                    class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
                                                    Sản phẩm
                                                    <span>${productOrder.name}</span>
                                                </li>
                                                <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                                                    Số lượng
                                                    <span>${productOrder.quantity} chiếc</span>
                                                </li>
                                                <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
                                                    <div>
                                                        <strong>Giá thành</strong>
                                                    </div>
                                                    <span><strong><fmt:formatNumber value="${productOrder.quantity * productOrder.price}" type="number" pattern="#,##0"/>đ</strong></span>
                                                </li>
                                            </c:forEach>
                                            </br>
                                            <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
                                                <div>
                                                    <strong>Tổng cộng</strong>
                                                </div>
                                                <span><strong><fmt:formatNumber value="${sumOffAll}" type="number" pattern="#,##0"/>đ</strong></span>
                                            </li>
                                        </ul>
                                        <c:choose>
                                            <c:when test="${not empty sessionScope.productOrders}">
                                                <button  type="submit" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-lg btn-block btn-danger">
                                                    Xác nhận
                                                </button>
                                            </c:when>
                                        </c:choose>
                                    </div>
                                </form>
                            </div>
                        </div>     
                    </div>
                </div>
            </section>
        </main>

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
