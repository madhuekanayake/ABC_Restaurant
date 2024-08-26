package com.res.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.res.model.Review;
import service.ReviewService;

@WebServlet("/reviews")
public class ReviewServlet extends HttpServlet {
    private ReviewService reviewService = new ReviewService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Review> reviewList = reviewService.getAllReviews();
            request.setAttribute("reviewList", reviewList);
            request.getRequestDispatcher("/WEB-INF/views/review_List.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String message = request.getParameter("message");

        Review review = new Review(username, message);

        try {
            reviewService.addReview(review);
            // Add success message to session
            request.getSession().setAttribute("success", "Your feedback has been successfully submitted.");
            response.sendRedirect(request.getContextPath() + "/PublicArea/reviews.jsp");
        } catch (SQLException e) {
            // Add error message to session
            request.getSession().setAttribute("error", "There was an error submitting your review. Please try again.");
            response.sendRedirect(request.getContextPath() + "/PublicArea/reviews.jsp");
        }
    }
}

