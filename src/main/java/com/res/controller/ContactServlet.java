package com.res.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.res.model.Contact;
import service.ContactService;

@WebServlet("/contact")
public class ContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ContactService contactService = new ContactService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        Contact contact = new Contact(name, email, subject, message);
        try {
            contactService.addContact(contact);
            
            HttpSession session = request.getSession();
            session.setAttribute("successMessage", "Your message has been successfully sent!");

            response.sendRedirect(request.getContextPath() + "/PublicArea/contact.jsp");
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if (action == null) {
            listContacts(request, response);
        } else {
            switch (action) {
                case "delete":
                    deleteContact(request, response);
                    break;
                case "updateStatus":
                    updateContactStatus(request, response);
                    break;
                default:
                    listContacts(request, response);
                    break;
            }
        }
    }

    private void listContacts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Contact> contactList = contactService.getAllContacts();
            request.setAttribute("contactList", contactList);
            request.getRequestDispatcher("/StaffArea/contact.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void deleteContact(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            contactService.deleteContact(id);
            response.sendRedirect(request.getContextPath() + "/AdminArea/contact.jsp");
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void updateContactStatus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int status = Integer.parseInt(request.getParameter("status"));
        try {
            Contact contact = contactService.getContactById(id);
            contactService.updateContactStatus(id, status);
            
            // URL encode the name and email to handle special characters
            String encodedName = java.net.URLEncoder.encode(contact.getName(), "UTF-8");
            String encodedEmail = java.net.URLEncoder.encode(contact.getEmail(), "UTF-8");
            
            response.sendRedirect(request.getContextPath() + "/StaffArea/responce.jsp?name=" + encodedName + "&email=" + encodedEmail);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}