package service;

import java.sql.SQLException;
import java.util.List;

import com.res.dao.ProductDAO;
import com.res.model.Product;

public class ProductService {
    private ProductDAO productDAO = new ProductDAO();

    public void addProduct(Product product) throws SQLException {
        productDAO.addProduct(product);
    }

    public List<Product> getAllProducts() throws SQLException {
        return productDAO.getAllProducts();
    }

    public void deleteProduct(int productId) throws SQLException {
        productDAO.deleteProduct(productId);
    }

    public Product getProductById(int productId) throws SQLException {
        return productDAO.getProductById(productId);
    }

    // Add this new method
    public List<Product> searchProducts(String query) throws SQLException {
        return productDAO.searchProducts(query);
    }
    
    public void updateProduct(Product product) throws SQLException {
        productDAO.updateProduct(product);
    }
}