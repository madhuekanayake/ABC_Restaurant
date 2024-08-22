package com.res.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.res.model.Offer;
import util.DatabaseUtil;

public class OfferDAO {

    // Method to add a new offer to the database
    public void addOffer(Offer offer) throws SQLException {
        String sql = "INSERT INTO offers (description, offer_image_path) VALUES (?, ?)";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, offer.getDescription());
            pstmt.setString(2, offer.getOfferImagePath());
            pstmt.executeUpdate();
        }
    }

    // Method to retrieve all offers from the database
    public List<Offer> getAllOffers() throws SQLException {
        List<Offer> offerList = new ArrayList<>();
        String sql = "SELECT * FROM offers";
        try (Connection conn = DatabaseUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Offer offer = new Offer();
                offer.setId(rs.getInt("id"));
                offer.setDescription(rs.getString("description"));
                offer.setOfferImagePath(rs.getString("offer_image_path"));
                offerList.add(offer);
            }
        }
        return offerList;
    }

    // Method to delete an offer from the database
    public void deleteOffer(int id) throws SQLException {
        String sql = "DELETE FROM offers WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        }
    }
}