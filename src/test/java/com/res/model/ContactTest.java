package com.res.model;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class ContactTest {
	
	private Contact contact;

    @BeforeEach
    public void setUp() {
        
        contact = new Contact("Jane Doe", "jane.doe@example.com", "Inquiry", "I would like more information.");
    }

    @Test
    public void testDefaultConstructor() {
        Contact defaultContact = new Contact(1, "John Smith", "john.smith@example.com", "Support", "Need help with my account.", 1);

        
        assertEquals(1, defaultContact.getId());
        assertEquals("John Smith", defaultContact.getName());
        assertEquals("john.smith@example.com", defaultContact.getEmail());
        assertEquals("Support", defaultContact.getSubject());
        assertEquals("Need help with my account.", defaultContact.getMessage());
        assertEquals(1, defaultContact.getStatus());
    }

    @Test
    public void testParameterizedConstructor() {
        assertEquals("Jane Doe", contact.getName());
        assertEquals("jane.doe@example.com", contact.getEmail());
        assertEquals("Inquiry", contact.getSubject());
        assertEquals("I would like more information.", contact.getMessage());
        assertEquals(0, contact.getStatus()); // Default status should be 0
    }

    @Test
    public void testGettersAndSetters() {
        contact.setId(2);
        contact.setName("Alice Johnson");
        contact.setEmail("alice.johnson@example.com");
        contact.setSubject("Feedback");
        contact.setMessage("Great service, thanks!");
        contact.setStatus(1);

        
        assertEquals(2, contact.getId());
        assertEquals("Alice Johnson", contact.getName());
        assertEquals("alice.johnson@example.com", contact.getEmail());
        assertEquals("Feedback", contact.getSubject());
        assertEquals("Great service, thanks!", contact.getMessage());
        assertEquals(1, contact.getStatus());
    }

    @Test
    public void testToString() {
        
    }

}
