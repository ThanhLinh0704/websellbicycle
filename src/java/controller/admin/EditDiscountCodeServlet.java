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

public class EditDiscountCodeServlet extends HttpServlet {

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

                String code = request.getParameter("code");
                DiscountCodeDAO discountCodeDAO = new DiscountCodeDAO();
                DiscountCode discountCode = discountCodeDAO.getDiscountCodeByCode(code);

                request.setAttribute("discountCode", discountCode);
                request.getRequestDispatcher("/web/admin/EditDiscountCode.jsp").forward(request, response);
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

        HttpSession session = request.getSession();

        Account checkLoginAccount = (Account) session.getAttribute("account");
        if (checkLoginAccount == null) {
            response.sendRedirect("loginmanager");
        } else {

            if (checkLoginAccount.getIsAdmin() == 1) {
                String code = request.getParameter("name");
                int amount = Integer.parseInt(request.getParameter("amount"));
                java.sql.Date expiry = java.sql.Date.valueOf(request.getParameter("expiry"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                boolean isActive = request.getParameter("status").equals("active");

                DiscountCodeDAO discountCodeDAO = new DiscountCodeDAO();
                DiscountCode discountCode = new DiscountCode();
                discountCode.setCode(code);
                discountCode.setDiscountPercentage(amount);
                discountCode.setExpiryDate(expiry);
                discountCode.setAmount(quantity);
                discountCode.setIsActive(isActive);
                discountCodeDAO.updateDiscountCode(discountCode);
                response.sendRedirect("managementdiscountcode");

            } else {
                response.sendRedirect("404");
            }

        }
    }

}
