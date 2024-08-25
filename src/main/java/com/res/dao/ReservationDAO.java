package com.res.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
    public List<Reservation> getAllReservations() throws SQLException {
        List<Reservation> reservations = new ArrayList<>();
        String sql = "SELECT * FROM reservations";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                Reservation reservation = new Reservation(
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("phone"),
                    rs.getString("date"),
                    rs.getString("time"),
                    rs.getString("person"),
                    rs.getString("branch")
                );
                reservations.add(reservation);
            }
        }
        return reservations;
    }
}
