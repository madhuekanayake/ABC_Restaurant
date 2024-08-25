package service;

import java.sql.SQLException;
import java.util.List;

import com.res.dao.ReservationDAO;
import com.res.model.Reservation;

public class ReservationService {
    private ReservationDAO reservationDAO = new ReservationDAO();

    public void addReservation(Reservation reservation) throws SQLException {
        reservationDAO.addReservation(reservation);
    }
    
    public List<Reservation> getAllReservations() throws SQLException {
        return reservationDAO.getAllReservations();
    }
}
