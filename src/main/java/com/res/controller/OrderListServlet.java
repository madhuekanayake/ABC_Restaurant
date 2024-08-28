package com.res.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.res.model.Order;
import service.OrderService;

@WebServlet("/orderList")
public class OrderListServlet extends HttpServlet {
    private OrderService orderService = new OrderService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Order> orders = orderService.getAllOrders();
            request.setAttribute("orderList", orders);
            request.getRequestDispatcher("/StaffArea/orderList.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Error retrieving orders", e);
        }
    }
}