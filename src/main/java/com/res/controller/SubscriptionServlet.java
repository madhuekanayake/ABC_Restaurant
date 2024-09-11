package com.res.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.res.model.Subscription;
import service.SubscriptionService;

@WebServlet("/subscribe")
public class SubscriptionServlet extends HttpServlet {
    private SubscriptionService subscriptionService = new SubscriptionService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        try {
            if (action != null && action.equals("delete")) {
                int id = Integer.parseInt(request.getParameter("id"));
                subscriptionService.deleteSubscription(id);
                
                request.getSession().setAttribute("success", "Subscription deleted successfully.");
                response.sendRedirect(request.getContextPath() + "/StaffArea/subscription.jsp");
            } else {
                List<Subscription> subscriptionList = subscriptionService.getAllSubscriptions();
                request.setAttribute("subscriptionList", subscriptionList);
                request.getRequestDispatcher("/StaffArea/subscription.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");

        Subscription subscription = new Subscription(email);

        try {
            subscriptionService.addSubscription(subscription);
            
            request.getSession().setAttribute("success", "You have been successfully subscribed.");
            response.sendRedirect(request.getContextPath() + "/PublicArea/index.jsp");
        } catch (SQLException e) {
            
            response.sendRedirect(request.getContextPath() + "/PublicArea/index.jsp");
        }
    }
}