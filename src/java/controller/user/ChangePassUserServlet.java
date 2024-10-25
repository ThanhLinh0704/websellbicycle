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

public class ChangePassUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession();

        Account checkLoginAccount = (Account) session.getAttribute("account");
        if (checkLoginAccount == null) {
            response.sendRedirect("login");
        } else {

            String oddPass = request.getParameter("oddPass");
            String newPass = request.getParameter("newPass");
            String confirmPass = request.getParameter("confirmPass");

            if (!oddPass.equals(checkLoginAccount.getPass())) {
                request.setAttribute("notificationError", "Mật khẩu cũ không đúng");
                request.getRequestDispatcher("info").forward(request, response);
                return;
            }

            if (oddPass.equals(newPass)) {
                request.setAttribute("notificationError", "Mật khẩu mới không được trùng với mật khẩu cũ");
                request.getRequestDispatcher("info").forward(request, response);
                return;
            }

            if (!newPass.equals(confirmPass)) {
                request.setAttribute("notificationError", "Mật khẩu xác nhận không trùng khớp với mật khẩu mới");
                request.getRequestDispatcher("info").forward(request, response);
                return;
            }

            UserDAO userDAO = new UserDAO();
            request.setAttribute("notificationSuccess", "Đổi mật khẩu thành công");
            userDAO.updatePassword(newPass, checkLoginAccount.getId());

            request.getRequestDispatcher("info").forward(request, response);
        }
    }

}
