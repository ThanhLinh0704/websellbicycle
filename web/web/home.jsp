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

        <jsp:include page="layout/header.jsp"></jsp:include>

            <main class="main">

                <!-- Hero Section -->
                <section id="hero" class="hero section light-background">

                    <div class="container">
                        <div class="row gy-4 justify-content-center justify-content-lg-between">
                            <div class="col-lg-5 order-2 order-lg-1 d-flex flex-column justify-content-center">
                                <h1 data-aos="fade-up">Hãy tận hưởng những chuyến phiêu lưu</h1>
                                <p data-aos="fade-up" data-aos-delay="100">Sứ mệnh của chúng tôi là đưa đến những chiếc xe đạp tốt nhất đến người tiêu dùng</p>
                                <div class="d-flex" data-aos="fade-up" data-aos-delay="200">
                                    <a href="product" class="btn-get-started">Tìm hiểu thêm</a>
                                </div>
                            </div>
                            <div class="col-lg-5 order-1 order-lg-2 hero-img" data-aos="zoom-out">
                                <img src="assets/img/header-img.png" class="img-fluid animated" alt="">
                            </div>
                        </div>
                    </div>

                </section><!-- /Hero Section -->

                <!-- About Section -->
                <section id="about" class="about section">

                    <!-- Section Title -->
                    <div class="container section-title" data-aos="fade-up">
                        <h2>Về chúng tôi<br></h2>
                        <p><span>Giới thiệu về </span> <span class="description-title">Wish</span></p>
                    </div><!-- End Section Title -->

                    <div class="container">

                        <div class="row gy-4">
                            <div class="col-lg-7" data-aos="fade-up" data-aos-delay="100">
                                <img src="assets/img/about.jpg" class="img-fluid mb-4" alt="">
                                <div class="book-a-table">
                                    <h3>Thông tin chi tiết liên hệ đến email</h3>
                                    <p>wish@gmail.com</p>
                                </div>
                            </div>
                            <div class="col-lg-5" data-aos="fade-up" data-aos-delay="250">
                                <div class="content ps-0 ps-lg-5">
                                    <p class="fst-italic">
                                        Tại Wish, chúng tôi không chỉ bán xe đạp; chúng tôi tạo ra những trải nghiệm sống động và đầy cảm hứng. Được thành lập với sứ mệnh mang lại giải pháp di chuyển xanh và lành mạnh, chúng tôi cam kết cung cấp những chiếc xe đạp tiêu chuẩn chất lượng cao nhất.
                                    </p>
                                    <ul>
                                        <li><i class="bi bi-check-circle-fill"></i> <span>Những chiếc xe đạp bền bỉ và an toàn từ các thương hiệu hàng đầu.</span></li>
                                        <li><i class="bi bi-check-circle-fill"></i> <span>Đội ngũ nhân viên tận tâm, sẵn sàng tư vấn và hỗ trợ bạn.</span></li>
                                        <li><i class="bi bi-check-circle-fill"></i> <span>Cam kết bảo vệ môi trường với các sản phẩm thân thiện và tiết kiệm năng lượng.</span></li>
                                    </ul>
                                    <p>
                                        Hãy cùng chúng tôi khám phá thế giới xe đạp, nơi mà sự tự do, sức khỏe và niềm vui di chuyển được kết nối. Cảm ơn bạn đã lựa chọn Wish làm điểm đến cho hành trình đạp xe của mình!
                                    </p>

                                    <div class="position-relative mt-4">
                                        <img src="assets/img/about-2.jpg" class="img-fluid" alt="">
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>

                </section><!-- /About Section -->

                <!-- Menu Section -->
                <section id="menu" class="menu section">

                    <!-- Section Title -->
                    <div class="container section-title" data-aos="fade-up">
                        <p><span>Khám phá các sản phẩm mới nhất của</span> <span class="description-title">Wish</span></p>
                    </div><!-- End Section Title -->

                    <div class="container">
                        <div class="tab-content" data-aos="fade-up" data-aos-delay="200">

                            <div class="tab-pane fade active show" id="menu-starters">

                                <div class="row gy-5">

                                <c:forEach items="${sessionScope.products}" var="product">
                                    <div class="col-lg-4 menu-item">
                                        <a href="${product.image}" class="glightbox">
                                            <div style="width: 100%; height: 200px; overflow: hidden;">
                                                <img src="${product.image}" class="menu-img img-fluid" alt="" 
                                                     onerror="this.src='data:image/svg+xml,%3Csvg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 400 300%22%3E%3Crect width=%22400%22 height=%22300%22 fill=%22%23e0e0e0%22/%3E%3C/svg%3E';"
                                                     style="width: 100%; height: 100%; object-fit: cover;" />
                                            </div>
                                        </a>
                                        <h4><a href="detail?id=${product.id}">${product.name}</a></h4>
                                        <p class="ingredients">
                                            ${product.title}
                                        </p>
                                        <p class="price">
                                            <fmt:formatNumber value="${product.price}" type="number" pattern="#,##0"/>đ
                                        </p>
                                    </div><!-- Menu Item -->
                                </c:forEach>

                            </div>
                        </div><!-- End Starter Menu Content -->
                    </div>
                </div>

            </section><!-- /Menu Section -->

            <!-- Testimonials Section -->
            <section id="testimonials" class="testimonials section light-background">

                <!-- Testimonials Section -->
                <section id="testimonials" class="testimonials section light-background">

                    <!-- Section Title -->
                    <div class="container section-title" data-aos="fade-up">
                        <h2>ĐÁNH GIÁ</h2>
                        <p>Họ đã nói về <span class="description-title">Wish</span> như thế nào</p>
                    </div><!-- End Section Title -->

                    <div class="container" data-aos="fade-up" data-aos-delay="100">

                        <div class="swiper init-swiper">
                            <script type="application/json" class="swiper-config">
                                {
                                "loop": true,
                                "speed": 600,
                                "autoplay": {
                                "delay": 5000
                                },
                                "slidesPerView": "auto",
                                "pagination": {
                                "el": ".swiper-pagination",
                                "type": "bullets",
                                "clickable": true
                                }
                                }
                            </script>
                            <div class="swiper-wrapper">

                                <div class="swiper-slide">
                                    <div class="testimonial-item">
                                        <div class="row gy-4 justify-content-center">
                                            <div class="col-lg-6">
                                                <div class="testimonial-content">
                                                    <p>
                                                        <i class="bi bi-quote quote-icon-left"></i>
                                                        <span>Tôi đã trải nghiệm chiếc xe đạp từ Wish và phải nói rằng đây là một sản phẩm tuyệt vời. Xe chạy rất mượt mà, khung xe chắc chắn, và cảm giác lái rất thoải mái. Tôi đã sử dụng xe cho cả việc đi làm và thư giãn vào cuối tuần, và nó luôn đáp ứng tốt. Thực sự là một khoản đầu tư xứng đáng!</span>
                                                        <i class="bi bi-quote quote-icon-right"></i>
                                                    </p>
                                                    <h3>Nguyễn Văn A</h3>
                                                    <h4>Khách hàng</h4>
                                                    <div class="stars">
                                                        <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 text-center">
                                                <img src="assets/img/testimonials/testimonials-1.jpg" class="img-fluid testimonial-img" alt="">
                                            </div>
                                        </div>
                                    </div>
                                </div><!-- End testimonial item -->

                                <div class="swiper-slide">
                                    <div class="testimonial-item">
                                        <div class="row gy-4 justify-content-center">
                                            <div class="col-lg-6">
                                                <div class="testimonial-content">
                                                    <p>
                                                        <i class="bi bi-quote quote-icon-left"></i>
                                                        <span>Chiếc xe đạp tôi mua từ Wish thực sự đã thay đổi cách tôi di chuyển hàng ngày. Không chỉ tiện lợi mà còn rất thời trang. Tôi thường xuyên nhận được những lời khen từ bạn bè về thiết kế và màu sắc của xe. Rất khuyến khích những ai đang tìm kiếm một chiếc xe đạp chất lượng và phong cách!</span>
                                                        <i class="bi bi-quote quote-icon-right"></i>
                                                    </p>
                                                    <h3>Trần Thị B</h3>
                                                    <h4>Khách hàng</hàng>
                                                        <div class="stars">
                                                            <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                                                        </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 text-center">
                                                <img src="assets/img/testimonials/testimonials-2.jpg" class="img-fluid testimonial-img" alt="">
                                            </div>
                                        </div>
                                    </div>
                                </div><!-- End testimonial item -->

                                <div class="swiper-slide">
                                    <div class="testimonial-item">
                                        <div class="row gy-4 justify-content-center">
                                            <div class="col-lg-6">
                                                <div class="testimonial-content">
                                                    <p>
                                                        <i class="bi bi-quote quote-icon-left"></i>
                                                        <span>Đội ngũ hỗ trợ khách hàng của Wish rất tận tình. Khi tôi gặp vấn đề về bảo trì xe, họ đã phản hồi rất nhanh chóng và hướng dẫn tôi tận tình. Điều này khiến tôi cảm thấy yên tâm hơn khi sử dụng sản phẩm của họ. Một trải nghiệm tuyệt vời!</span>
                                                        <i class="bi bi-quote quote-icon-right"></i>
                                                    </p>
                                                    <h3>Phạm Văn C</h3>
                                                    <h4>Khách hàng</h4>
                                                    <div class="stars">
                                                        <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 text-center">
                                                <img src="assets/img/testimonials/testimonials-3.jpg" class="img-fluid testimonial-img" alt="">
                                            </div>
                                        </div>
                                    </div>
                                </div><!-- End testimonial item -->

                                <div class="swiper-slide">
                                    <div class="testimonial-item">
                                        <div class="row gy-4 justify-content-center">
                                            <div class="col-lg-6">
                                                <div class="testimonial-content">
                                                    <p>
                                                        <i class="bi bi-quote quote-icon-left"></i>
                                                        <span>Xe đạp từ Wish không chỉ đẹp mà còn rất bền. Tôi đã sử dụng xe trong suốt mùa hè này, và nó vẫn như mới. Chất lượng vượt trội so với giá cả. Tôi sẽ chắc chắn giới thiệu cho bạn bè và gia đình của mình!</span>
                                                        <i class="bi bi-quote quote-icon-right"></i>
                                                    </p>
                                                    <h3>Lê Văn D</h3>
                                                    <h4>Khách hàng</h4>
                                                    <div class="stars">
                                                        <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 text-center">
                                                <img src="assets/img/testimonials/testimonials-4.jpg" class="img-fluid testimonial-img" alt="">
                                            </div>
                                        </div>
                                    </div>
                                </div><!-- End testimonial item -->

                            </div>
                            <div class="swiper-pagination"></div>
                        </div>

                    </div>

                </section><!-- /Testimonials Section -->

                <!-- Contact Section -->
                <section id="contact" class="contact section">

                    <!-- Section Title -->
                    <div class="container section-title" data-aos="fade-up">
                        <h2>Liên hệ</h2>
                        <p><span>Bạn cần hỗ trợ? </span> <span class="description-title">Hãy liên hệ với chúng tôi</span></p>
                    </div><!-- End Section Title -->

                    <div class="container" data-aos="fade-up" data-aos-delay="100">

                        <div class="mb-5">
                            <iframe style="width: 100%; height: 400px;" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4395.704411272685!2d105.52319011351781!3d21.012511527218305!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135abc60e7d3f19%3A0x2be9d7d0b5abcbf4!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBGUFQgSMOgIE7hu5lp!5e1!3m2!1svi!2s!4v1729677447161!5m2!1svi!2s" frameborder="0" allowfullscreen=""></iframe>
                        </div><!-- End Google Maps -->

                        <div class="row gy-4">

                            <div class="col-md-6">
                                <div class="info-item d-flex align-items-center" data-aos="fade-up" data-aos-delay="200">
                                    <i class="icon bi bi-geo-alt flex-shrink-0"></i>
                                    <div>
                                        <h3>Địa chỉ</h3>
                                        <p>Đối diện Trường Đại học FPT Hà Nội, Khu Công Nghệ Cao Hòa Lạc, km 29, Đại lộ, Thăng Long, Hà Nội</p>
                                    </div>
                                </div>
                            </div><!-- End Info Item -->

                            <div class="col-md-6">
                                <div class="info-item d-flex align-items-center" data-aos="fade-up" data-aos-delay="300">
                                    <i class="icon bi bi-telephone flex-shrink-0"></i>
                                    <div>
                                        <h3>Liên hệ với chúng tôi</h3>
                                        <p>+84 966799099</p>
                                    </div>
                                </div>
                            </div><!-- End Info Item -->

                            <div class="col-md-6">
                                <div class="info-item d-flex align-items-center" data-aos="fade-up" data-aos-delay="400">
                                    <i class="icon bi bi-envelope flex-shrink-0"></i>
                                    <div>
                                        <h3>Email</h3>
                                        <p>wish@gmail.com</p>
                                    </div>
                                </div>
                            </div><!-- End Info Item -->

                            <div class="col-md-6">
                                <div class="info-item d-flex align-items-center" data-aos="fade-up" data-aos-delay="500">
                                    <i class="icon bi bi-clock flex-shrink-0"></i>
                                    <div>
                                        <h3>Thời gian hoạt động<br></h3>
                                        <p><strong>Từ thứ 2 đến thứ 7:</strong> 7AM - 20PM</p>
                                    </div>
                                </div>
                            </div><!-- End Info Item -->

                        </div>

                        <form action="forms/contact.php" method="post" class="php-email-form" data-aos="fade-up" data-aos-delay="600">
                            <div class="row gy-4">

                                <div class="col-md-6">
                                    <input type="text" name="name" class="form-control" placeholder="Tên của bạn" required="">
                                </div>

                                <div class="col-md-6 ">
                                    <input type="email" class="form-control" name="email" placeholder="Email của bạn" required="">
                                </div>

                                <div class="col-md-12">
                                    <input type="text" class="form-control" name="subject" placeholder="Tiêu đề chính" required="">
                                </div>

                                <div class="col-md-12">
                                    <textarea class="form-control" name="message" rows="6" placeholder="Nội dung" required=""></textarea>
                                </div>

                                <div class="col-md-12 text-center">
                                    <div class="loading">Đang gửi</div>
                                    <div class="error-message"></div>
                                    <div class="sent-message">Cảm ơn bạn đã gửi phản hồi cho chúng tôi</div>

                                    <button type="submit">Gửi tin nhắn</button>
                                </div>

                            </div>
                        </form><!-- End Contact Form -->

                    </div>

                </section><!-- /Contact Section -->

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
