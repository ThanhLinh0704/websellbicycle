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
            .dropdown {
                position: relative;
            }

            .dropdown-menu {
                display: none;
                position: absolute;
                top: 100%;
                left: 0;
                z-index: 1000;
                background-color: white;
                border: 1px solid #ccc;
            }
            .dropdown:hover .dropdown-menu {
                display: block;
            }

            .navmenu ul li a {
                font-size: 9px;
            }
            .icon-hover:hover {
                border-color: #3b71ca !important;
                background-color: white !important;
                color: #3b71ca !important;
            }

            .icon-hover:hover i {
                color: #3b71ca !important;
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
            <!-- content -->
            <section class="py-5">
                <div class="container">
                    <div class="row gx-5">
                        <aside class="col-lg-6">
                            <div class="border rounded-4 mb-3 d-flex justify-content-center">
                                <a data-fslightbox="mygalley" class="glightbox" target="_blank" data-type="image" href="${product.image}">
                                    <img class="img-fluid rounded-4" src="${product.image}" style="width: 100%; height: 400px; object-fit: cover;" />
                                </a>
                            </div>
                        </aside>

                        <main class="col-lg-6">
                            <div class="ps-lg-3">
                                <h1 class="title text-dark">
                                    ${product.title}
                                </h1>
                                <br />
                                <div class="mb-3">
                                    <span class="h5"><fmt:formatNumber value="${product.price}" type="number" pattern="#,##0"/>đ</span>
                                </div>
                                <br /><br /><br />
                                <hr />
                                <form action="addproductorder" method="GET">
                                    <div class="row mb-4">
                                        <div class="col-md-4 col-6 mb-3">
                                            <label class="mb-2 d-block">Số lượng</label>
                                            <div class="input-group mb-3" style="width: 170px;">
                                                <button class="btn btn-white border border-secondary px-3" type="button" id="button-minus">
                                                    <i class="fas fa-minus"></i>
                                                </button>
                                                <input type="hidden" name="id" value="${product.id}" />
                                                <input type="text" id="quantity-input" class="form-control text-center border border-secondary" name="quantity" value="1" aria-label="Quantity" />
                                                <button class="btn btn-white border border-secondary px-3" type="button" id="button-plus">
                                                    <i class="fas fa-plus"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <div>
                                            <label>${requestScope.error}</label>
                                        </div>
                                    </div>
                                    <c:if test="${product.amount <= 0}">
                                        <div>
                                            <h2>Sản phẩm hiện tại đang hết hàng</h2>
                                        </div>
                                    </c:if>
                                    <c:if test="${product.amount > 0}">
                                        <button type="submit" class="btn btn-primary shadow-0" name="action" value="addToCart"> <i class="me-1 fa fa-shopping-basket"></i> Thêm vào giỏ hàng </button>
                                        <button type="submit" class="btn btn-danger shadow-0" name="action" value="buyNow"> <i class="me-1 fa fa-shopping-basket"></i> Mua ngay </button>
                                    </c:if>
                                </form>

                                <script>
                                    document.getElementById('button-plus').addEventListener('click', function () {
                                        var quantityInput = document.getElementById('quantity-input');
                                        var currentValue = parseInt(quantityInput.value);
                                        quantityInput.value = currentValue + 1;
                                    });

                                    document.getElementById('button-minus').addEventListener('click', function () {
                                        var quantityInput = document.getElementById('quantity-input');
                                        var currentValue = parseInt(quantityInput.value);
                                        if (currentValue > 1) {
                                            quantityInput.value = currentValue - 1;
                                        }
                                    });
                                </script>

                            </div>
                        </main>

                    </div>
                </div>
            </section>
            <!-- content -->

            <section class="bg-light border-top py-4">
                <div class="container">
                    <div class="row gx-4">
                        <div class="col-lg-8 mb-4">
                            <div class="border rounded-2 px-3 py-2 bg-white">
                                <!-- Pills navs -->
                                <ul class="nav nav-pills nav-justified mb-3" id="ex1" role="tablist">
                                    <li class="nav-item d-flex" role="presentation">
                                        <a class="nav-link d-flex align-items-center justify-content-center w-100 active bg-danger text-white" id="ex1-tab-1" data-mdb-toggle="pill" href="#ex1-pills-1" role="tab" aria-controls="ex1-pills-1" aria-selected="true">Thông tin chi tiết sản phẩm</a>
                                    </li>
                                </ul>
                                <!-- Pills navs -->

                                <!-- Pills content -->
                                <div class="tab-content" id="ex1-content">
                                    <div class="tab-pane fade show active" id="ex1-pills-1" role="tabpanel" aria-labelledby="ex1-tab-1">
                                        <p>
                                            ${product.description}
                                        </p>
                                    </div>
                                </div>
                                <!-- Pills content -->
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="px-0 border rounded-2 shadow-0">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title">Sản phẩm cùng loại</h5>
                                        <c:forEach items="${sessionScope.recommnentProducts}" var="recommnentProduct">
                                            <div class="d-flex mb-3">
                                                <a href="#" class="me-3">
                                                    <div style="width: 96px; height: 96px; overflow: hidden;">
                                                        <img src="${recommnentProduct.image}" class="img-fluid" style="width: 100%; height: auto;" />
                                                    </div>
                                                </a>
                                                <div class="info">
                                                    <a href="detail?id=${recommnentProduct.id}" class="nav-link mb-1">
                                                        ${recommnentProduct.title}
                                                    </a>
                                                    <strong class="text-dark"><fmt:formatNumber value="${recommnentProduct.price}" type="number" pattern="#,##0"/>đ</strong>
                                                </div>
                                            </div>
                                        </c:forEach>

                                    </div>
                                </div>
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
