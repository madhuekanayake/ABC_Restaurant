package service;

import com.res.model.Order;
import com.res.model.Cart;
import com.res.model.CartItem;
import com.res.model.Customer;
import util.DatabaseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class OrderService {
    public int saveOrder(Customer customer, Cart cart, String firstName, String lastName, String phone, String email,
                         String address, String city, String house, String postalCode, String zip, String message) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int orderId = -1;

        try {
            conn = DatabaseUtil.getConnection();
            conn.setAutoCommit(false);

            // Insert order
            String orderSql = "INSERT INTO orders (customer_id, first_name, last_name, phone, email, address, city, house, postal_code, zip, message, total_amount) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(orderSql, Statement.RETURN_GENERATED_KEYS);
            pstmt.setInt(1, customer.getId());
            pstmt.setString(2, firstName);
            pstmt.setString(3, lastName);
            pstmt.setString(4, phone);
            pstmt.setString(5, email);
            pstmt.setString(6, address);
            pstmt.setString(7, city);
            pstmt.setString(8, house);
            pstmt.setString(9, postalCode);
            pstmt.setString(10, zip);
            pstmt.setString(11, message);
            pstmt.setDouble(12, cart.getTotal());
            pstmt.executeUpdate();

            rs = pstmt.getGeneratedKeys();
            if (rs.next()) {
                orderId = rs.getInt(1);
            }

            // Insert order items
            String itemSql = "INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(itemSql);
            for (CartItem item : cart.getItems()) {
                pstmt.setInt(1, orderId);
                pstmt.setInt(2, item.getProduct().getId());
                pstmt.setInt(3, item.getQuantity());
                pstmt.setDouble(4, item.getProduct().getPrice());
                pstmt.executeUpdate();
            }

            conn.commit();
        } catch (Exception e) {
            if (conn != null) {
                conn.rollback();
            }
            throw e;
        } finally {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        }

        return orderId;
    }

    public List<Order> getAllOrders() throws Exception {
        List<Order> orders = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DatabaseUtil.getConnection();
            String sql = "SELECT * FROM orders ORDER BY id DESC";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt("id"));
                order.setCustomerId(rs.getInt("customer_id"));
                order.setFirstName(rs.getString("first_name"));
                order.setLastName(rs.getString("last_name"));
                order.setPhone(rs.getString("phone"));
                order.setEmail(rs.getString("email"));
                order.setTotalAmount(rs.getDouble("total_amount"));
                order.setOrderDate(rs.getTimestamp("order_date"));
                // Set other fields as needed
                orders.add(order);
            }
        } finally {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        }

        return orders;
    }
}
