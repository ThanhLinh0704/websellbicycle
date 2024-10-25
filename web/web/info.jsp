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
            body{
                background:#eee;
            }

            .card {
                box-shadow: 0 20px 27px 0 rgb(0 0 0 / 5%);
            }

            .card {
                position: relative;
                display: flex;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: #fff;
                background-clip: border-box;
                border: 0 solid rgba(0,0,0,.125);
                border-radius: 1rem;
            }

            .card-body {
                -webkit-box-flex: 1;
                -ms-flex: 1 1 auto;
                flex: 1 1 auto;
                padding: 1.5rem 1.5rem;
            }
        </style>

        <jsp:include page="layout/header.jsp"></jsp:include>

            <main class="main">

                <div class="container-fluid">

                    <div class="container">
                        <form action="updateinformationuser" method="GET">
                            <!-- Title -->
                            <div class="d-flex justify-content-between align-items-lg-center py-3 flex-column flex-lg-row">
                                <h2 class="h5 mb-3 mb-lg-0"><a href="wish" class="text-muted"><i class="bi bi-arrow-left-square me-2"></i></a> Quay trở lại trang chủ</h2>
                                <div class="hstack gap-3">
                                    <button type="submit" class="btn btn-danger btn-sm btn-icon-text"><i class="bi bi-save"></i> <span class="text">Lưu thông tin</span></button>
                                </div>
                            </div>

                            <!-- Main content -->
                            <div class="row">
                                <!-- Left side -->
                                <div class="col-lg-8">
                                    <!-- Basic information -->
                                    <div class="card mb-4">
                                        <div class="card-body">
                                            <h3 class="h6 mb-4">Thông tin cơ bản</h3>
                                            <div>
                                            <c:if test="${not empty requestScope.error}">
                                                <strong style="color: red">${requestScope.error}</strong>
                                            </c:if>
                                            <c:if test="${not empty requestScope.success}">
                                                <strong style="color: green">${requestScope.success}</strong>
                                            </c:if>
                                        </div>
                                        </br>
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Tên của bạn</label>
                                                    <input type="text" class="form-control" value="${user.name}" name="name">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Ngày tháng năm sinh</label>
                                                    <input type="date" class="form-control" name="dob" value="${user.dob}">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Số điện thoại</label>
                                                    <input type="text" class="form-control" value="${user.phone}" name="phone" maxlength="11">
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <h6 class="mb-3" style="font-family: sans-serif">Giới tính </h6>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="gender" id="maleGender" value="male" ${sessionScope.gender == null || sessionScope.gender == 'true' ? 'checked' : ''}/>
                                                    <label class="form-check-label" for="maleGender">Nam</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="gender" id="femaleGender" value="female" ${sessionScope.gender == 'false' ? 'checked' : ''}/>
                                                    <label class="form-check-label" for="femaleGender">Nữ</label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <div class="mb-3">
                                                        <label class="form-label">Tài khoản</label>
                                                        <input type="text" class="form-control" value="${account.user}" readonly>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="mb-3">
                                                        <label class="form-label">Mật khẩu</label>
                                                        <input type="password" class="form-control" value="${account.pass}" readonly>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <!-- Address -->
                                <div class="card mb-4">
                                    <div class="card-body">
                                        <h3 class="h6 mb-4">Địa chỉ</h3>
                                        <div class="mb-3">
                                            <label class="form-label">Địa chỉ nhà</label>
                                            <input type="text" class="form-control" name="address" value="${user.address}">
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </form>
                    <!-- Right side -->
                    <div class="col-lg-4">
                        <!-- Status -->
                        <form action="changepassuser" method="GET">
                            <div class="card mb-4">
                                <div class="card-body">
                                    <h3 class="h6">Đổi mật khẩu</h3>
                                    <div class="mb-3">
                                        <c:if test="${not empty requestScope.notificationError}">
                                            <strong><label class="form-label text-danger">${requestScope.notificationError}</label></strong>
                                            </c:if>

                                        <c:if test="${not empty requestScope.notificationSuccess}">
                                            <strong><label class="form-label text-success">${requestScope.notificationSuccess}</label></strong>
                                            </c:if>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Mật khẩu cũ</label>
                                        <input type="password" name="oddPass" class="form-control" required>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Mật khẩu mới</label>
                                        <input type="password" name="newPass" class="form-control" required>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Xác nhận mật khẩu mới</label>
                                        <input type="password" name="confirmPass" class="form-control" required>
                                    </div>
                                    <div class="d-grid">
                                        <button type="submit" class="btn btn-danger">Xác nhận</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>

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
