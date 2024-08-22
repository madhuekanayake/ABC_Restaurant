package com.res.model;

public class Product {
    private int id;
    private String name;
    private double price;
    private String description;
    private String category;
    private String productImagePath;

    public Product() {}

    public Product(String name, double price, String description, String category, String productImagePath) {
        this.name = name;
        this.price = price;
        this.description = description;
        this.category = category;
        this.productImagePath = productImagePath;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getProductImagePath() {
        return productImagePath;
    }

    public void setProductImagePath(String productImagePath) {
        this.productImagePath = productImagePath;
    }
}
