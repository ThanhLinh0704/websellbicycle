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

public class UpdateQuantityProductOrderServlet extends HttpServlet {

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

            int productId = Integer.parseInt(request.getParameter("productId"));
            String action = request.getParameter("action");
            int quantity;

            if ("increase".equals(action)) {
                quantity = 1;
                productOrderDAO.addProductOrder(checkLoginAccount.getId(), productId, quantity);
            } else if ("decrease".equals(action)) {
                quantity = -1;
                productOrderDAO.addProductOrder(checkLoginAccount.getId(), productId, quantity);
            } else {
                productOrderDAO.deleteProduct(checkLoginAccount.getId(), productId);
                quantity = Integer.parseInt(request.getParameter("quantity"));
                if (quantity > 0) {
                    productOrderDAO.addProductOrder(checkLoginAccount.getId(), productId, quantity);
                }
            }

            response.sendRedirect("cart");

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
