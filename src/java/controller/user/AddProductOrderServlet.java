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

public class AddProductOrderServlet extends HttpServlet {
    
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
            
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int productId = Integer.parseInt(request.getParameter("id"));
            String action = request.getParameter("action");
            
            if ("addToCart".equals(action)) {
                productOrderDAO.addProductOrder(checkLoginAccount.getId(), productId, quantity);
                response.sendRedirect("cart");
            } else if ("buyNow".equals(action)) {
                productOrderDAO.addProductOrder(checkLoginAccount.getId(), productId, quantity);
                response.sendRedirect("confirmcart?action=buyNow&pid=" + productId);
            } else {
                request.setAttribute("error", "Lỗi khi truy xuất chức năng hệ thống");
                response.sendRedirect("detail");
            }
            
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
