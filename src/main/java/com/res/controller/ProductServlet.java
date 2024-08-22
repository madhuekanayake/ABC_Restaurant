package com.res.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.res.model.Product;
import service.ProductService;

@WebServlet("/product_index")
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
                 maxFileSize = 1024 * 1024 * 5,
                 maxRequestSize = 1024 * 1024 * 5 * 5)
public class ProductServlet extends HttpServlet {
    private ProductService productService = new ProductService();
    private static final String UPLOAD_DIRECTORY = "product_images";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("delete".equals(action)) {
            int productId = Integer.parseInt(request.getParameter("id"));
            try {
                productService.deleteProduct(productId);
                response.sendRedirect(request.getContextPath() + "/product_index");
            } catch (SQLException e) {
                throw new ServletException(e);
            }
        } else {
            try {
                List<Product> productList = productService.getAllProducts();
                request.setAttribute("productList", productList);
                request.getRequestDispatcher("/AdminArea/product_index.jsp").forward(request, response);
            } catch (SQLException e) {
                throw new ServletException(e);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String category = request.getParameter("category");

        // Handle file upload
        Part filePart = request.getPart("productImage");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String fileExtension = fileName.substring(fileName.lastIndexOf("."));
        String newFileName = UUID.randomUUID().toString() + fileExtension;

        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        String filePath = uploadPath + File.separator + newFileName;
        filePart.write(filePath);

        String productImagePath = UPLOAD_DIRECTORY + File.separator + newFileName;

        Product product = new Product(name, price, description, category, productImagePath);

        try {
            productService.addProduct(product);
            response.sendRedirect(request.getContextPath() + "/product_index");
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}