package com.res.model;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class AdminTest {
	
	private Admin admin;

    @BeforeEach
    public void setUp() {
        admin = new Admin();
    }

    @Test
    public void testSetAndGetId() {
        admin.setId(1);
        assertEquals(1, admin.getId());
    }

    @Test
    public void testSetAndGetUsername() {
        admin.setUsername("adminUser");
        assertEquals("adminUser", admin.getUsername());
    }

    @Test
    public void testSetAndGetPassword() {
        admin.setPassword("securePass123");
        assertEquals("securePass123", admin.getPassword());
    }

    @Test
    public void testConstructor() {
        Admin adminWithArgs = new Admin(); // Modify if you have parameterized constructors
        adminWithArgs.setId(2);
        adminWithArgs.setUsername("secondAdmin");
        adminWithArgs.setPassword("pass456");

        assertEquals(2, adminWithArgs.getId());
        assertEquals("secondAdmin", adminWithArgs.getUsername());
        assertEquals("pass456", adminWithArgs.getPassword());
    }
}


