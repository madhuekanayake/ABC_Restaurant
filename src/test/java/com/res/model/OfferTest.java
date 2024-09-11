package com.res.model;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class OfferTest {

    private Offer offer;

    @BeforeEach
    public void setUp() {
        // Initialize the Offer object with default values
        offer = new Offer();
        offer.setId(1);
        offer.setDescription("50% off on all items");
        offer.setOfferImagePath("/images/offer1.jpg");
    }

    @Test
    public void testGetId() {
        assertEquals(1, offer.getId());
    }

    @Test
    public void testSetId() {
        offer.setId(2);
        assertEquals(2, offer.getId());
    }

    @Test
    public void testGetDescription() {
        assertEquals("50% off on all items", offer.getDescription());
    }

    @Test
    public void testSetDescription() {
        offer.setDescription("Buy one get one free");
        assertEquals("Buy one get one free", offer.getDescription());
    }

    @Test
    public void testGetOfferImagePath() {
        assertEquals("/images/offer1.jpg", offer.getOfferImagePath());
    }

    @Test
    public void testSetOfferImagePath() {
        offer.setOfferImagePath("/images/offer2.jpg");
        assertEquals("/images/offer2.jpg", offer.getOfferImagePath());
    }
}
