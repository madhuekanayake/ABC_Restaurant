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
    
    
    public List<Product> searchProducts(String query) throws SQLException {
        List<Product> searchResults = new ArrayList<>();
        String sql = "SELECT * FROM product WHERE name LIKE ? OR description LIKE ? OR category LIKE ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            String likeQuery = "%" + query + "%";
            pstmt.setString(1, likeQuery);
            pstmt.setString(2, likeQuery);
            pstmt.setString(3, likeQuery);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Product product = new Product();
                    product.setId(rs.getInt("id"));
                    product.setName(rs.getString("name"));
                    product.setPrice(rs.getDouble("price"));
                    product.setDescription(rs.getString("description"));
                    product.setCategory(rs.getString("category"));
                    product.setProductImagePath(rs.getString("product_image_path"));
                    searchResults.add(product);
                }
            }
        }
        return searchResults;
    }
    
    public void updateProduct(Product product) throws SQLException {
        String sql = "UPDATE product SET name = ?, price = ?, description = ?, category = ?, product_image_path = ? WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, product.getName());
            pstmt.setDouble(2, product.getPrice());
            pstmt.setString(3, product.getDescription());
            pstmt.setString(4, product.getCategory());
            pstmt.setString(5, product.getProductImagePath());
            pstmt.setInt(6, product.getId());
            pstmt.executeUpdate();
        }
    }
    
    
}