package com.res.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.res.model.Cart;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            request.getSession().setAttribute("cart", cart);
        }
        request.getRequestDispatcher("/PublicArea/cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        int productId = Integer.parseInt(request.getParameter("productId"));
        Cart cart = (Cart) request.getSession().getAttribute("cart");

        if (cart == null) {
            response.sendRedirect(request.getContextPath() + "/PublicArea/cart.jsp");
            return;
        }

        switch (action) {
            case "remove":
                cart.removeItem(productId);
                break;
            case "update":
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                cart.updateQuantity(productId, quantity);
                break;
        }

        response.sendRedirect(request.getContextPath() + "/PublicArea/cart.jsp");
    }
}