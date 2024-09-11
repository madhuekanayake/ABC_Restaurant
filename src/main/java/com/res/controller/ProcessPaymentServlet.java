package com.res.controller;





import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.OrderService;

@WebServlet("/processPayment")
public class ProcessPaymentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        
        OrderService orderService = new OrderService();
        try {
            
            boolean paymentSuccessful = true;
            
            if (paymentSuccessful) {
                orderService.updateOrderStatus(orderId, 1); 
                
                
                HttpSession session = request.getSession();
                session.setAttribute("paymentSuccess", true);
                
                response.sendRedirect(request.getContextPath() + "/PublicArea/orderConfirmation.jsp");
            } else {
                response.sendRedirect(request.getContextPath() + "/paymentFailure.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/paymentError.jsp");
        }
    }
}