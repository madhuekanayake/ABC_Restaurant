package com.res.controller;


import service.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private CustomerService customerService = new CustomerService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (customerService.registerCustomer(username, email, password)) {
            response.sendRedirect(request.getContextPath() + "/PublicArea/login.jsp?registered=true");
        } else {
            response.sendRedirect(request.getContextPath() + "/PublicArea/register.jsp?error=true");
        }
    }
}
