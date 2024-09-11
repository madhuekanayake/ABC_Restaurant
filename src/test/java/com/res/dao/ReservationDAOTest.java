package com.res.dao;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.SQLException;
import java.util.List;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.res.model.Reservation;

public class ReservationDAOTest {

    private ReservationDAO reservationDAO;

    @BeforeEach
    public void setUp() {
        reservationDAO = new ReservationDAO();
        // Optionally set up test database or mock connections
    }

    @AfterEach
    public void tearDown() throws SQLException {
       
        List<Reservation> reservations = reservationDAO.getAllReservations();
        for (Reservation reservation : reservations) {
            reservationDAO.deleteReservation(reservation.getId());
        }
    }

    @Test
    public void testAddReservation() throws SQLException {
        Reservation reservation = new Reservation(0, "John Doe", "johndoe@example.com", "1234567890", "2024-09-09", "18:00", "4", "Main Branch", 0, false);

        reservationDAO.addReservation(reservation);

        List<Reservation> reservations = reservationDAO.getAllReservations();
        assertFalse(reservations.isEmpty(), "Reservation list should not be empty after adding a reservation.");
        Reservation savedReservation = reservations.get(0);
        assertEquals("John Doe", savedReservation.getName());
        assertEquals("johndoe@example.com", savedReservation.getEmail());
        assertEquals("1234567890", savedReservation.getPhone());
        assertEquals("2024-09-09", savedReservation.getDate());
        assertEquals("18:00", savedReservation.getTime());
        assertEquals("4", savedReservation.getPerson());
        assertEquals("Main Branch", savedReservation.getBranch());
        assertEquals(0, savedReservation.getStatus());
        assertFalse(savedReservation.isEmailSent());
    }

    @Test
    public void testGetAllReservations() throws SQLException {
        Reservation reservation1 = new Reservation(0, "John Doe", "john@example.com", "1234567890", "2024-09-09", "18:00", "4", "Main Branch", 0, false);
        Reservation reservation2 = new Reservation(0, "Jane Doe", "jane@example.com", "0987654321", "2024-09-10", "19:00", "2", "Branch 2", 0, false);

        reservationDAO.addReservation(reservation1);
        reservationDAO.addReservation(reservation2);

        List<Reservation> reservations = reservationDAO.getAllReservations();
        assertEquals(2, reservations.size(), "There should be 2 reservations.");
    }

    @Test
    public void testConfirmReservation() throws SQLException {
        Reservation reservation = new Reservation(0, "John Doe", "johndoe@example.com", "1234567890", "2024-09-09", "18:00", "4", "Main Branch", 0, false);

        reservationDAO.addReservation(reservation);

        List<Reservation> reservations = reservationDAO.getAllReservations();
        assertFalse(reservations.isEmpty());

        int reservationId = reservations.get(0).getId();
        reservationDAO.confirmReservation(reservationId);

        List<Reservation> confirmedReservations = reservationDAO.getConfirmedReservations();
        assertEquals(1, confirmedReservations.size(), "There should be 1 confirmed reservation.");
        assertEquals(1, confirmedReservations.get(0).getStatus(), "Reservation status should be confirmed (status = 1).");
    }

    @Test
    public void testDeleteReservation() throws SQLException {
        Reservation reservation = new Reservation(0, "John Doe", "johndoe@example.com", "1234567890", "2024-09-09", "18:00", "4", "Main Branch", 0, false);

        reservationDAO.addReservation(reservation);
        List<Reservation> reservations = reservationDAO.getAllReservations();
        assertFalse(reservations.isEmpty());

        int reservationId = reservations.get(0).getId();
        reservationDAO.deleteReservation(reservationId);

        reservations = reservationDAO.getAllReservations();
        assertTrue(reservations.isEmpty(), "Reservation list should be empty after deletion.");
    }

    @Test
    public void testMarkEmailAsSent() throws SQLException {
        Reservation reservation = new Reservation(0, "John Doe", "johndoe@example.com", "1234567890", "2024-09-09", "18:00", "4", "Main Branch", 0, false);

        reservationDAO.addReservation(reservation);
        List<Reservation> reservations = reservationDAO.getAllReservations();
        int reservationId = reservations.get(0).getId();

        reservationDAO.markEmailAsSent(reservationId);

        reservations = reservationDAO.getAllReservations();
        assertTrue(reservations.get(0).isEmailSent(), "Email should be marked as sent.");
    }
}
