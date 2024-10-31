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
import java.util.ArrayList;
import java.util.List;

public class ConfirmCartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession();
        ProductOrderDAO productOrderDAO = new ProductOrderDAO();
        PaymentMethodDAO paymentMethodDAO = new PaymentMethodDAO();
        List<PaymentMethod> paymentMethods = paymentMethodDAO.getAllPaymentMethod();

        Account checkLoginAccount = (Account) session.getAttribute("account");
        if (checkLoginAccount == null) {
            response.sendRedirect("login");
        } else {

            UserDAO userDAO = new UserDAO();
            User user = userDAO.getInfomationUser(checkLoginAccount.getId());

            String action = request.getParameter("action");
            List<ProductOrder> productOrders;

            String discountCode = request.getParameter("discountCode");
            double discountAmount = 0;
            boolean isValidCode = true;

            if (discountCode != null && !discountCode.isEmpty()) {
                DiscountCodeDAO discountCodeDAO = new DiscountCodeDAO();
                isValidCode = discountCodeDAO.checkDiscountCodeByCode(discountCode);

                if (isValidCode) {
                    discountAmount = discountCodeDAO.getDiscountPercentage(discountCode);
                } else {
                    request.setAttribute("error", "mã giảm giá không hợp lệ");
                    isValidCode = false;
                }
            }

            productOrders = (List<ProductOrder>) session.getAttribute("productOrders");

            if ("buyNow".equals(action)) {
                int pid = Integer.parseInt(request.getParameter("pid"));
                ProductOrder productOrder = productOrderDAO.getTheReleaseProductOrder(pid);
                productOrders = new ArrayList<>();
                productOrders.add(productOrder);

            } else {
                if (productOrders == null) {
                    productOrders = productOrderDAO.getAllProductOrder(checkLoginAccount.getId());
                }
            }

            double sumOffAll = 0;
            for (ProductOrder productOrder : productOrders) {
                sumOffAll += productOrder.getPrice() * productOrder.getQuantity();
            }

            if (isValidCode) {
                double sum = sumOffAll;
                sumOffAll = sumOffAll - (sumOffAll * (discountAmount / 100));
                request.setAttribute("sum", sum);
                request.setAttribute("discountCode", discountCode);
            }

            session.setAttribute("user", user);
            session.setAttribute("sumOffAll", sumOffAll);
            session.setAttribute("productOrders", productOrders);
            session.setAttribute("paymentMethods", paymentMethods);
            request.getRequestDispatcher("web/cart/confirmcart.jsp").forward(request, response);

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        request.getRequestDispatcher("web/cart/confirmcart.jsp").forward(request, response);

    }

}
