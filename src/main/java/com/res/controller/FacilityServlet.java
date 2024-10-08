package com.res.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.res.model.Facility;
import service.FacilityService;

@WebServlet("/facility_index")
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
                 maxFileSize = 1024 * 1024 * 5,
                 maxRequestSize = 1024 * 1024 * 5 * 5)
public class FacilityServlet extends HttpServlet {
    private FacilityService facilityService = new FacilityService();
    private static final String UPLOAD_DIRECTORY = "facility_images";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("edit".equals(action)) {
            int facilityId = Integer.parseInt(request.getParameter("id"));
            try {
                Facility facility = facilityService.getFacilityById(facilityId);
                request.setAttribute("facility", facility);
                request.getRequestDispatcher("/AdminArea/edit_facility.jsp").forward(request, response);
            } catch (SQLException e) {
                throw new ServletException(e);
            }
        } else if ("delete".equals(action)) {
            int facilityId = Integer.parseInt(request.getParameter("id"));
            try {
                facilityService.deleteFacility(facilityId);
                HttpSession session = request.getSession();
                session.setAttribute("alertMessage", "Facility deleted successfully!");
                response.sendRedirect(request.getContextPath() + "/facility_index");
            } catch (SQLException e) {
                throw new ServletException(e);
            }
        } else {
            try {
                List<Facility> facilityList = facilityService.getAllFacilities();
                request.setAttribute("facilityList", facilityList);
                request.getRequestDispatcher("/AdminArea/facility_index.jsp").forward(request, response);
            } catch (SQLException e) {
                throw new ServletException(e);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            
            try {
                Facility facility = facilityService.getFacilityById(id);
                facility.setName(name);
                facility.setDescription(description);

                Part filePart = request.getPart("newFacilityImage");
                if (filePart != null && filePart.getSize() > 0) {
                    String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                    String fileExtension = fileName.substring(fileName.lastIndexOf("."));
                    String newFileName = UUID.randomUUID().toString() + fileExtension;

                    String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) uploadDir.mkdir();

                    String filePath = uploadPath + File.separator + newFileName;
                    filePart.write(filePath);

                    facility.setFacilityImagePath(UPLOAD_DIRECTORY + File.separator + newFileName);
                }

                facilityService.updateFacility(facility);
                
                HttpSession session = request.getSession();
                session.setAttribute("alertMessage", "Facility updated successfully!");
                
                response.sendRedirect(request.getContextPath() + "/facility_index");
            } catch (SQLException e) {
                throw new ServletException(e);
            }
        } else {
            String name = request.getParameter("name");
            String description = request.getParameter("description");

            Part filePart = request.getPart("facilityImage");
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String fileExtension = fileName.substring(fileName.lastIndexOf("."));
            String newFileName = UUID.randomUUID().toString() + fileExtension;

            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();

            String filePath = uploadPath + File.separator + newFileName;
            filePart.write(filePath);

            String facilityImagePath = UPLOAD_DIRECTORY + File.separator + newFileName;

            Facility facility = new Facility(name, description, facilityImagePath);

            try {
                facilityService.addFacility(facility);
                HttpSession session = request.getSession();
                session.setAttribute("alertMessage", "New facility added successfully!");
                response.sendRedirect(request.getContextPath() + "/facility_index");
            } catch (SQLException e) {
                throw new ServletException(e);
            }
        }
    }
}