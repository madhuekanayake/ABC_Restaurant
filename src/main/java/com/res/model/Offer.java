package com.res.model;

public class Offer {
    private int id;
    private String description;
    private String offerImagePath;

    public Offer() {}

    public Offer(String description, String offerImagePath) {
        this.description = description;
        this.offerImagePath = offerImagePath;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getOfferImagePath() {
        return offerImagePath;
    }

    public void setOfferImagePath(String offerImagePath) {
        this.offerImagePath = offerImagePath;
    }
}
