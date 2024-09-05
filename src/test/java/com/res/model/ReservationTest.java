package com.res.model;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class ReservationTest {
	
	private Reservation reservation;

    @BeforeEach
    public void setUp() {
        // Initialize a reservation object with sample data
        reservation = new Reservation(1, "John Doe", "john@example.com", "1234567890", "2024-09-10", "19:00", "4", "Main Branch", 1);
    }

    @Test
    public void testGetters() {
        assertEquals(1, reservation.getId());
        assertEquals("John Doe", reservation.getName());
        assertEquals("john@example.com", reservation.getEmail());
        assertEquals("1234567890", reservation.getPhone());
        assertEquals("2024-09-10", reservation.getDate());
        assertEquals("19:00", reservation.getTime());
        assertEquals("4", reservation.getPerson());
        assertEquals("Main Branch", reservation.getBranch());
        assertEquals(1, reservation.getStatus());
    }

    @Test
    public void testSetters() {
        // Set new values
        reservation.setId(2);
        reservation.setName("Jane Smith");
        reservation.setEmail("jane@example.com");
        reservation.setPhone("0987654321");
        reservation.setDate("2024-09-12");
        reservation.setTime("18:00");
        reservation.setPerson("2");
        reservation.setBranch("Secondary Branch");
        reservation.setStatus(0);

        // Test if setters correctly updated the fields
        assertEquals(2, reservation.getId());
        assertEquals("Jane Smith", reservation.getName());
        assertEquals("jane@example.com", reservation.getEmail());
        assertEquals("0987654321", reservation.getPhone());
        assertEquals("2024-09-12", reservation.getDate());
        assertEquals("18:00", reservation.getTime());
        assertEquals("2", reservation.getPerson());
        assertEquals("Secondary Branch", reservation.getBranch());
        assertEquals(0, reservation.getStatus());
    }

    @Test
    public void testConstructor() {
        Reservation newReservation = new Reservation(3, "Alice Johnson", "alice@example.com", "1112223333", "2024-10-01", "20:00", "6", "Main Branch", 1);

        assertEquals(3, newReservation.getId());
        assertEquals("Alice Johnson", newReservation.getName());
        assertEquals("alice@example.com", newReservation.getEmail());
        assertEquals("1112223333", newReservation.getPhone());
        assertEquals("2024-10-01", newReservation.getDate());
        assertEquals("20:00", newReservation.getTime());
        assertEquals("6", newReservation.getPerson());
        assertEquals("Main Branch", newReservation.getBranch());
        assertEquals(1, newReservation.getStatus());
    }

}
