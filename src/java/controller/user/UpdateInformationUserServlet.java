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

public class UpdateInformationUserServlet extends HttpServlet {

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
            String name = request.getParameter("name");
            String genderParam = request.getParameter("gender");
            String dobParam = request.getParameter("dob");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");

            if (name == null || name.trim().isEmpty()) {
                request.setAttribute("error", "Tên không được để trống.");
                request.getRequestDispatcher("info").forward(request, response);
                return;
            }

            if (genderParam == null || (!genderParam.equals("male") && !genderParam.equals("female"))) {
                request.setAttribute("error", "Giới tính không hợp lệ.");
                request.getRequestDispatcher("info").forward(request, response);
                return;
            }

            boolean gender = "male".equals(genderParam);

            if (dobParam == null || dobParam.trim().isEmpty()) {
                request.setAttribute("error", "Ngày sinh không được để trống");
                request.getRequestDispatcher("info").forward(request, response);
                return;
            }

            java.sql.Date dob;
            try {
                dob = java.sql.Date.valueOf(dobParam);
            } catch (IllegalArgumentException e) {
                request.setAttribute("error", "Định dạng ngày sinh không hợp lệ");
                request.getRequestDispatcher("info").forward(request, response);
                return;
            }

            if (phone == null || !phone.matches("\\d{10,11}")) {
                request.setAttribute("error", "Số điện thoại phải có 10 hoặc 11 chữ số");
                request.getRequestDispatcher("info").forward(request, response);
                return;
            }

            if (address == null || address.trim().isEmpty()) {
                request.setAttribute("error", "Địa chỉ không được để trống");
                request.getRequestDispatcher("info").forward(request, response);
                return;
            }

            UserDAO userDAO = new UserDAO();
            request.setAttribute("success", "Cập nhật thông tin thành công");
            userDAO.editUser(name, gender, dob, phone, address, checkLoginAccount.getId());
            request.getRequestDispatcher("info").forward(request, response);
        }
    }

}
