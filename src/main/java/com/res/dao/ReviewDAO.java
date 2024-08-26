package com.res.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.res.model.Review;
import util.DatabaseUtil;

public class ReviewDAO {

    // Method to add a new review to the database
    public void addReview(Review review) throws SQLException {
        String sql = "INSERT INTO reviews (username, message) VALUES (?, ?)";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, review.getUsername());
            pstmt.setString(2, review.getMessage());
            pstmt.executeUpdate();
        }
    }

    // Method to retrieve all reviews from the database
    public List<Review> getAllReviews() throws SQLException {
        List<Review> reviewList = new ArrayList<>();
        String sql = "SELECT * FROM reviews";
        try (Connection conn = DatabaseUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Review review = new Review();
                review.setId(rs.getInt("id"));
                review.setUsername(rs.getString("username"));
                review.setMessage(rs.getString("message"));
                reviewList.add(review);
            }
        }
        return reviewList;
    }

    // Method to delete a review from the database
    public void deleteReview(int id) throws SQLException {
        String sql = "DELETE FROM reviews WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        }
    }
}
