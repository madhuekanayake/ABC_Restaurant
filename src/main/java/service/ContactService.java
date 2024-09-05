package service;

import java.sql.SQLException;
import java.util.List;

import com.res.dao.ContactDAO;
import com.res.model.Contact;

public class ContactService {
    private ContactDAO contactDAO = new ContactDAO();

    public void addContact(Contact contact) throws SQLException {
        contactDAO.addContact(contact);
    }
    
    public List<Contact> getAllContacts() throws SQLException {
        return contactDAO.getAllContacts();
    }

    public void deleteContact(int id) throws SQLException {
        contactDAO.deleteContact(id);
    }

    public void updateContactStatus(int id, int status) throws SQLException {
        contactDAO.updateContactStatus(id, status);
    }

    public Contact getContactById(int id) throws SQLException {
        return contactDAO.getContactById(id);
    }
}