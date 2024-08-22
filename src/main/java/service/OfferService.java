package service;

import java.sql.SQLException;
import java.util.List;

import com.res.dao.OfferDAO;
import com.res.model.Offer;

public class OfferService {
    private OfferDAO offerDAO = new OfferDAO();

    public void addOffer(Offer offer) throws SQLException {
        offerDAO.addOffer(offer);
    }

    public List<Offer> getAllOffers() throws SQLException {
        return offerDAO.getAllOffers();
    }

    public void deleteOffer(int id) throws SQLException {
        offerDAO.deleteOffer(id);
    }
}