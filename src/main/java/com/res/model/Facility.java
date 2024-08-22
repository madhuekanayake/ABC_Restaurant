package com.res.model;

public class Facility {
    private int id;
    private String name;
    private String description;
    private String facilityImagePath;

    public Facility() {}

    public Facility(String name, String description, String facilityImagePath) {
        this.name = name;
        this.description = description;
        this.facilityImagePath = facilityImagePath;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getFacilityImagePath() {
        return facilityImagePath;
    }

    public void setFacilityImagePath(String facilityImagePath) {
        this.facilityImagePath = facilityImagePath;
    }
}
