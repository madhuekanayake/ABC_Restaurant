package com.res.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.res.model.Reservation;

import util.DatabaseUtil;


public class ReservationDAO {
    public void addReservation(Reservation reservation) throws SQLException {
        String sql = "INSERT INTO reservations (name, email, phone, date, time, person, branch) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, reservation.getName());
            pstmt.setString(2, reservation.getEmail());
            pstmt.setString(3, reservation.getPhone());
            pstmt.setString(4, reservation.getDate());
            pstmt.setString(5, reservation.getTime());
            pstmt.setString(6, reservation.getPerson());
            pstmt.setString(7, reservation.getBranch());
            pstmt.executeUpdate();
        }
    }
}
