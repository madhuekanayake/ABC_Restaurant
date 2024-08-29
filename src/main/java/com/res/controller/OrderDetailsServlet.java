package com.res.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.res.model.Order;
import service.OrderService;

@WebServlet("/orderDetails")
public class OrderDetailsServlet extends HttpServlet {
    private OrderService orderService = new OrderService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("id"));
        try {
            Order order = orderService.getOrderDetails(orderId);
            request.setAttribute("order", order);
            request.getRequestDispatcher("/StaffArea/orderDetails.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/staff/orders?error=true");
        }
    }
}