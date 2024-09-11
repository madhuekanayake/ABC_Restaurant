package com.res.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.res.model.Reservation;
import service.ReservationService;

@WebServlet("/reservation")
public class ReservationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ReservationService reservationService = new ReservationService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String person = request.getParameter("person");
        String branch = request.getParameter("branch");

       
        Reservation reservation = new Reservation(0, name, email, phone, date, time, person, branch, 0, false);

        try {
            reservationService.addReservation(reservation);
            
            
            HttpSession session = request.getSession();
            session.setAttribute("successMessage", "Your reservation has been successfully submitted!");
            response.sendRedirect(request.getContextPath() + "/PublicArea/reservation.jsp");
        } catch (SQLException e) {
         
            getServletContext().log("Error adding reservation", e);
          
            HttpSession session = request.getSession();
            session.setAttribute("errorMessage", "An error occurred while submitting your reservation. Please try again.");
            response.sendRedirect(request.getContextPath() + "/PublicArea/reservation.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Reservation> reservationList = reservationService.getAllReservations();
            request.setAttribute("reservationList", reservationList);
            request.getRequestDispatcher("/WEB-INF/views/reservation_list.jsp").forward(request, response);
        } catch (SQLException e) {
          
            getServletContext().log("Error retrieving reservations", e);
           
            request.setAttribute("errorMessage", "An error occurred while retrieving reservations. Please try again.");
            request.getRequestDispatcher("/WEB-INF/views/error.jsp").forward(request, response);
        }
    }
}