package controller;

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

public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        request.getRequestDispatcher("web/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String username = request.getParameter("user");
        String password = request.getParameter("pass");
        LoginDAO loginDAO = new LoginDAO();
        Account account = loginDAO.login(username, password);
        if (account == null) {
            request.setAttribute("message", "Thông tin đăng nhập không hợp lệ. Vui lòng thử lại");
            request.getRequestDispatcher("web/login.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession();
            User user = loginDAO.getUserSignin(username);
            session.setAttribute("account", account);
            session.setAttribute("user", user);
            session.setMaxInactiveInterval(1000);
            response.sendRedirect("wish");
        }
    }

}
