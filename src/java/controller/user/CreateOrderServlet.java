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
import java.util.Date;
import java.util.List;

public class CreateOrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        Account checkLoginAccount = (Account) session.getAttribute("account");
        if (checkLoginAccount == null) {
            response.sendRedirect("login");
        } else {

            String orderID = generateOrderID(checkLoginAccount.getId());
            int accountID = checkLoginAccount.getId();
            int statusID = Integer.parseInt(request.getParameter("paymentMethod"));
            double totalPrice = 0;
            java.sql.Date orderDate = new java.sql.Date(new Date(System.currentTimeMillis()).getTime());
            int paymentMethodID = Integer.parseInt(request.getParameter("paymentMethod"));
            String discountCode = request.getParameter("code");
            int discountCodeID = 0;//Giá trị mặc định update sau
            String note = request.getParameter("note");

            DiscountCodeDAO discountCodeDAO = new DiscountCodeDAO();
            if (discountCode != null) {
                discountCodeID = discountCodeDAO.getCodeID(discountCode);
            }

            List<OrderDetail> orderDetails = new ArrayList<>();
            List<ProductOrder> productOrders = (List<ProductOrder>) session.getAttribute("productOrders");

            for (ProductOrder productOrder : productOrders) {
                double priceChange = productOrder.getPrice() * productOrder.getQuantity();
                if (discountCode != null) {
                    double discountPercentage = discountCodeDAO.getDiscountPercentage(discountCode);
                    priceChange = priceChange - (priceChange * (discountPercentage / 100));
                    totalPrice += priceChange;
                } else {
                    totalPrice += priceChange;
                }
                orderDetails.add(new OrderDetail(orderID, productOrder.getId(), productOrder.getQuantity(), productOrder.getPrice(), priceChange));
            }

            OrderDAO orderDAO = new OrderDAO();
            ProductOrderDAO productOrderDAO = new ProductOrderDAO();

            orderDAO.addNewOrder(orderID, accountID, statusID, totalPrice, orderDate, paymentMethodID, discountCodeID, note, orderDetails);
            productOrderDAO.resetCartForUser(accountID);
            if (discountCode != null) {
                discountCodeDAO.useDiscountCode(discountCode);
            }
            ProductDAO productDAO = new ProductDAO();
            for (OrderDetail orderDetail : orderDetails) {
                productDAO.updateAmountOfProduct(orderDetail.getProductId(), orderDetail.getQuantity());
            }

            if (paymentMethodID == 2) {
                response.sendRedirect("order?status=each&statusId=2");
            } else {
                response.sendRedirect("order?status=each&statusId=1");
            }
        }
    }

    private String generateOrderID(int accountID) {
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyyMMddHHmmssSSS");
        String datePart = sdf.format(new java.util.Date());

        StringBuilder randomPart = new StringBuilder();
        for (int i = 0; i < 5; i++) {
            randomPart.append((int) (Math.random() * 10));
        }

        String orderID = "WISH" + accountID + datePart + randomPart;

        while (orderIDExists(orderID)) {
            randomPart.setLength(0);
            for (int i = 0; i < 5; i++) {
                randomPart.append((int) (Math.random() * 10));
            }
            orderID = "WISH" + accountID + datePart + randomPart;
        }

        return orderID;
    }

    private boolean orderIDExists(String orderID) {
        OrderDAO orderDAO = new OrderDAO();
        return orderDAO.orderIDExists(orderID);
    }

}
