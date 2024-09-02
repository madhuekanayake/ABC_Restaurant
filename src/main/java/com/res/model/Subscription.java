package com.res.model;

public class Subscription {
    private int id;
    private String email;

    public Subscription() {}

    public Subscription(String email) {
        this.email = email;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}