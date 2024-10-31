package controller.admin;

import dao.CategoryDAO;
import dao.ProductManagerDAO;
import entity.*;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.PrintWriter;
import java.nio.file.Paths;

@MultipartConfig
public class UpdateAndDeleteManagementProductDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession();

        Account checkLoginAccount = (Account) session.getAttribute("account");
        if (checkLoginAccount == null) {
            response.sendRedirect("loginmanager");
        } else {
            String action = request.getParameter("action");

            if (checkLoginAccount.getIsAdmin() == 1) {
                ProductManagerDAO productManagerDAO = new ProductManagerDAO();
                int pid = Integer.parseInt(request.getParameter("pid"));
                if ("update".equals(action)) {
                    String name = request.getParameter("name");
                    int amount = Integer.parseInt(request.getParameter("amount"));
                    double price = Double.parseDouble(request.getParameter("price").replace(",", "").replace("đ", ""));
                    String title = request.getParameter("title");
                    String description = request.getParameter("description");

                    String imagePath = productManagerDAO.getCurrentImageByPid(pid);

                    int cid = Integer.parseInt(request.getParameter("cid"));
                    int sellID = Integer.parseInt(request.getParameter("sellID"));

                    CategoryDAO categoryDAO = new CategoryDAO();

                    Part filePart = request.getPart("file");
                    if (filePart != null && filePart.getSize() > 0) {
                        String productType = categoryDAO.getUrlByCategoryId(cid);
                        String userHomeDir = System.getProperty("user.home");
                        String uploadDir = userHomeDir + File.separator + "WebBicyle" + File.separator + "picture" + File.separator + productType;
                        File dir = new File(uploadDir);
                        if (!dir.exists()) {
                            dir.mkdirs();
                        }
                        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                        imagePath = "picture\\" + productType + "\\" + fileName;
                        filePart.write(uploadDir + File.separator + fileName);
                    }

                    productManagerDAO.editProduct(name, imagePath, amount, price, title, description, cid, sellID, pid);
                    response.sendRedirect("managementproduct");
                } else if ("delete".equals(action)) {

                    productManagerDAO.deleteProduct(pid);
                    response.sendRedirect("managementproduct");
                }
            } else {
                response.sendRedirect("404");
            }
        }
    }

}
