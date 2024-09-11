package com.res.model;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class StaffTest {

    private Staff staff;

    @BeforeEach
    public void setUp() {
        // Initialize the Staff object with default values
        staff = new Staff();
        staff.setId(1);
        staff.setName("John Doe");
        staff.setEmail("johndoe@example.com");
        staff.setPassword("password123");
        staff.setProfileImagePath("/images/staff1.jpg");
    }

    @Test
    public void testGetId() {
        assertEquals(1, staff.getId());
    }

    @Test
    public void testSetId() {
        staff.setId(2);
        assertEquals(2, staff.getId());
    }

    @Test
    public void testGetName() {
        assertEquals("John Doe", staff.getName());
    }

    @Test
    public void testSetName() {
        staff.setName("Jane Doe");
        assertEquals("Jane Doe", staff.getName());
    }

    @Test
    public void testGetEmail() {
        assertEquals("johndoe@example.com", staff.getEmail());
    }

    @Test
    public void testSetEmail() {
        staff.setEmail("janedoe@example.com");
        assertEquals("janedoe@example.com", staff.getEmail());
    }

    @Test
    public void testGetPassword() {
        assertEquals("password123", staff.getPassword());
    }

    @Test
    public void testSetPassword() {
        staff.setPassword("newpassword123");
        assertEquals("newpassword123", staff.getPassword());
    }

    @Test
    public void testGetProfileImagePath() {
        assertEquals("/images/staff1.jpg", staff.getProfileImagePath());
    }

    @Test
    public void testSetProfileImagePath() {
        staff.setProfileImagePath("/images/staff2.jpg");
        assertEquals("/images/staff2.jpg", staff.getProfileImagePath());
    }
}
