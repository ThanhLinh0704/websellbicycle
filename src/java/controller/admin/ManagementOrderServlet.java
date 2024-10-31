package controller.admin;

import dao.*;
import entity.*;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

public class ManagementOrderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession();

        Account checkLoginAccount = (Account) session.getAttribute("account");
        if (checkLoginAccount == null) {
            response.sendRedirect("loginmanager");
        } else {

            if (checkLoginAccount.getIsAdmin() == 1 || checkLoginAccount.getIsSell() == 1) {

                OrderStatusDAO orderStatusDAO = new OrderStatusDAO();
                List<OrderStatus> orderStatuses = orderStatusDAO.getAllOrderStatus();

                String status = request.getParameter("status");
                List<Order> orders;

                if (status == null || status.equals("all")) {
                    OrderDAO orderDAO = new OrderDAO();
                    orders = orderDAO.getAllOrder();
                } else {
                    int statusId = Integer.parseInt(status);
                    OrderDAO orderDAO = new OrderDAO();
                    orders = orderDAO.getOrderByStatusId(statusId);
                }

                int itemsPerPage = 10;
                int totalItems = orders.size();
                int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);
                int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
                int begin = (currentPage - 1) * itemsPerPage;
                int end = Math.min(begin + itemsPerPage, totalItems);
                List<Order> pagedOrders = orders.subList(begin, end);

                request.setAttribute("pagedOrders", pagedOrders);
                request.setAttribute("totalPages", totalPages);
                request.setAttribute("currentPage", currentPage);
                request.getRequestDispatcher("/web/admin/ManagerOrder.jsp").forward(request, response);
            } else {
                response.sendRedirect("404");
            }

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String action = request.getParameter("action");
        String orderId = request.getParameter("orderId");
        OrderDAO orderDAO = new OrderDAO();
        int status = 0;

        if (action != null) {
            switch (action) {
                case "confirmPayment" -> {
                    status = 3;
                    orderDAO.updateOrderStatus(orderId, status);
                }
                case "cancelOrder" -> {
                    status = 5;
                    orderDAO.updateOrderStatus(orderId, status);
                }
            }
            response.sendRedirect("managementorder?status=" + status);
        }
    }

}
