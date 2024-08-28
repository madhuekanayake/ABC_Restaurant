package com.res.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ReservationService;

@WebServlet("/deleteReservation")
public class DeleteReservationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ReservationService reservationService = new ReservationService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        if (id != null && !id.isEmpty()) {
            try {
                int reservationId = Integer.parseInt(id);
                reservationService.deleteReservation(reservationId);
                response.sendRedirect(request.getContextPath() + "/StaffArea/customer_reservation.jsp");
            } catch (SQLException e) {
                throw new ServletException(e);
            } catch (NumberFormatException e) {
                throw new ServletException("Invalid reservation ID", e);
            }
        } else {
            throw new ServletException("Reservation ID is missing");
        }
    }
}