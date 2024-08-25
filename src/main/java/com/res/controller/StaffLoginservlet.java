package com.res.controller;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.res.model.Staff;
import service.StaffService;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/staff-login")
public class StaffLoginservlet extends HttpServlet {
    private StaffService staffService = new StaffService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            Staff staff = staffService.authenticateStaff(username, password);
            if (staff != null) {
                HttpSession session = request.getSession();
                session.setAttribute("staff", staff);
                response.sendRedirect(request.getContextPath() + "/StaffArea/dashboard.jsp");
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("error", "Invalid username or password");
                response.sendRedirect(request.getContextPath() + "/StaffArea/staff_login.jsp");
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}

