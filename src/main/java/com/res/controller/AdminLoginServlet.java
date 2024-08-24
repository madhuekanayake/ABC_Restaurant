package com.res.controller;

import com.res.model.Admin;
import service.AdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/admin-login")
public class AdminLoginServlet extends HttpServlet {
    private AdminService adminService = new AdminService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            int authResult = adminService.authenticateAdmin(username, password);
            HttpSession session = request.getSession();
            
            switch (authResult) {
                case AdminService.AUTH_SUCCESS:
                    // Authentication successful
                    Admin admin = adminService.getAdminByUsername(username);
                    session.setAttribute("admin", admin); // Store admin object in session
                    response.sendRedirect(request.getContextPath() + "/AdminArea/dashboard.jsp");
                    break;
                case AdminService.INVALID_USERNAME:
                    session.setAttribute("error", "Invalid username");
                    response.sendRedirect(request.getContextPath() + "/AdminArea/admin_login.jsp");
                    break;
                case AdminService.INVALID_PASSWORD:
                    session.setAttribute("error", "Invalid password");
                    response.sendRedirect(request.getContextPath() + "/AdminArea/admin_login.jsp");
                    break;
                default:
                    session.setAttribute("error", "An error occurred during authentication");
                    response.sendRedirect(request.getContextPath() + "/AdminArea/admin_login.jsp");
            }
        } catch (SQLException e) {
            throw new ServletException("Database error occurred", e);
        }
    }
}