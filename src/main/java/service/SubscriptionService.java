package service;

import java.sql.SQLException;
import java.util.List;

import com.res.dao.SubscriptionDAO;
import com.res.model.Subscription;

public class SubscriptionService {
    private SubscriptionDAO subscriptionDAO = new SubscriptionDAO();

    public void addSubscription(Subscription subscription) throws SQLException {
        subscriptionDAO.addSubscription(subscription);
    }

    public List<Subscription> getAllSubscriptions() throws SQLException {
        return subscriptionDAO.getAllSubscriptions();
    }

    public void deleteSubscription(int id) throws SQLException {
        subscriptionDAO.deleteSubscription(id);
    }
}