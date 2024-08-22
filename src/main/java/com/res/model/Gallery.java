package com.res.model;

public class Gallery {
	
	private int id;
    private String description;
    private String galleryImagePath;

    public Gallery() {}

    public Gallery(String description, String galleryImagePath) {
        this.description = description;
        this.galleryImagePath = galleryImagePath;
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

    public String getGalleryImagePath() {
        return galleryImagePath;
    }

    public void setGalleryImagePath(String galleryImagePath) {
        this.galleryImagePath = galleryImagePath;
    }

}
