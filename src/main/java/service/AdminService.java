package service;

import com.res.dao.AdminDAO;
import com.res.model.Admin;

import java.sql.SQLException;

public class AdminService {
    private AdminDAO adminDAO = new AdminDAO();

    public static final int AUTH_SUCCESS = 0;
    public static final int INVALID_USERNAME = 1;
    public static final int INVALID_PASSWORD = 2;

    public int authenticateAdmin(String username, String password) throws SQLException {
        return adminDAO.authenticate(username, password);
    }

    public Admin getAdminByUsername(String username) throws SQLException {
        return adminDAO.getAdminByUsername(username);
    }
}