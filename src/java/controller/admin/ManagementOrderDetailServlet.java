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

public class ManagementOrderDetailServlet extends HttpServlet {

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
                String orderID = request.getParameter("orderID");
                UserDAO userDAO = new UserDAO();
                OrderDAO orderDAO = new OrderDAO();
                OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
                User user = userDAO.getInfomationUser(checkLoginAccount.getId());
                Order order = orderDAO.getOrderDetailByOrderId(orderID);
                List<OrderDetail> orderDetails = orderDetailDAO.getOrderDetailByOrderId(orderID);

                double total = 0;
                for (OrderDetail orderDetail : orderDetails) {
                    total += (orderDetail.getPrice() * orderDetail.getQuantity());
                }

                session.setAttribute("user", user);
                session.setAttribute("order", order);
                session.setAttribute("orderDetails", orderDetails);
                session.setAttribute("total", total);

                request.getRequestDispatcher("/web/admin/ManagerOrderDetail.jsp").forward(request, response);
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

    }

}
