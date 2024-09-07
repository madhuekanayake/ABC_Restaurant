package service;

import java.sql.SQLException;
import java.util.List;

import com.res.dao.GalleryDAO;
import com.res.model.Gallery;

public class GalleryService {
    private GalleryDAO galleryDAO = new GalleryDAO();

    public void addGalleryImage(Gallery gallery) throws SQLException {
        galleryDAO.addGalleryImage(gallery);
    }

    public List<Gallery> getAllGalleryImages() throws SQLException {
        return galleryDAO.getAllGalleryImages();
    }

    public void deleteGalleryImage(int galleryId) throws SQLException {
        galleryDAO.deleteGalleryImage(galleryId);
    }
    
    public Gallery getGalleryImageById(int id) throws SQLException {
        return galleryDAO.getGalleryImageById(id);
    }

    public void updateGalleryImage(Gallery gallery) throws SQLException {
        galleryDAO.updateGalleryImage(gallery);
    }
}