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

public class ProductDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession();
        ProductDAO productDAO = new ProductDAO();
        CategoryDAO categoryDAO = new CategoryDAO();

        String id = request.getParameter("id");
        int cid = categoryDAO.getCategoryIDByProductID(Integer.parseInt(id));

        Product product = productDAO.getProductByID(Integer.parseInt(id));
        List<Product> recommnentProducts = productDAO.get5ProductRecommend(cid, Integer.parseInt(id));

        session.setAttribute("product", product);
        session.setAttribute("recommnentProducts", recommnentProducts);
        request.getRequestDispatcher("web/functionweb/detail.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        request.getRequestDispatcher("web/functionweb/detail.jsp").forward(request, response);

    }

}
