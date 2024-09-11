package com.res.dao;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.SQLException;
import java.util.List;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.res.model.Gallery;

public class GalleryDAOTest {

    private GalleryDAO galleryDAO;

    @BeforeEach
    public void setUp() {
        galleryDAO = new GalleryDAO();
        // Optionally, set up a test database or mock database connection
    }

    @AfterEach
    public void tearDown() throws SQLException {
        // Clean up the test database after each test if necessary
        List<Gallery> galleryList = galleryDAO.getAllGalleryImages();
        for (Gallery gallery : galleryList) {
            galleryDAO.deleteGalleryImage(gallery.getId());
        }
    }

    @Test
    public void testAddGalleryImage() throws SQLException {
        Gallery gallery = new Gallery();
        gallery.setDescription("Test Image");
        gallery.setGalleryImagePath("test_image_path.jpg");

        galleryDAO.addGalleryImage(gallery);

        List<Gallery> galleryList = galleryDAO.getAllGalleryImages();
        assertFalse(galleryList.isEmpty(), "Gallery list should not be empty after adding an image.");
        assertEquals("Test Image", galleryList.get(0).getDescription());
        assertEquals("test_image_path.jpg", galleryList.get(0).getGalleryImagePath());
    }

    @Test
    public void testGetAllGalleryImages() throws SQLException {
    	assertEquals(1, 1);
        Gallery gallery1 = new Gallery();
        gallery1.setDescription("Image 1");
        gallery1.setGalleryImagePath("image1.jpg");

        Gallery gallery2 = new Gallery();
        gallery2.setDescription("Image 2");
        gallery2.setGalleryImagePath("image2.jpg");

        galleryDAO.addGalleryImage(gallery1);
        galleryDAO.addGalleryImage(gallery2);

        List<Gallery> galleryList = galleryDAO.getAllGalleryImages();
        assertEquals(2, galleryList.size(), "There should be 2 gallery images.");
    }

    @Test
    public void testDeleteGalleryImage() throws SQLException {
        Gallery gallery = new Gallery();
        gallery.setDescription("Image to Delete");
        gallery.setGalleryImagePath("delete_image.jpg");

        galleryDAO.addGalleryImage(gallery);
        List<Gallery> galleryList = galleryDAO.getAllGalleryImages();
        assertFalse(galleryList.isEmpty());

        int galleryId = galleryList.get(0).getId();
        galleryDAO.deleteGalleryImage(galleryId);

        galleryList = galleryDAO.getAllGalleryImages();
        assertTrue(galleryList.isEmpty(), "Gallery list should be empty after deletion.");
    }

    @Test
    public void testGetGalleryImageById() throws SQLException {
        Gallery gallery = new Gallery();
        gallery.setDescription("Image to Retrieve");
        gallery.setGalleryImagePath("retrieve_image.jpg");

        galleryDAO.addGalleryImage(gallery);

        List<Gallery> galleryList = galleryDAO.getAllGalleryImages();
        int galleryId = galleryList.get(0).getId();

        Gallery retrievedGallery = galleryDAO.getGalleryImageById(galleryId);
        assertNotNull(retrievedGallery, "Retrieved gallery should not be null.");
        assertEquals("Image to Retrieve", retrievedGallery.getDescription());
        assertEquals("retrieve_image.jpg", retrievedGallery.getGalleryImagePath());
    }

    @Test
    public void testUpdateGalleryImage() throws SQLException {
        Gallery gallery = new Gallery();
        gallery.setDescription("Old Description");
        gallery.setGalleryImagePath("old_image.jpg");

        galleryDAO.addGalleryImage(gallery);

        List<Gallery> galleryList = galleryDAO.getAllGalleryImages();
        int galleryId = galleryList.get(0).getId();

        Gallery updatedGallery = new Gallery();
        updatedGallery.setId(galleryId);
        updatedGallery.setDescription("Updated Description");
        updatedGallery.setGalleryImagePath("updated_image.jpg");

        galleryDAO.updateGalleryImage(updatedGallery);

        Gallery retrievedGallery = galleryDAO.getGalleryImageById(galleryId);
        assertEquals("Updated Description", retrievedGallery.getDescription());
        assertEquals("updated_image.jpg", retrievedGallery.getGalleryImagePath());
    }
}
