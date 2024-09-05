package com.res.model;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.BeforeEach;

public class ProductTest {
	
	private Product product;

    @BeforeEach
    public void setUp() {
        product = new Product();
    }

    @Test
    public void testSetAndGetId() {
        product.setId(1);
        assertEquals(1, product.getId());
    }

    @Test
    public void testSetAndGetName() {
        product.setName("Pizza");
        assertEquals("Pizza", product.getName());
    }

    @Test
    public void testSetAndGetPrice() {
        product.setPrice(12.99);
        assertEquals(12.99, product.getPrice());
    }

    @Test
    public void testSetAndGetDescription() {
        product.setDescription("Delicious cheese pizza");
        assertEquals("Delicious cheese pizza", product.getDescription());
    }

    @Test
    public void testSetAndGetCategory() {
        product.setCategory("Food");
        assertEquals("Food", product.getCategory());
    }

    @Test
    public void testSetAndGetProductImagePath() {
        product.setProductImagePath("/images/pizza.jpg");
        assertEquals("/images/pizza.jpg", product.getProductImagePath());
    }

    @Test
    public void testConstructorWithArguments() {
        Product product = new Product("Burger", 8.99, "Tasty beef burger", "Food", "/images/burger.jpg");
        assertEquals("Burger", product.getName());
        assertEquals(8.99, product.getPrice());
        assertEquals("Tasty beef burger", product.getDescription());
        assertEquals("Food", product.getCategory());
        assertEquals("/images/burger.jpg", product.getProductImagePath());
    }

}
