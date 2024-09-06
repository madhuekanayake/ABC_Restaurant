package com.res.model;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class ReservationTest {
	
	private Reservation reservation;

    @BeforeEach
    public void setUp() {
        reservation = new Reservation(1, "John Doe", "john@example.com", "123456789", 
                                      "2024-09-10", "18:30", "4", "Main Branch", 1, false);
    }

    @Test
    public void testGetters() {
        assertEquals(1, reservation.getId());
        assertEquals("John Doe", reservation.getName());
        assertEquals("john@example.com", reservation.getEmail());
        assertEquals("123456789", reservation.getPhone());
        assertEquals("2024-09-10", reservation.getDate());
        assertEquals("18:30", reservation.getTime());
        assertEquals("4", reservation.getPerson());
        assertEquals("Main Branch", reservation.getBranch());
        assertEquals(1, reservation.getStatus());
        assertFalse(reservation.isEmailSent());
    }

    @Test
    public void testSetters() {
        reservation.setId(2);
        reservation.setName("Jane Doe");
        reservation.setEmail("jane@example.com");
        reservation.setPhone("987654321");
        reservation.setDate("2024-09-12");
        reservation.setTime("20:00");
        reservation.setPerson("2");
        reservation.setBranch("Secondary Branch");
        reservation.setStatus(0);
        reservation.setEmailSent(true);

        assertEquals(2, reservation.getId());
        assertEquals("Jane Doe", reservation.getName());
        assertEquals("jane@example.com", reservation.getEmail());
        assertEquals("987654321", reservation.getPhone());
        assertEquals("2024-09-12", reservation.getDate());
        assertEquals("20:00", reservation.getTime());
        assertEquals("2", reservation.getPerson());
        assertEquals("Secondary Branch", reservation.getBranch());
        assertEquals(0, reservation.getStatus());
        assertTrue(reservation.isEmailSent());
    }
}
