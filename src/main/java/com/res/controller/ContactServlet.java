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
            
            // Set success message in session
            HttpSession session = request.getSession();
            session.setAttribute("successMessage", "Your message has been successfully sent!");

            response.sendRedirect(request.getContextPath() + "/PublicArea/contact.jsp");
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Contact> contactList = contactService.getAllContacts();
            request.setAttribute("contactList", contactList);
            request.getRequestDispatcher("/WEB-INF/views/contact_list.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

}
