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
}