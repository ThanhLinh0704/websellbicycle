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

public class ManagementAccountServlet extends HttpServlet {

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

                AccountDAO accountDAO = new AccountDAO();
                List<Account> accounts = accountDAO.getAllInfomationAccount();
                int itemsPerPage = 10;
                int totalItems = accounts.size();
                int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);
                int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
                int begin = (currentPage - 1) * itemsPerPage;
                int end = Math.min(begin + itemsPerPage, totalItems);
                List<Account> pagedAccounts = accounts.subList(begin, end);

                request.setAttribute("pagedAccounts", pagedAccounts);
                request.setAttribute("totalPages", totalPages);
                session.setAttribute("accounts", accounts);
                request.getRequestDispatcher("/web/admin/ManagerAccount.jsp").forward(request, response);
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
