package com.res.dao;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.SQLException;
import java.util.List;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.res.model.Review;
import util.DatabaseUtil;

public class ReviewDAOTest {

    private ReviewDAO reviewDAO;

    @BeforeEach
    void setUp() throws SQLException {
        reviewDAO = new ReviewDAO();
        DatabaseUtil.getConnection().createStatement().execute("CREATE TABLE reviews (id INT AUTO_INCREMENT PRIMARY KEY, username VARCHAR(255), message VARCHAR(255));");
    }

    @AfterEach
    void tearDown() throws SQLException {
        DatabaseUtil.getConnection().createStatement().execute("DROP TABLE reviews;");
    }

    @Test
    void testAddReview() throws SQLException {
        Review review = new Review("TestUser", "Test Message");
        reviewDAO.addReview(review);

        List<Review> reviews = reviewDAO.getAllReviews();
        assertEquals(1, reviews.size());
        assertEquals("TestUser", reviews.get(0).getUsername());
    }


    @Test
    void testDeleteReview() throws SQLException {
        Review review = new Review("TestUser", "Test Message");
        reviewDAO.addReview(review);

        List<Review> reviews = reviewDAO.getAllReviews();
        reviewDAO.deleteReview(reviews.get(0).getId());

        reviews = reviewDAO.getAllReviews();
        assertTrue(reviews.isEmpty());
    }
}
