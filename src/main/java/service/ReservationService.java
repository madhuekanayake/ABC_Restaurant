package service;

import java.sql.SQLException;

import com.res.dao.ReservationDAO;
import com.res.model.Reservation;

public class ReservationService {
    private ReservationDAO reservationDAO = new ReservationDAO();

    public void addReservation(Reservation reservation) throws SQLException {
        reservationDAO.addReservation(reservation);
    }
}
