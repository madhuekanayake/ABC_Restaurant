package com.res.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.res.model.Product;

import util.DatabaseUtil;

public class ProductDAO {

    // Method to add a new product to the database
    public void addProduct(Product product) throws SQLException {
        String sql = "INSERT INTO product (name, price, description, category, product_image_path) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, product.getName());
            pstmt.setDouble(2, product.getPrice());
            pstmt.setString(3, product.getDescription());
            pstmt.setString(4, product.getCategory());
            pstmt.setString(5, product.getProductImagePath());
            pstmt.executeUpdate();
        }
    }

    // Method to retrieve all products from the database
    public List<Product> getAllProducts() throws SQLException {
        List<Product> productList = new ArrayList<>();
        String sql = "SELECT * FROM product";
        try (Connection conn = DatabaseUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getDouble("price"));
                product.setDescription(rs.getString("description"));
                product.setCategory(rs.getString("category"));
                product.setProductImagePath(rs.getString("product_image_path"));
                productList.add(product);
            }
        }
        return productList;
    }

    // Method to delete a product from the database
    public void deleteProduct(int productId) throws SQLException {
        String sql = "DELETE FROM product WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, productId);
            pstmt.executeUpdate();
        }
    }
    public Product getProductById(int productId) throws SQLException {
        String sql = "SELECT * FROM product WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, productId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Product product = new Product();
                    product.setId(rs.getInt("id"));
                    product.setName(rs.getString("name"));
                    product.setPrice(rs.getDouble("price"));
                    product.setDescription(rs.getString("description"));
                    product.setCategory(rs.getString("category"));
                    product.setProductImagePath(rs.getString("product_image_path"));
                    return product;
                }
            }
        }
        return null;
    }
}