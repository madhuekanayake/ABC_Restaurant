package service;

import com.res.dao.AdminDAO;
import com.res.model.Admin;

import java.sql.SQLException;

public class AdminService {
    private AdminDAO adminDAO = new AdminDAO();

    public Admin authenticateAdmin(String username, String password) throws SQLException {
        return adminDAO.authenticate(username, password);
    }
}
