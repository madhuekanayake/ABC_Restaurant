package com.res.controller;


import service.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.res.model.Customer;

import java.io.IOException;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private CustomerService customerService = new CustomerService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Customer customer = customerService.authenticateCustomer(username, password);

        HttpSession session = request.getSession();

        if (customer != null) {
            session.setAttribute("customer", customer);

            // Check if the user was trying to access a specific page before logging in
            String redirectAfterLogin = (String) session.getAttribute("redirectAfterLogin");
            if (redirectAfterLogin != null) {
                session.removeAttribute("redirectAfterLogin");
                response.sendRedirect(redirectAfterLogin);
            } else {
                response.sendRedirect("./PublicArea/index.jsp");
            }
        } else {
            session.setAttribute("error", "Invalid username or password.");
            response.sendRedirect("./PublicArea/login.jsp");
        }
    }
}


