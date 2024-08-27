package com.res.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.res.model.Cart;
import com.res.model.Product;
import service.ProductService;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    private ProductService productService = new ProductService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        int productId = Integer.parseInt(request.getParameter("productId"));
        
        try {
            switch (action) {
                case "add":
                    Product product = productService.getProductById(productId);
                    int quantity = Integer.parseInt(request.getParameter("quantity"));
                    cart.addItem(product, quantity);
                    break;
                case "remove":
                    cart.removeItem(productId);
                    break;
                case "update":
                    int newQuantity = Integer.parseInt(request.getParameter("quantity"));
                    cart.updateQuantity(productId, newQuantity);
                    break;
            }
        } catch (Exception e) {
            throw new ServletException("Error processing cart action", e);
        }

        response.sendRedirect(request.getContextPath() + "/PublicArea/cart.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/PublicArea/cart.jsp").forward(request, response);
    }
}