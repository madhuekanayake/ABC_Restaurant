package com.res.dao;

import com.res.model.Admin;

import service.AdminService;
import util.DatabaseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDAO {
    public int authenticate(String username, String password) throws SQLException {
        String sql = "SELECT password FROM admin WHERE username = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, username);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    String storedPassword = rs.getString("password");
                    if (password.equals(storedPassword)) {
                        return AdminService.AUTH_SUCCESS;
                    } else {
                        return AdminService.INVALID_PASSWORD;
                    }
                } else {
                    return AdminService.INVALID_USERNAME;
                }
            }
        }
    }

    public Admin getAdminByUsername(String username) throws SQLException {
        String sql = "SELECT * FROM admin WHERE username = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, username);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Admin admin = new Admin();
                    admin.setId(rs.getInt("id"));
                    admin.setUsername(rs.getString("username"));
                    // Don't set the password for security reasons
                    return admin;
                }
            }
        }
        return null;
    }
}