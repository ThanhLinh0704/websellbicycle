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

public class ManagementProductDetailServlet extends HttpServlet {

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
                int pid = Integer.parseInt(request.getParameter("id"));
                ProductManagerDAO productManagerDAO = new ProductManagerDAO();
                CategoryDAO categoryDAO = new CategoryDAO();
                UserDAO userDAO = new UserDAO();
                ProductManager productManager = productManagerDAO.getProductManagerByPid(pid);
                List<Category> categorys = categoryDAO.getAllCategory();
                User user = userDAO.getInfomationUser(checkLoginAccount.getId());

                session.setAttribute("productManager", productManager);
                session.setAttribute("categorys", categorys);
                session.setAttribute("user", user);
                request.getRequestDispatcher("/web/admin/ManagerProductDetail.jsp").forward(request, response);
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
