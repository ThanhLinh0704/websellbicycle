<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

            .search-bar input {
                font-size: 12px;
                padding: 5px;
            }

            .search-bar button {
                font-size: 12px;
                padding: 5px 10px;
            }

            .navmenu ul li a {
                font-size: 9px;
            }

        </style>

        <header id="header" class="header d-flex align-items-center sticky-top">
            <div class="container position-relative d-flex flex-column align-items-center">

                <div class="w-100 d-flex justify-content-center mb-3">
                    <form class="d-flex search-bar" action="productsearch" method="GET" style="width: 50%">
                        <input class="form-control me-2" type="search" name="search" placeholder="Tìm kiếm sản phẩn yêu thích của bạn tại đây" aria-label="Search" value="${sessionScope.search}">
                        <button class="btn btn-outline-danger" type="submit">Tìm kiếm</button>
                    </form>
                </div>

                <div class="d-flex align-items-center justify-content-between w-100">
                    <a href="wish" class="logo d-flex align-items-center me-auto me-xl-0">
                        <img src="assets/img/logo.png" alt="">
                        <h1 class="sitename">Wish</h1>
                        <span>.</span>
                    </a>

                    <nav id="navmenu" class="navmenu">
                        <ul>
                            <li><a href="categorysearch" class="${empty param.cid ? 'active' : ''}">TRANG CHỦ<br></a></li>
                                    <c:forEach items="${sessionScope.categorys}" var="category">
                                <li>
                                    <a href="categorysearch?cid=${category.cid}" class="${param.cid == category.cid ? 'active' : ''}">
                                        ${category.cname}<br>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                        <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
                    </nav>


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
                                    <li><a class="dropdown-item" href="logout">Đăng xuất</a></li>
                                </ul>
                            </div>
                        </c:otherwise>
                    </c:choose>

                </div>
            </div>
        </header>


        <main class="main">

            <!-- Menu Section -->
            <section id="menu" class="menu section">

                <!-- Section Title -->
                <div class="container section-title" data-aos="fade-up">
                    <p><span>Khám phá các sản phẩm của</span> <span class="description-title">Wish</span></p>
                </div><!-- End Section Title -->

                <div class="container">
                    <div class="tab-content" data-aos="fade-up" data-aos-delay="200">

                        <div class="tab-pane fade active show" id="menu-starters">

                            <div class="row gy-5">

                                <c:forEach items="${sessionScope.products}" var="product">
                                    <div class="col-lg-3 menu-item">
                                        <a href="${product.image}" class="glightbox">
                                            <div style="width: 100%; height: 200px; overflow: hidden;">
                                                <img src="${product.image}" class="menu-img img-fluid" alt=""
                                                     onerror="this.src='data:image/svg+xml,%3Csvg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 400 300%22%3E%3Crect width=%22400%22 height=%22300%22 fill=%22%23e0e0e0%22/%3E%3C/svg%3E';" 
                                                     style="width: 100%; height: auto;" />
                                            </div>
                                        </a>
                                        <a href="detail?id=${product.id}">
                                            <h4>${product.name}</h4>
                                        </a>
                                        <p class="ingredients">
                                            ${product.title}
                                        </p>
                                        <p class="price">
                                            ${product.price}
                                        </p>
                                    </div><!-- Menu Item -->
                                </c:forEach>

                            </div>
                        </div><!-- End Starter Menu Content -->
                    </div>
                </div>

            </section><!-- /Menu Section -->

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
