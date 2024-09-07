package com.res.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.res.model.Staff;

import util.DatabaseUtil;

public class StaffDAO {
    public void addStaff(Staff staff) throws SQLException {
        String sql = "INSERT INTO staff (name, email, password, profile_image_path) VALUES (?, ?, ?, ?)";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, staff.getName());
            pstmt.setString(2, staff.getEmail());
            pstmt.setString(3, staff.getPassword());
            pstmt.setString(4, staff.getProfileImagePath());
            pstmt.executeUpdate();
        }
    }

    public List<Staff> getAllStaff() throws SQLException {
        List<Staff> staffList = new ArrayList<>();
        String sql = "SELECT * FROM staff";
        try (Connection conn = DatabaseUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Staff staff = new Staff();
                staff.setId(rs.getInt("id"));
                staff.setName(rs.getString("name"));
                staff.setEmail(rs.getString("email"));
                staff.setPassword(rs.getString("password"));
                staff.setProfileImagePath(rs.getString("profile_image_path"));
                staffList.add(staff);
            }
        }
        return staffList;
    }

    public void deleteStaff(int staffId) throws SQLException {
        String sql = "DELETE FROM staff WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, staffId);
            pstmt.executeUpdate();
        }
    }
    public Staff getStaffByUsernameAndPassword(String username, String password) throws SQLException {
        String sql = "SELECT * FROM staff WHERE email = ? AND password = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Staff staff = new Staff();
                    staff.setId(rs.getInt("id"));
                    staff.setName(rs.getString("name"));
                    staff.setEmail(rs.getString("email"));
                    staff.setPassword(rs.getString("password"));
                    staff.setProfileImagePath(rs.getString("profile_image_path"));
                    return staff;
                }
            }
        }
        return null;
    }
    public int getTotalStaffCount() throws SQLException {
        String sql = "SELECT COUNT(*) FROM staff";
        try (Connection conn = DatabaseUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return 0;
    }
}
