package com.res.model;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class ReviewTest {
	
	private Review review;

    @BeforeEach
    public void setUp() {
        // Initialize the Review object with some sample data
        review = new Review("john_doe", "Great experience, will visit again!");
    }

    @Test
    public void testDefaultConstructor() {
        Review defaultReview = new Review();
        defaultReview.setId(1);
        defaultReview.setUsername("jane_doe");
        defaultReview.setMessage("Not bad, could be better.");

        // Verify the default values
        assertEquals(1, defaultReview.getId());
        assertEquals("jane_doe", defaultReview.getUsername());
        assertEquals("Not bad, could be better.", defaultReview.getMessage());
    }

    @Test
    public void testParameterizedConstructor() {
        assertEquals("john_doe", review.getUsername());
        assertEquals("Great experience, will visit again!", review.getMessage());
    }

    @Test
    public void testGettersAndSetters() {
        review.setId(2);
        review.setUsername("alice_smith");
        review.setMessage("Amazing service and food!");

        // Verify the updated values
        assertEquals(2, review.getId());
        assertEquals("alice_smith", review.getUsername());
        assertEquals("Amazing service and food!", review.getMessage());
    }

    @Test
    public void testToString() {
        // If you had a toString() method, you could test it here
        // For example:
        // String expected = "Review{id=1, username='john_doe', message='Great experience, will visit again!'}";
        // assertEquals(expected, review.toString());
        // If not, you can skip this test.
    }

}
