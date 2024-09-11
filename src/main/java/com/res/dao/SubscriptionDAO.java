package com.res.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.res.model.Subscription;
import util.DatabaseUtil;

public class SubscriptionDAO {


    public void addSubscription(Subscription subscription) throws SQLException {
        String sql = "INSERT INTO subscriptions (email) VALUES (?)";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, subscription.getEmail());
            pstmt.executeUpdate();
        }
    }

   
    public List<Subscription> getAllSubscriptions() throws SQLException {
        List<Subscription> subscriptionList = new ArrayList<>();
        String sql = "SELECT * FROM subscriptions";
        try (Connection conn = DatabaseUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Subscription subscription = new Subscription();
                subscription.setId(rs.getInt("id"));
                subscription.setEmail(rs.getString("email"));
                subscriptionList.add(subscription);
            }
        }
        return subscriptionList;
    }

  
    public void deleteSubscription(int id) throws SQLException {
        String sql = "DELETE FROM subscriptions WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        }
    }
}