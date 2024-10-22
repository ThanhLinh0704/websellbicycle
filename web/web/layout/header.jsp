<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<header id="header" class="header d-flex align-items-center sticky-top">
    <div class="container position-relative d-flex align-items-center justify-content-between">

        <a href="#" class="logo d-flex align-items-center me-auto me-xl-0">
            <!-- Uncomment the line below if you also wish to use an image logo -->
            <img src="assets/img/logo.png" alt="">
            <h1 class="sitename">Wish</h1>
            <span>.</span>
        </a>

        <nav id="navmenu" class="navmenu">
            <ul>
                <li><a href="#hero" class="active">Trang chủ<br></a></li>
                <li><a href="#about">Về chúng tôi</a></li>
                <li><a href="#menu">Sản phẩm mới</a></li>
                <li><a href="#testimonials">Đánh giá</a></li>
                <li><a href="#contact">Liên hệ</a></li>
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
                        Xin chào, ${sessionScope.account.user}!
                    </span>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <li><a class="dropdown-item" href="info">Thông tin</a></li>
                        <li><a class="dropdown-item" href="cart">Giỏ hàng</a></li>
                        <li><a class="dropdown-item" href="logout">Đăng xuất</a></li>
                    </ul>
                </div>
            </c:otherwise>

        </c:choose>

    </div>
</header>
