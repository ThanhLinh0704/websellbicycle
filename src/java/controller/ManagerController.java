
package controller;

import dao.CategoryDAO;
import dao.ProductDAO;
import entity.Account;
import entity.Category;
import entity.Product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

public class ManagerController extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
        int id = a.getIsSell();
        ProductDAO dbProduct = new ProductDAO();
        CategoryDAO dbCategory = new CategoryDAO();
        List<Product> list = dbProduct.getProductBySellID(id);
        List<Category> listC = dbCategory.getAllCategory();

        request.setAttribute("listCC", listC);
        request.setAttribute("listP", list);
        request.getRequestDispatcher("ManagerProduct.jsp").forward(request, response);
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
