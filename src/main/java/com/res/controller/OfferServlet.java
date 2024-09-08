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

import com.res.model.Offer;
import service.OfferService;

@WebServlet("/offer_index")
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
                 maxFileSize = 1024 * 1024 * 5, 
                 maxRequestSize = 1024 * 1024 * 5 * 5)
public class OfferServlet extends HttpServlet {
    private OfferService offerService = new OfferService();
    private static final String UPLOAD_DIRECTORY = "offer_images";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("edit".equals(action)) {
            int offerId = Integer.parseInt(request.getParameter("id"));
            try {
                Offer offer = offerService.getOfferById(offerId);
                request.setAttribute("offer", offer);
                request.getRequestDispatcher("/AdminArea/edit_offer.jsp").forward(request, response);
            } catch (SQLException e) {
                throw new ServletException(e);
            }
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            try {
                offerService.deleteOffer(id);
                HttpSession session = request.getSession();
                session.setAttribute("alertMessage", "Offer deleted successfully!");
            } catch (SQLException e) {
                throw new ServletException(e);
            }
            response.sendRedirect(request.getContextPath() + "/offer_index");
        } else {
            try {
                List<Offer> offerList = offerService.getAllOffers();
                request.setAttribute("offerList", offerList);
                request.getRequestDispatcher("/AdminArea/offer_index.jsp").forward(request, response);
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
            String description = request.getParameter("description");
            
            try {
                Offer offer = offerService.getOfferById(id);
                offer.setDescription(description);

                Part filePart = request.getPart("newOfferImage");
                if (filePart != null && filePart.getSize() > 0) {
                    String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                    String fileExtension = fileName.substring(fileName.lastIndexOf("."));
                    String newFileName = UUID.randomUUID().toString() + fileExtension;

                    String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) uploadDir.mkdir();

                    String filePath = uploadPath + File.separator + newFileName;
                    filePart.write(filePath);

                    offer.setOfferImagePath(UPLOAD_DIRECTORY + File.separator + newFileName);
                }

                offerService.updateOffer(offer);
                
                HttpSession session = request.getSession();
                session.setAttribute("alertMessage", "Offer updated successfully!");
                
                response.sendRedirect(request.getContextPath() + "/offer_index");
            } catch (SQLException e) {
                throw new ServletException(e);
            }
        } else {
            // Adding a new offer
            String description = request.getParameter("description");

            Part filePart = request.getPart("offerImage");
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String fileExtension = fileName.substring(fileName.lastIndexOf("."));
            String newFileName = UUID.randomUUID().toString() + fileExtension;

            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();

            String filePath = uploadPath + File.separator + newFileName;
            filePart.write(filePath);
     
            String offerImagePath = UPLOAD_DIRECTORY + File.separator + newFileName;

            Offer offer = new Offer(description, offerImagePath);

            try {
                offerService.addOffer(offer);
                HttpSession session = request.getSession();
                session.setAttribute("alertMessage", "New offer added successfully!");
                response.sendRedirect(request.getContextPath() + "/offer_index");
            } catch (SQLException e) {
                throw new ServletException(e);
            }
        }
    }
}