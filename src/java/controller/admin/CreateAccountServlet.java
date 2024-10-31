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

public class CreateAccountServlet extends HttpServlet {

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

                request.getRequestDispatcher("/web/admin/CreateAccount.jsp").forward(request, response);
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

        AccountDAO accountDAO = new AccountDAO();
        LoginDAO loginDAO = new LoginDAO();

        String username = request.getParameter("user");
        String password = request.getParameter("pass");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        Boolean gender = "male".equals(request.getParameter("gender"));
        boolean isSeller = "seller".equals(request.getParameter("rule"));

        try {

            java.sql.Date dob = java.sql.Date.valueOf(request.getParameter("dob"));

            Account accoutCheck = loginDAO.checkAccountExist(username);
            if (accoutCheck != null) {
                request.setAttribute("message", "Tài khoản này đã tồn tại");
                request.getRequestDispatcher("/web/admin/CreateAccount.jsp").forward(request, response);
                return;
            }

            accountDAO.createAccount(username, password, name, gender, dob, phone, address, isSeller);
            response.sendRedirect("managementaccount");

        } catch (IOException e) {
            request.setAttribute("message", "Thông tin đăng kí không hợp lệ! Vui lòng kiểm tra lại thông tin");
            request.getRequestDispatcher("/web/admin/CreateAccount.jsp").forward(request, response);
        }

    }

}
