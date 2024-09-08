package service;

import java.sql.SQLException;
import java.util.List;

import com.res.dao.StaffDAO;
import com.res.model.Staff;

public class StaffService {
    private StaffDAO staffDAO = new StaffDAO();

    public void addStaff(Staff staff) throws SQLException {
        staffDAO.addStaff(staff);
    }

    public List<Staff> getAllStaff() throws SQLException {
        return staffDAO.getAllStaff();
    }

    public void deleteStaff(int staffId) throws SQLException {
        staffDAO.deleteStaff(staffId);
    }
    
    public Staff authenticateStaff(String username, String password) throws SQLException {
        return staffDAO.getStaffByUsernameAndPassword(username, password);
    }

    public int getTotalStaffCount() throws SQLException {
        return staffDAO.getTotalStaffCount();
    }
    public Staff getStaffById(int id) throws SQLException {
        return staffDAO.getStaffById(id);
    }

    public void updateStaff(Staff staff) throws SQLException {
        staffDAO.updateStaff(staff);
    }
}