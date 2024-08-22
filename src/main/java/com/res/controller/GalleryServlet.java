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
import javax.servlet.http.Part;

import com.res.model.Gallery;
import service.GalleryService;

@WebServlet("/gallery_index")
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
                 maxFileSize = 1024 * 1024 * 5,
                 maxRequestSize = 1024 * 1024 * 5 * 5)
public class GalleryServlet extends HttpServlet {
    private GalleryService galleryService = new GalleryService();
    private static final String UPLOAD_DIRECTORY = "gallery_images";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("delete".equals(action)) {
            int galleryId = Integer.parseInt(request.getParameter("id"));
            try {
                galleryService.deleteGalleryImage(galleryId);
                response.sendRedirect(request.getContextPath() + "/gallery_index");
            } catch (SQLException e) {
                throw new ServletException(e);
            }
        } else {
            try {
                List<Gallery> galleryList = galleryService.getAllGalleryImages();
                request.setAttribute("galleryList", galleryList);
                request.getRequestDispatcher("/AdminArea/gallery_index.jsp").forward(request, response);
            } catch (SQLException e) {
                throw new ServletException(e);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String description = request.getParameter("description");

        // Handle file upload
        Part filePart = request.getPart("galleryImage");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String fileExtension = fileName.substring(fileName.lastIndexOf("."));
        String newFileName = UUID.randomUUID().toString() + fileExtension;

        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        String filePath = uploadPath + File.separator + newFileName;
        filePart.write(filePath);

        String galleryImagePath = UPLOAD_DIRECTORY + File.separator + newFileName;

        Gallery gallery = new Gallery(description, galleryImagePath);

        try {
            galleryService.addGalleryImage(gallery);
            response.sendRedirect(request.getContextPath() + "/gallery_index");
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}