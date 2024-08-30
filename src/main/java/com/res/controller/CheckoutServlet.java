package com.res.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.res.model.Cart;
import com.res.model.Customer;
import service.OrderService;

@WebServlet("/checkout")

public class CheckoutServlet extends HttpServlet {
    private OrderService orderService = new OrderService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        Customer customer = (Customer) session.getAttribute("customer");

        if (cart == null || cart.getItems().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/PublicArea/cart.jsp");
            return;
        }

        // Get form data
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String house = request.getParameter("house");
        String postalCode = request.getParameter("postalCode");
        String zip = request.getParameter("zip");
        String message = request.getParameter("message");

        try {
            int orderId = orderService.saveOrder(customer, cart, firstName, lastName, phone, email, address, city, house, postalCode, zip, message);
            session.removeAttribute("cart");
            
            // Store order information in the session
            session.setAttribute("orderId", orderId);
            session.setAttribute("totalAmount", cart.getTotal());
            session.setAttribute("customerName", firstName + " " + lastName);
            
            // Redirect to the payment page
            response.sendRedirect(request.getContextPath() + "/PublicArea/payment.jsp");
        } catch (Exception e) {
            throw new ServletException("Error processing checkout", e);
        }
    }
}