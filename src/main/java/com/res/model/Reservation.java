package com.res.model;

public class Reservation {
    private int id;
    private String name;
    private String email;
    private String phone;
    private String date;
    private String time;
    private String person;
    private String branch;
    private int status;
    private boolean emailSent;

    public Reservation(int id, String name, String email, String phone, String date, String time, String person, String branch, int status, boolean emailSent) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.date = date;
        this.time = time;
        this.person = person;
        this.branch = branch;
        this.status = status;
        this.emailSent = emailSent;
    }

    // Getters and setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getDate() { return date; }
    public void setDate(String date) { this.date = date; }

    public String getTime() { return time; }
    public void setTime(String time) { this.time = time; }

    public String getPerson() { return person; }
    public void setPerson(String person) { this.person = person; }

    public String getBranch() { return branch; }
    public void setBranch(String branch) { this.branch = branch; }

    public int getStatus() { return status; }
    public void setStatus(int status) { this.status = status; }

    public boolean isEmailSent() { return emailSent; }
    public void setEmailSent(boolean emailSent) { this.emailSent = emailSent; }
}