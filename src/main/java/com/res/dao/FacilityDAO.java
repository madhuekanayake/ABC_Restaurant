package com.res.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.res.model.Facility;

import util.DatabaseUtil;

public class FacilityDAO {
    // Method to add a new facility to the database
    public void addFacility(Facility facility) throws SQLException {
        String sql = "INSERT INTO facility (name, description, facility_image_path) VALUES (?, ?, ?)";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, facility.getName());
            pstmt.setString(2, facility.getDescription());
            pstmt.setString(3, facility.getFacilityImagePath());
            pstmt.executeUpdate();
        }
    }

    // Method to retrieve all facilities from the database
    public List<Facility> getAllFacilities() throws SQLException {
        List<Facility> facilityList = new ArrayList<>();
        String sql = "SELECT * FROM facility";
        try (Connection conn = DatabaseUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Facility facility = new Facility();
                facility.setId(rs.getInt("id"));
                facility.setName(rs.getString("name"));
                facility.setDescription(rs.getString("description"));
                facility.setFacilityImagePath(rs.getString("facility_image_path"));
                facilityList.add(facility);
            }
        }
        return facilityList;
    }

    // Method to delete a facility from the database
    public void deleteFacility(int facilityId) throws SQLException {
        String sql = "DELETE FROM facility WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, facilityId);
            pstmt.executeUpdate();
        }
    }
    
    public Facility getFacilityById(int id) throws SQLException {
        String sql = "SELECT * FROM facility WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Facility facility = new Facility();
                    facility.setId(rs.getInt("id"));
                    facility.setName(rs.getString("name"));
                    facility.setDescription(rs.getString("description"));
                    facility.setFacilityImagePath(rs.getString("facility_image_path"));
                    return facility;
                }
            }
        }
        return null;
    }

    public void updateFacility(Facility facility) throws SQLException {
        String sql = "UPDATE facility SET name = ?, description = ?, facility_image_path = ? WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, facility.getName());
            pstmt.setString(2, facility.getDescription());
            pstmt.setString(3, facility.getFacilityImagePath());
            pstmt.setInt(4, facility.getId());
            pstmt.executeUpdate();
        }
    }
}