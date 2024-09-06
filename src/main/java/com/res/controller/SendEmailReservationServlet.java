package com.res.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.res.dao.ReservationDAO;

@WebServlet(name = "SendEmailResrvation", urlPatterns = {"/SendEmailResrvation"})
public class SendEmailReservationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String userMessage = request.getParameter("customerMessage");
        String staffReply = request.getParameter("replyMessage");

        final String username = "kingchamod2001@gmail.com"; // Replace with your email
        final String password = "jbta ymaz vqxi gwgb"; // Replace with your password

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject(subject);

            String htmlContent = "<!DOCTYPE html>"
                + "<html lang=\"en\">"
                + "<body>"
                + "<h1>Reservation Confirmation</h1>"
                + "<p>Dear " + name + ",</p>"
                + "<p>" + userMessage + "</p>"
                + "<p>" + staffReply + "</p>"
                + "<footer>ABC Restaurant Team</footer>"
                + "</body>"
                + "</html>";

            MimeBodyPart textPart = new MimeBodyPart();
            textPart.setContent(htmlContent, "text/html");

            Multipart multipart = new MimeMultipart();
            multipart.addBodyPart(textPart);

            message.setContent(multipart);

            Transport.send(message);

            // Mark the email as sent in the database
            ReservationDAO reservationDAO = new ReservationDAO();
            reservationDAO.markEmailAsSent(id);

            response.sendRedirect(request.getContextPath() + "/StaffArea/confirmed_reservations.jsp");

        } catch (Exception e) {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<center><h2 style='color:red;'>Error Sending Email!</h2></center>");
            e.printStackTrace(out);
        }
    }
}