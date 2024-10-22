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

        <header id="header" class="header d-flex align-items-center sticky-top">
            <div class="container position-relative d-flex align-items-center justify-content-between">

                <a href="wish" class="logo d-flex align-items-center me-auto me-xl-0">
                    <!-- Uncomment the line below if you also wish to use an image logo -->
                    <img src="assets/img/logo.png" alt="">
                    <h1 class="sitename">Wish</h1>
                    <span>.</span>
                </a>

                <nav id="navmenu" class="navmenu">
                    <ul>
                        <li><a href="wish" class="active">Trang chủ<br></a></li>
                    </ul>
                    <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
                </nav>
            </div>
        </header>

        <main class="main">
            <section class="p-3 p-md-4 p-xl-5" style="background-color: #f0f0f0">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-12 col-md-9 col-lg-7 col-xl-6 col-xxl-5">
                            <div class="card border-0 shadow-sm rounded-4">
                                <div class="card-body p-3 p-md-4 p-xl-5">
                                    <div class="row" style="text-align: center">
                                        <div class="col-12">
                                            <div class="mb-5">
                                                <h3>ĐĂNG KÍ</h3>
                                            </div>
                                        </div>
                                    </div>
                                    <form action="register" method="POST">
                                        <div class="row gy-3 overflow-hidden">
                                            <c:if test="${not empty sessionScope.message}">
                                                <div class="col-12">
                                                    <div style="border: 2px solid #ffc107; background-color: #fff8e1; color: black; padding: 10px; border-radius: 5px;">
                                                        <label>${sessionScope.message}</label>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </div>
                                        </br>
                                        <div class="col-12">
                                            <div class="form-floating mb-3">
                                                <input type="text" class="form-control" name="user" id="username" placeholder="" required value="${sessionScope.user}">
                                                <label for="username" class="form-label">Tài khoản</label>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-floating mb-3">
                                                <input type="password" class="form-control" name="pass" id="password" placeholder="Password" required value="${sessionScope.pass}">
                                                <label for="password" class="form-label">Mật khẩu</label>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-floating mb-3">
                                                <input type="password" class="form-control" name="passCheck" id="confirmPassword" placeholder="Password" required>
                                                <label for="confirmPassword" class="form-label">Xác nhận mật khẩu</label>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-floating mb-3">
                                                <input type="text" class="form-control" name="name" id="name" placeholder="" required value="${sessionScope.name}">
                                                <label for="name" class="form-label">Tên của bạn</label>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-floating mb-3">
                                                <input type="date" class="form-control" name="dob" id="dob" required value="${sessionScope.dob}">
                                                <label for="dob" class="form-label">Ngày tháng năm sinh</label>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-floating mb-3">
                                                <input type="text" class="form-control" name="phone" id="phone" placeholder="" required pattern="\d{9,11}" value="${sessionScope.phone}">
                                                <label for="phone" class="form-label">Số điện thoại</label>

                                            </div>
                                            <div class="col-md-6 mb-4">
                                                <h6 class="mb-2 pb-1" style="font-family: sans-serif">Giới tính </h6>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="gender" id="maleGender" value="male" ${requestScope.gender == null || requestScope.gender == 'male' ? 'checked' : ''}/>
                                                    <label class="form-check-label" for="maleGender">Nam</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="gender" id="femaleGender" value="female" ${requestScope.gender == 'female' ? 'checked' : ''}/>
                                                    <label class="form-check-label" for="femaleGender">Nữ</label>
                                                </div>
                                            </div>

                                            <div class="col-12">
                                                <div class="d-grid">
                                                    <button class="btn bsb-btn-2xl btn-danger" type="submit">Đăng kí</button>
                                                </div>
                                            </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>

        <jsp:include page="layout/footer.jsp"></jsp:include>

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
