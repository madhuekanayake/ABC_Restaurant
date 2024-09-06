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
        String sql = "INSERT INTO reservations (name, email, phone, date, time, person, branch, status, email_sent) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, reservation.getName());
            pstmt.setString(2, reservation.getEmail());
            pstmt.setString(3, reservation.getPhone());
            pstmt.setString(4, reservation.getDate());
            pstmt.setString(5, reservation.getTime());
            pstmt.setString(6, reservation.getPerson());
            pstmt.setString(7, reservation.getBranch());
            pstmt.setInt(8, reservation.getStatus());
            pstmt.setBoolean(9, reservation.isEmailSent());
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
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("phone"),
                    rs.getString("date"),
                    rs.getString("time"),
                    rs.getString("person"),
                    rs.getString("branch"),
                    rs.getInt("status"),
                    rs.getBoolean("email_sent")
                );
                reservations.add(reservation);
            }
        }
        return reservations;
    }

    public void confirmReservation(int id) throws SQLException {
        String sql = "UPDATE reservations SET status = 1 WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        }
    }

    public List<Reservation> getConfirmedReservations() throws SQLException {
        List<Reservation> reservations = new ArrayList<>();
        String sql = "SELECT * FROM reservations WHERE status = 1";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                Reservation reservation = new Reservation(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("phone"),
                    rs.getString("date"),
                    rs.getString("time"),
                    rs.getString("person"),
                    rs.getString("branch"),
                    rs.getInt("status"),
                    rs.getBoolean("email_sent")
                );
                reservations.add(reservation);
            }
        }
        return reservations;
    }

    public void deleteReservation(int id) throws SQLException {
        String sql = "DELETE FROM reservations WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        }
    }

    public void markEmailAsSent(int id) throws SQLException {
        String sql = "UPDATE reservations SET email_sent = true WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        }
    }
}