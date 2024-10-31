package controller.user;

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

public class OrderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession();

        Account checkLoginAccount = (Account) session.getAttribute("account");
        if (checkLoginAccount == null) {
            response.sendRedirect("login");
        } else {
            OrderStatusDAO orderStatusDAO = new OrderStatusDAO();
            List<OrderStatus> orderStatuses = orderStatusDAO.getAllOrderStatus();

            String status = request.getParameter("status");
            List<Order> orders;

            if (status == null || status.equals("all")) {
                OrderDAO orderDAO = new OrderDAO();
                orders = orderDAO.getAllOrderUser(checkLoginAccount.getId());
            } else {
                int statusId = Integer.parseInt(request.getParameter("statusId"));
                OrderDAO orderDAO = new OrderDAO();
                orders = orderDAO.getOrderUserByStatusId(checkLoginAccount.getId(), statusId);
            }

            session.setAttribute("orders", orders);
            session.setAttribute("orderStatuses", orderStatuses);
            request.getRequestDispatcher("web/order/Order.jsp").forward(request, response);
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
                    status = 2;
                    orderDAO.updateOrderStatus(orderId, status);
                }
                case "markReceived" -> {
                    status = 4;
                    orderDAO.updateOrderStatus(orderId, status);
                }
                case "cancelOrder" -> {
                    status = 5;
                    orderDAO.updateOrderStatus(orderId, status);
                }
            }
            response.sendRedirect("order?status=each&statusId=" + status);
        }
    }

}
