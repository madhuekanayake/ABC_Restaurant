package com.res.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.res.model.Staff;
import service.StaffService;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

@WebServlet("/staff")
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
                 maxFileSize = 1024 * 1024 * 5, 
                 maxRequestSize = 1024 * 1024 * 5 * 5)
public class StaffServlet extends HttpServlet {
    private StaffService staffService = new StaffService();
    private static final String UPLOAD_DIRECTORY = "uploads";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("edit".equals(action)) {
            handleEditRequest(request, response);
        } else if ("delete".equals(action)) {
            handleDeleteRequest(request, response);
        } else {
            displayStaffList(request, response);
        }
    }

    private void handleEditRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int staffId = Integer.parseInt(request.getParameter("id"));
        try {
            Staff staff = staffService.getStaffById(staffId);
            request.setAttribute("staff", staff);
            request.getRequestDispatcher("/AdminArea/edit_staff.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void handleDeleteRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int staffId = Integer.parseInt(request.getParameter("id"));
        try {
            staffService.deleteStaff(staffId);
            HttpSession session = request.getSession();
            session.setAttribute("alertMessage", "Staff member deleted successfully!");
            response.sendRedirect(request.getContextPath() + "/staff");
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void displayStaffList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Staff> staffList = staffService.getAllStaff();
            request.setAttribute("staffList", staffList);
            request.getRequestDispatcher("/AdminArea/staff_index.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("update".equals(action)) {
            handleUpdateRequest(request, response);
        } else {
            handleAddRequest(request, response);
        }
    }

    private void handleUpdateRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Staff staff = staffService.getStaffById(id);
            staff.setName(name);
            staff.setEmail(email);
            staff.setPassword(password);

            Part filePart = request.getPart("newProfileImage");
            if (filePart != null && filePart.getSize() > 0) {
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                String fileExtension = fileName.substring(fileName.lastIndexOf("."));
                String newFileName = UUID.randomUUID().toString() + fileExtension;

                String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdir();

                String filePath = uploadPath + File.separator + newFileName;
                filePart.write(filePath);

                staff.setProfileImagePath(UPLOAD_DIRECTORY + File.separator + newFileName);
            }

            staffService.updateStaff(staff);
            
            HttpSession session = request.getSession();
            session.setAttribute("alertMessage", "Staff member updated successfully!");
            response.sendRedirect(request.getContextPath() + "/staff");
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void handleAddRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Part filePart = request.getPart("profileImage");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String fileExtension = fileName.substring(fileName.lastIndexOf("."));
        String newFileName = UUID.randomUUID().toString() + fileExtension;

        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        String filePath = uploadPath + File.separator + newFileName;
        filePart.write(filePath);

        String profileImagePath = UPLOAD_DIRECTORY + File.separator + newFileName;

        Staff staff = new Staff(name, email, password, profileImagePath);

        try {
            staffService.addStaff(staff);
            HttpSession session = request.getSession();
            session.setAttribute("alertMessage", "New staff member added successfully!");
            response.sendRedirect(request.getContextPath() + "/staff");
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}