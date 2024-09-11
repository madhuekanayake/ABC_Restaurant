package com.res.model;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class GalleryTest {

    private Gallery gallery;

    @BeforeEach
    public void setUp() {
        // This will run before each test
        gallery = new Gallery("Beautiful Sunset", "/images/sunset.jpg");
    }

    @Test
    public void testGetDescription() {
        assertEquals("Beautiful Sunset", gallery.getDescription());
    }

    @Test
    public void testSetDescription() {
        gallery.setDescription("Amazing Beach");
        assertEquals("Amazing Beach", gallery.getDescription());
    }

    @Test
    public void testGetGalleryImagePath() {
        assertEquals("/images/sunset.jpg", gallery.getGalleryImagePath());
    }

    @Test
    public void testSetGalleryImagePath() {
        gallery.setGalleryImagePath("/images/beach.jpg");
        assertEquals("/images/beach.jpg", gallery.getGalleryImagePath());
    }

    @Test
    public void testGetId() {
        gallery.setId(101);
        assertEquals(101, gallery.getId());
    }

    @Test
    public void testSetId() {
        gallery.setId(202);
        assertEquals(202, gallery.getId());
    }
}

