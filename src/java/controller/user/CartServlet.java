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

public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession();
        ProductOrderDAO productOrderDAO = new ProductOrderDAO();

        Account checkLoginAccount = (Account) session.getAttribute("account");
        if (checkLoginAccount == null) {
            response.sendRedirect("login");
        } else {
            List<ProductOrder> productOrders = productOrderDAO.getAllProductOrder(checkLoginAccount.getId());
            
            double sumOffAll = 0;
            for (ProductOrder productOrder : productOrders) {
                sumOffAll += productOrder.getPrice() * productOrder.getQuantity();
            }
            
            session.setAttribute("sumOffAll", sumOffAll);
            session.setAttribute("productOrders", productOrders);
            request.getRequestDispatcher("web/cart/cart.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        request.getRequestDispatcher("web/cart/cart.jsp").forward(request, response);

    }

}
