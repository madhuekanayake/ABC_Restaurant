package service;

import java.sql.SQLException;
import java.util.List;

import com.res.dao.FacilityDAO;
import com.res.model.Facility;

public class FacilityService {
    private FacilityDAO facilityDAO = new FacilityDAO();

    public void addFacility(Facility facility) throws SQLException {
        facilityDAO.addFacility(facility);
    }

    public List<Facility> getAllFacilities() throws SQLException {
        return facilityDAO.getAllFacilities();
    }

    public void deleteFacility(int facilityId) throws SQLException {
        facilityDAO.deleteFacility(facilityId);
    }
    public Facility getFacilityById(int id) throws SQLException {
        return facilityDAO.getFacilityById(id);
    }

    public void updateFacility(Facility facility) throws SQLException {
        facilityDAO.updateFacility(facility);
    }
}