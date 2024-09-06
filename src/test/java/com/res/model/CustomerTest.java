package com.res.model;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class CustomerTest {
	
	private Customer customer;

    @BeforeEach
    public void setUp() {
        // Initialize the customer object before each test
        customer = new Customer("john_doe", "john@example.com", "password123");
    }

    @Test
    public void testCustomerConstructor() {
        // Test if the constructor initializes the object correctly
        assertEquals("john_doe", customer.getUsername());
        assertEquals("john@example.com", customer.getEmail());
        assertEquals("password123", customer.getPassword());
    }

    @Test
    public void testSettersAndGetters() {
        // Test setters and getters for all properties

        // Set and check ID
        customer.setId(1);
        assertEquals(1, customer.getId());

        // Set and check Username
        customer.setUsername("jane_doe");
        assertEquals("jane_doe", customer.getUsername());

        // Set and check Email
        customer.setEmail("jane@example.com");
        assertEquals("jane@example.com", customer.getEmail());

        // Set and check Password
        customer.setPassword("newpassword");
        assertEquals("newpassword", customer.getPassword());
    }

    @Test
    public void testDefaultConstructor() {
        // Test default constructor (no arguments)
        Customer defaultCustomer = new Customer();
        assertNull(defaultCustomer.getUsername());
        assertNull(defaultCustomer.getEmail());
        assertNull(defaultCustomer.getPassword());
        assertEquals(0, defaultCustomer.getId());
    }

}
