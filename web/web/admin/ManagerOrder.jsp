<%@page import="entity.Order"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="apple-touch-icon" sizes="76x76" href="web/admin/assets/img/apple-icon.png">
        <link rel="icon" type="image/png" href="web/admin/assets/img/logo-ct-dark.png">
        <title>Quản lý</title>
        <!--     Fonts and icons     -->
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Inter:300,400,500,600,700,900" />
        <!-- Nucleo Icons -->
        <link href="web/admin/assets/css/nucleo-icons.css" rel="stylesheet" />
        <link href="web/admin/assets/css/nucleo-svg.css" rel="stylesheet" />
        <!-- Font Awesome Icons -->
        <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
        <!-- Material Icons -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@24,400,0,0" />
        <!-- CSS Files -->
        <link id="pagestyle" href="web/admin/assets/css/material-dashboard.css?v=3.2.0" rel="stylesheet" />
    </head>

    <body class="g-sidenav-show  bg-gray-100">
        <aside class="sidenav navbar navbar-vertical navbar-expand-xs border-radius-lg fixed-start ms-2  bg-white my-2" id="sidenav-main">
            <div class="sidenav-header">
                <i class="fas fa-times p-3 cursor-pointer text-dark opacity-5 position-absolute end-0 top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i>
                <a class="navbar-brand px-4 py-3 m-0" href="management">
                    <img src="web/admin/assets/img/logo-ct-dark.png" class="navbar-brand-img" width="26" height="26" alt="main_logo">
                    <span class="ms-1 text-sm text-dark">Wish</span>
                </a>
            </div>
            <hr class="horizontal dark mt-0 mb-2">
            <div class="collapse navbar-collapse  w-auto " id="sidenav-collapse-main">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="management">
                            <i class="material-symbols-rounded opacity-5">dashboard</i>
                            <span class="nav-link-text ms-1">Tổng quan</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active bg-gradient-dark text-white" href="managementorder">
                            <i class="material-symbols-rounded opacity-5">view_in_ar</i>
                            <span class="nav-link-text ms-1">Đơn hàng</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="managementnotification">
                            <i class="material-symbols-rounded opacity-5">notifications</i>
                            <span class="nav-link-text ms-1">Thông báo</span>
                        </a>
                    </li>
                    <li class="nav-item mt-3">
                        <h6 class="ps-4 ms-2 text-uppercase text-xs text-dark font-weight-bolder opacity-5">Quản lý</h6>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="managementproduct">
                            <i class="material-symbols-rounded opacity-5">bike_scooter</i>
                            <span class="nav-link-text ms-1">Quản lý sản phẩm</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="managementdiscountcode">
                            <i class="material-symbols-rounded opacity-5">local_offer</i>
                            <span class="nav-link-text ms-1">Quản lý khuyến mãi</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="managementaccount">
                            <i class="material-symbols-rounded opacity-5">person</i>
                            <span class="nav-link-text ms-1">Thông tin tài khoản</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="createaccount">
                            <i class="material-symbols-rounded opacity-5">login</i>
                            <span class="nav-link-text ms-1">Tạo tài khoản</span>
                        </a>
                    </li>
                </ul>
            </div>
        </aside>
        <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
            <!-- Navbar -->
            <nav class="navbar navbar-main navbar-expand-lg px-0 mx-3 shadow-none border-radius-xl" id="" data-scroll="true">
                <div class="container-fluid py-1 px-3">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
                            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="management">Wish</a></li>
                            <li class="breadcrumb-item text-sm text-dark active" aria-current="page"><a class="opacity-5 text-dark" href="managementproduct">Quản lý đơn hàng</a></li>
                        </ol>
                    </nav>
                    <ul class="navbar-nav d-flex align-items-center justify-content-end">
                        <li class="nav-item d-xl-none ps-3 d-flex align-items-center">
                            <a href="javascript:;" class="nav-link text-body p-0" id="iconNavbarSidenav">
                                <div class="sidenav-toggler-inner d-flex align-items-center">
                                    <i class="sidenav-toggler-line"></i>
                                    <i class="sidenav-toggler-line"></i>
                                    <i class="sidenav-toggler-line"></i>
                                </div>
                            </a>
                        </li>
                        <li class="nav-item px-3 d-flex align-items-center">
                            <a href="javascript:;" class="nav-link text-body p-0 d-flex align-items-center">
                                <i class="material-symbols-rounded fixed-plugin-button-nav">settings</i>
                            </a>
                        </li>
                        <li class="nav-item dropdown pe-3 d-flex align-items-center">
                            <a href="javascript:;" class="nav-link text-body p-0 d-flex align-items-center" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="material-symbols-rounded me-2">notifications</i>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end p-2" aria-labelledby="dropdownMenuButton">
                                <li>
                                    <a class="dropdown-item border-radius-md p-2" href="javascript:;">
                                        <h6 class="text-sm font-weight-normal mb-0 d-flex align-items-center">
                                            <i class="fa fa-clock me-1"></i>
                                            <span class="font-weight-bold">Hiện tại không có thông báo nào</span>
                                        </h6>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown pe-3 d-flex align-items-center">
                            <a href="javascript:;" class="nav-link text-body font-weight-bold px-0 d-flex align-items-center" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="material-symbols-rounded me-2">account_circle</i>
                                <span>Xin chào, ${sessionScope.user.name}</span>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end p-1" aria-labelledby="dropdownMenuButton">
                                <li>
                                    <a class="dropdown-item border-radius-md py-2 px-3 d-flex align-items-center" href="javascript:;">
                                        <i class="material-symbols-rounded opacity-5 me-2">info</i>
                                        <span class="font-weight-bold">Thông tin</span>
                                    </a>
                                </li>
                                <li>
                                    <a class="dropdown-item border-radius-md py-2 px-3 d-flex align-items-center" href="logoutmanager">
                                        <i class="material-symbols-rounded opacity-5 me-2">login</i>
                                        <span class="font-weight-bold">Đăng xuất</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
            <!-- End Navbar -->
            <div class="container-fluid py-2">
                <div class="row">
                    <div class="col-12">
                        <div class="card my-4">
                            <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                                <div class="bg-gradient-dark shadow-dark border-radius-lg pt-4 pb-3 d-flex align-items-center justify-content-between">
                                    <h6 class="text-white text-capitalize ps-3">Đơn hàng</h6>
                                    <div>
                                        <a href="managementorder?status=all" class="btn btn-secondary">Tất cả</a>
                                        <a href="managementorder?status=1" class="btn btn-dark">Đang xử lý</a>
                                        <a href="managementorder?status=2" class="btn btn-info">Xác nhận thanh toán</a>
                                        <a href="managementorder?status=3" class="btn btn-warning">Đang vận chuyển</a>
                                        <a href="managementorder?status=4" class="btn btn-success">Đã giao hàng</a>
                                        <a href="managementorder?status=5" class="btn btn-danger">Đã hủy</a>
                                    </div>
                                </div>
                            </div>

                            <div class="card-body px-0 pb-2">
                                <div class="table-responsive">
                                    <table class="table align-items-center mb-0">
                                        <thead>
                                            <tr>
                                                <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-20">Mã đơn hàng</th>
                                                <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-20 ps-1">ID tài khoản</th>
                                                <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-20">Mã giảm giá</th>
                                                <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-20">Tổng đơn hàng</th>
                                                <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-20">Thời gian đặt hàng</th>
                                                <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-20">Thời gian hoàn thành</th>
                                                <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-20">Phương thức thanh toán</th>
                                                <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-20">Tình trạng đơn hàng</th>
                                                <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-20">Chi tiết</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${pagedOrders}" var="order">
                                                <tr>
                                                    <td>
                                                        <div class="align-middle text-center text-sm">
                                                            <h6 class="mb-0 text-sm">${order.orderID}</h6>
                                                        </div>
                                                    </td>
                                                    <td class="align-middle text-center text-sm">
                                                        <span class="text-xs font-weight-bold">${order.accountID}</span>
                                                    </td>
                                                    <td class="align-middle text-center text-sm">
                                                        <span class="text-xs font-weight-bold">${order.code}</span>
                                                    </td>
                                                    <td class="align-middle text-center text-sm">
                                                        <span class="text-xs font-weight-bold"><fmt:formatNumber value="${order.totalPrice}" type="number" pattern="#,##0"/>đ</span>
                                                    </td>
                                                    <td class="align-middle text-center text-sm">
                                                        <span class="text-xs font-weight-bold">${order.orderDate}</span>
                                                    </td>
                                                    <td class="align-middle text-center text-sm">
                                                        <span class="text-xs font-weight-bold">${order.completedDate}</span>
                                                    </td>
                                                    <td class="align-middle text-center text-sm">
                                                        <span class="text-xs font-weight-bold">${order.methodName}</span>
                                                    </td>
                                                    <td class="align-middle text-center text-sm">
                                                        <c:choose>
                                                            <c:when test="${order.statusId == 1}">
                                                                <span class="badge badge-sm bg-gradient-dark">${order.statusName}</span>
                                                            </c:when>
                                                            <c:when test="${order.statusId == 2}">
                                                                <span class="badge badge-sm bg-gradient-info">${order.statusName}</span>
                                                            </c:when>
                                                            <c:when test="${order.statusId == 3}">
                                                                <span class="badge badge-sm bg-gradient-warning">${order.statusName}</span>
                                                            </c:when>
                                                            <c:when test="${order.statusId == 4}">
                                                                <span class="badge badge-sm bg-gradient-success">${order.statusName}</span>
                                                            </c:when>
                                                            <c:when test="${order.statusId == 5}">
                                                                <span class="badge badge-sm bg-gradient-danger">${order.statusName}</span>
                                                            </c:when>
                                                        </c:choose>
                                                    </td>
                                                    <td class="align-middle text-center text-sm">
                                                        <a href="managementorderdetail?orderID=${order.orderID}" class="text-xs font-weight-bold">Chi tiết</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <div class="pagination d-flex justify-content-center mt-3">
                                        <nav aria-label="Page navigation">
                                            <ul class="pagination">
                                                <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                                    <a class="page-link btn-danger" href="?page=${currentPage - 1}" aria-label="Previous">
                                                        <span aria-hidden="true">&laquo;</span>
                                                    </a>
                                                </li>
                                                <c:forEach begin="1" end="${totalPages}" var="pageNum">
                                                    <li class="page-item ${pageNum == currentPage ? 'active' : ''}">
                                                        <a class="page-link btn-danger" href="?page=${pageNum}">${pageNum}</a>
                                                    </li>
                                                </c:forEach>
                                                <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                                    <a class="page-link btn-danger" href="?page=${currentPage + 1}" aria-label="Next">
                                                        <span aria-hidden="true">&raquo;</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <footer class="footer py-4">
                    <div class="container-fluid">
                        <div class="row align-items-center justify-content-lg-between">
                            <div class="col-lg-6 mb-lg-0 mb-4">
                                <div class="copyright text-center text-sm text-muted text-lg-start">
                                    © <script>
                                        document.write(new Date().getFullYear())
                                    </script>,
                                    made with <i class="fa fa-heart"></i> by
                                    <a href="wish" class="font-weight-bold" target="_blank">Wish</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </main>
        <div class="fixed-plugin">
            <a class="fixed-plugin-button text-dark position-fixed px-3 py-2">
                <i class="material-symbols-rounded py-2">settings</i>
            </a>
            <div class="card shadow-lg">
                <div class="card-header pb-0 pt-3">
                    <div class="float-start">
                        <h5 class="mt-3 mb-0">Cài đặt giao diện</h5>
                    </div>
                    <div class="float-end mt-4">
                        <button class="btn btn-link text-dark p-0 fixed-plugin-close-button">
                            <i class="material-symbols-rounded">clear</i>
                        </button>
                    </div>
                    <!-- End Toggle Button -->
                </div>
                <hr class="horizontal dark my-1">
                <div class="card-body pt-sm-3 pt-0">
                    <!-- Sidebar Backgrounds -->
                    <div>
                        <h6 class="mb-0">Màu sắc thanh bên</h6>
                    </div>
                    <a href="javascript:void(0)" class="switch-trigger background-color">
                        <div class="badge-colors my-2 text-start">
                            <span class="badge filter bg-gradient-primary" data-color="primary" onclick="sidebarColor(this)"></span>
                            <span class="badge filter bg-gradient-dark active" data-color="dark" onclick="sidebarColor(this)"></span>
                            <span class="badge filter bg-gradient-info" data-color="info" onclick="sidebarColor(this)"></span>
                            <span class="badge filter bg-gradient-success" data-color="success" onclick="sidebarColor(this)"></span>
                            <span class="badge filter bg-gradient-warning" data-color="warning" onclick="sidebarColor(this)"></span>
                            <span class="badge filter bg-gradient-danger" data-color="danger" onclick="sidebarColor(this)"></span>
                        </div>
                    </a>
                    <!-- Sidenav Type -->
                    <div class="mt-3">
                        <h6 class="mb-0">Giao diện hiển thị</h6>
                        <p class="text-sm">Chọn giao diện phù hợp với bạn</p>
                    </div>
                    <div class="mt-3">
                        <p class="text-sm">Thanh bên</p>
                    </div>
                    <div class="d-flex">
                        <button class="btn bg-gradient-dark px-3 mb-2  active ms-2" data-class="bg-white" onclick="sidebarType(this)">Sáng</button>
                        <button class="btn bg-gradient-dark px-3 mb-2" data-class="bg-gradient-dark" onclick="sidebarType(this)">Tối</button>
                    </div>
                    <p class="text-sm d-xl-none d-block mt-2">You can change the sidenav type just on desktop view.</p>
                    <hr class="horizontal dark my-3">
                    <div class="mt-3">
                        <p class="text-sm">Trang tổng thể</p>
                    </div>
                    <div class="mt-2 d-flex">
                        <h6 class="mb-0">Sáng / Tối</h6>
                        <div class="form-check form-switch ps-0 ms-auto my-auto">
                            <input class="form-check-input mt-1 ms-auto" type="checkbox" id="dark-version" onclick="darkMode(this)">
                        </div>
                    </div>
                    <hr class="horizontal dark my-sm-4">
                </div>
            </div>
        </div>
        <!--   Core JS Files   -->
        <script src="web/admin/assets/js/core/popper.min.js"></script>
        <script src="web/admin/assets/js/core/bootstrap.min.js"></script>
        <script src="web/admin/assets/js/plugins/perfect-scrollbar.min.js"></script>
        <script src="web/admin/assets/js/plugins/smooth-scrollbar.min.js"></script>
        <script src="web/admin/assets/js/plugins/chartjs.min.js"></script>
        <script>
                                var ctx = document.getElementById("chart-bars").getContext("2d");

                                new Chart(ctx, {
                                    type: "bar",
                                    data: {
                                        labels: ["M", "T", "W", "T", "F", "S", "S"],
                                        datasets: [{
                                                label: "Views",
                                                tension: 0.4,
                                                borderWidth: 0,
                                                borderRadius: 4,
                                                borderSkipped: false,
                                                backgroundColor: "#43A047",
                                                data: [50, 45, 22, 28, 50, 60, 76],
                                                barThickness: 'flex'
                                            }]
                                    },
                                    options: {
                                        responsive: true,
                                        maintainAspectRatio: false,
                                        plugins: {
                                            legend: {
                                                display: false
                                            }
                                        },
                                        interaction: {
                                            intersect: false,
                                            mode: 'index'
                                        },
                                        scales: {
                                            y: {
                                                grid: {
                                                    drawBorder: false,
                                                    display: true,
                                                    drawOnChartArea: true,
                                                    drawTicks: false,
                                                    borderDash: [5, 5],
                                                    color: '#e5e5e5'
                                                },
                                                ticks: {
                                                    suggestedMin: 0,
                                                    suggestedMax: 500,
                                                    beginAtZero: true,
                                                    padding: 10,
                                                    font: {
                                                        size: 14,
                                                        lineHeight: 2
                                                    },
                                                    color: "#737373"
                                                }
                                            },
                                            x: {
                                                grid: {
                                                    drawBorder: false,
                                                    display: false,
                                                    drawOnChartArea: false,
                                                    drawTicks: false,
                                                    borderDash: [5, 5]
                                                },
                                                ticks: {
                                                    display: true,
                                                    color: '#737373',
                                                    padding: 10,
                                                    font: {
                                                        size: 14,
                                                        lineHeight: 2
                                                    }
                                                }
                                            }
                                        }
                                    }
                                });


                                var ctx2 = document.getElementById("chart-line").getContext("2d");

                                new Chart(ctx2, {
                                    type: "line",
                                    data: {
                                        labels: ["J", "F", "M", "A", "M", "J", "J", "A", "S", "O", "N", "D"],
                                        datasets: [{
                                                label: "Sales",
                                                tension: 0,
                                                borderWidth: 2,
                                                pointRadius: 3,
                                                pointBackgroundColor: "#43A047",
                                                pointBorderColor: "transparent",
                                                borderColor: "#43A047",
                                                backgroundColor: "transparent",
                                                fill: true,
                                                data: [120, 230, 130, 440, 250, 360, 270, 180, 90, 300, 310, 220],
                                                maxBarThickness: 6

                                            }]
                                    },
                                    options: {
                                        responsive: true,
                                        maintainAspectRatio: false,
                                        plugins: {
                                            legend: {
                                                display: false
                                            },
                                            tooltip: {
                                                callbacks: {
                                                    title: function (context) {
                                                        const fullMonths = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
                                                        return fullMonths[context[0].dataIndex];
                                                    }
                                                }
                                            }
                                        },
                                        interaction: {
                                            intersect: false,
                                            mode: 'index'
                                        },
                                        scales: {
                                            y: {
                                                grid: {
                                                    drawBorder: false,
                                                    display: true,
                                                    drawOnChartArea: true,
                                                    drawTicks: false,
                                                    borderDash: [4, 4],
                                                    color: '#e5e5e5'
                                                },
                                                ticks: {
                                                    display: true,
                                                    color: '#737373',
                                                    padding: 10,
                                                    font: {
                                                        size: 12,
                                                        lineHeight: 2
                                                    }
                                                }
                                            },
                                            x: {
                                                grid: {
                                                    drawBorder: false,
                                                    display: false,
                                                    drawOnChartArea: false,
                                                    drawTicks: false,
                                                    borderDash: [5, 5]
                                                },
                                                ticks: {
                                                    display: true,
                                                    color: '#737373',
                                                    padding: 10,
                                                    font: {
                                                        size: 12,
                                                        lineHeight: 2
                                                    }
                                                }
                                            }
                                        }
                                    }
                                });

                                var ctx3 = document.getElementById("chart-line-tasks").getContext("2d");

                                new Chart(ctx3, {
                                    type: "line",
                                    data: {
                                        labels: ["Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                                        datasets: [{
                                                label: "Tasks",
                                                tension: 0,
                                                borderWidth: 2,
                                                pointRadius: 3,
                                                pointBackgroundColor: "#43A047",
                                                pointBorderColor: "transparent",
                                                borderColor: "#43A047",
                                                backgroundColor: "transparent",
                                                fill: true,
                                                data: [50, 40, 300, 220, 500, 250, 400, 230, 500],
                                                maxBarThickness: 6

                                            }]
                                    },
                                    options: {
                                        responsive: true,
                                        maintainAspectRatio: false,
                                        plugins: {
                                            legend: {
                                                display: false
                                            }
                                        },
                                        interaction: {
                                            intersect: false,
                                            mode: 'index'
                                        },
                                        scales: {
                                            y: {
                                                grid: {
                                                    drawBorder: false,
                                                    display: true,
                                                    drawOnChartArea: true,
                                                    drawTicks: false,
                                                    borderDash: [4, 4],
                                                    color: '#e5e5e5'
                                                },
                                                ticks: {
                                                    display: true,
                                                    padding: 10,
                                                    color: '#737373',
                                                    font: {
                                                        size: 14,
                                                        lineHeight: 2
                                                    }
                                                }
                                            },
                                            x: {
                                                grid: {
                                                    drawBorder: false,
                                                    display: false,
                                                    drawOnChartArea: false,
                                                    drawTicks: false,
                                                    borderDash: [4, 4]
                                                },
                                                ticks: {
                                                    display: true,
                                                    color: '#737373',
                                                    padding: 10,
                                                    font: {
                                                        size: 14,
                                                        lineHeight: 2
                                                    }
                                                }
                                            }
                                        }
                                    }
                                });
        </script>
        <script>
            var win = navigator.platform.indexOf('Win') > -1;
            if (win && document.querySelector('#sidenav-scrollbar')) {
                var options = {
                    damping: '0.5'
                }
                Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
            }
        </script>
        <script src="web/admin/assets/js/material-dashboard.min.js?v=3.2.0"></script>
    </body>

</html>
