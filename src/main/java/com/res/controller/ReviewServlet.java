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
            request.getRequestDispatcher("/path/to/customer_reviews.jsp").forward(request, response);
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
            response.sendRedirect(request.getContextPath() + "./PublicArea/reviews");
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
