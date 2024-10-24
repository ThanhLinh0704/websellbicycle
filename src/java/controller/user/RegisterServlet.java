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

public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        request.getRequestDispatcher("web/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        LoginDAO loginDAO = new LoginDAO();

        String username = request.getParameter("user");;
        String password = request.getParameter("pass");;
        String passwordCheck = request.getParameter("passCheck");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        Boolean gender = "male".equals(request.getParameter("gender"));

        try {

            java.sql.Date dob = java.sql.Date.valueOf(request.getParameter("dob"));

            if (!password.contentEquals(passwordCheck)) {
                session.setAttribute("message", "Mật khẩu không trùng khớp");
                session.setAttribute("user", username);
                session.setAttribute("pass", password);
                session.setAttribute("passCheck", passwordCheck);
                session.setAttribute("name", name);
                session.setAttribute("dob", request.getParameter("dob"));
                session.setAttribute("phone", phone);
                session.setAttribute("gender", gender);
                response.sendRedirect("register");
                return;
            }

            Account accoutCheck = loginDAO.checkAccountExist(username);
            if (accoutCheck != null) {
                session.setAttribute("message", "Tài khoản này đã tồn tại");
                session.setAttribute("user", username);
                session.setAttribute("pass", password);
                session.setAttribute("passCheck", passwordCheck);
                session.setAttribute("name", name);
                session.setAttribute("dob", request.getParameter("dob"));
                session.setAttribute("phone", phone);
                session.setAttribute("gender", gender);
                response.sendRedirect("register");
                return;
            }

            loginDAO.signup(username, password, name, gender, dob, phone);
            session.setMaxInactiveInterval(1000);
            response.sendRedirect("wish");

        } catch (IOException e) {
            session.setAttribute("message", "Thông tin đăng kí không hợp lệ! Vui lòng kiểm tra lại thông tin");
            session.setAttribute("user", username);
            session.setAttribute("pass", password);
            session.setAttribute("passCheck", passwordCheck);
            session.setAttribute("name", name);
            session.setAttribute("dob", request.getParameter("dob"));
            session.setAttribute("phone", phone);
            session.setAttribute("gender", gender);
            response.sendRedirect("register");
        }
    }

}
