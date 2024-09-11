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

        final String username = "kingchamod2001@gmail.com"; 
        final String password = "jbta ymaz vqxi gwgb"; 

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
            	    + "<head>"
            	    + "<meta charset=\"UTF-8\">"
            	    + "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">"
            	    + "<title>ABC Restaurant - Reservation Confirmation</title>"
            	    + "</head>"
            	    + "<body style=\"font-family: Arial, sans-serif; line-height: 1.6; color: #333333; max-width: 600px; margin: 0 auto; padding: 20px;\">"
            	    + "<header style=\"text-align: center; margin-bottom: 20px;\">"
            	    + "<img src=\"https://example.com/abc_logo.jpg\" alt=\"ABC Restaurant Logo\" style=\"max-width: 150px; height: auto;\">"
            	    + "</header>"
            	    + "<main>"
            	    + "<h1 style=\"color: #4A4A4A; text-align: center; margin-bottom: 20px;\">Reservation Confirmation</h1>"
            	    + "<p>Dear " + name + ",</p>"
            	    + "<p>Thank you for making a reservation at ABC Restaurant. We are pleased to confirm your booking.</p>"
            	    + "<div style=\"background-color: #f8f8f8; border-left: 4px solid #4CAF50; padding: 15px; margin: 20px 0;\">"
            	    + "<h2 style=\"color: #4CAF50; margin-top: 0;\">Your Reservation Details:</h2>"
            	    + "<p style=\"margin-bottom: 0;\">" + userMessage + "</p>"
            	    + "</div>"
            	    + "<h2 style=\"color: #4A4A4A;\">Staff Response:</h2>"
            	    + "<p>" + staffReply + "</p>"
            	    + "<p>If you have any questions or need further assistance, please don't hesitate to contact us.</p>"
            	    + "</main>"
            	    + "<footer style=\"margin-top: 30px; text-align: center; color: #777;\">"
            	    + "<p>Best regards,<br>The ABC Restaurant Team</p>"
            	    + "<p style=\"font-size: 0.9em;\">ABC Restaurant<br>ABC Restaurant\r\n"
            	    + "WRGW+QJG, Baladaksha Mawatha, Colombo<br>Phone: +94 11 234 5678 | Email: abcrestaurant@gmail.com</p>"
            	    + "</footer>"
            	    + "</body>"
            	    + "</html>";

            MimeBodyPart textPart = new MimeBodyPart();
            textPart.setContent(htmlContent, "text/html");

            Multipart multipart = new MimeMultipart();
            multipart.addBodyPart(textPart);

            message.setContent(multipart);

            Transport.send(message);

            
            ReservationDAO reservationDAO = new ReservationDAO();
            reservationDAO.markEmailAsSent(id);

            response.sendRedirect(request.getContextPath() + "/StaffArea/confirmed_reservationSuccess.jsp");

        } catch (Exception e) {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<center><h2 style='color:red;'>Error Sending Email!</h2></center>");
            e.printStackTrace(out);
        }
    }
}