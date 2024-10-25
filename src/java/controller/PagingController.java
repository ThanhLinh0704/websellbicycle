/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CategoryDAO;
import dao.PageDAO;
import entity.Account;
import entity.Category;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author laptop lenovo
 */
public class PagingController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
    Account a = (Account) session.getAttribute("account");
    
    // Check if the account is null and redirect to login if necessary
    if (a == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    int id = a.getIsSell(); // Seller ID
    
    // Get the index for pagination, default to page 1 if not provided
    String index = request.getParameter("index");
    int indexPage;
    try {
        indexPage = (index == null) ? 1 : Integer.parseInt(index);
    } catch (NumberFormatException e) {
        indexPage = 1; // Fallback to page 1 in case of invalid input
    }
    
    // DAO initialization
    PageDAO dbPage = new PageDAO();
    CategoryDAO dbCategory = new CategoryDAO();
    
    // Fetch categories and products
    List<Category> listC = dbCategory.getAllCategory();
    List<Product> list = dbPage.getPaging(indexPage, id);
    
    // Set attributes to pass to the JSP page
    request.setAttribute("listCC", listC);
    request.setAttribute("listP", list);
    
    // Forward to the JSP page for rendering
    request.getRequestDispatcher("ManagerProduct.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
