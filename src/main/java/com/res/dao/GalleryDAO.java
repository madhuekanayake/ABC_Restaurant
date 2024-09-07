package com.res.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.res.model.Gallery;

import util.DatabaseUtil;

public class GalleryDAO {
    // Method to add a new gallery image to the database
    public void addGalleryImage(Gallery gallery) throws SQLException {
        String sql = "INSERT INTO gallery (description, gallery_image_path) VALUES (?, ?)";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, gallery.getDescription());
            pstmt.setString(2, gallery.getGalleryImagePath());
            pstmt.executeUpdate();
        }
    }

    // Method to retrieve all gallery images from the database
    public List<Gallery> getAllGalleryImages() throws SQLException {
        List<Gallery> galleryList = new ArrayList<>();
        String sql = "SELECT * FROM gallery";
        try (Connection conn = DatabaseUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Gallery gallery = new Gallery();
                gallery.setId(rs.getInt("id"));
                gallery.setDescription(rs.getString("description"));
                gallery.setGalleryImagePath(rs.getString("gallery_image_path"));
                galleryList.add(gallery);
            }
        }
        return galleryList;
    }

    // Method to delete a gallery image from the database
    public void deleteGalleryImage(int galleryId) throws SQLException {
        String sql = "DELETE FROM gallery WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, galleryId);
            pstmt.executeUpdate();
        }
    }
    
    public Gallery getGalleryImageById(int id) throws SQLException {
        String sql = "SELECT * FROM gallery WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Gallery gallery = new Gallery();
                    gallery.setId(rs.getInt("id"));
                    gallery.setDescription(rs.getString("description"));
                    gallery.setGalleryImagePath(rs.getString("gallery_image_path"));
                    return gallery;
                }
            }
        }
        return null;
    }

    public void updateGalleryImage(Gallery gallery) throws SQLException {
        String sql = "UPDATE gallery SET description = ?, gallery_image_path = ? WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, gallery.getDescription());
            pstmt.setString(2, gallery.getGalleryImagePath());
            pstmt.setInt(3, gallery.getId());
            pstmt.executeUpdate();
        }
    }
}