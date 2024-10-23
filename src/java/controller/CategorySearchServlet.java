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

public class CategorySearchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession();
        ProductDAO productDAO = new ProductDAO();

        String cid = request.getParameter("cid");

        List<Product> products;
        if (cid != null) {
            products = productDAO.getProductByCID(Integer.parseInt(cid));
        } else {
            products = productDAO.getAllProduct();
        }

        session.setAttribute("products", products);
        request.getRequestDispatcher("web/functionweb/product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
