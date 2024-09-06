package com.res.controller;

import java.io.IOException;
import java.util.List;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.res.dao.SubscriptionDAO;
import com.res.model.Subscription;

@WebServlet("/sendBulkEmail")
public class SendEmailToAllSubscribersServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String subject = request.getParameter("subject");
        String emailContent = request.getParameter("emailContent");

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
            SubscriptionDAO subscriptionDAO = new SubscriptionDAO();
            List<Subscription> subscriptions = subscriptionDAO.getAllSubscriptions();

            for (Subscription subscription : subscriptions) {
                Message message = new MimeMessage(session);
                message.setFrom(new InternetAddress(username));
                message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(subscription.getEmail()));
                message.setSubject(subject);

                MimeBodyPart textPart = new MimeBodyPart();
                textPart.setContent(emailContent, "text/html");

                Multipart multipart = new MimeMultipart();
                multipart.addBodyPart(textPart);

                message.setContent(multipart);

                Transport.send(message);
            }

            request.getSession().setAttribute("success", "Bulk email sent successfully.");
            response.sendRedirect(request.getContextPath() + "/StaffArea/subscription.jsp");

        } catch (Exception e) {
            request.getSession().setAttribute("error", "Error sending bulk email: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/StaffArea/subscription.jsp");
        }
    }
}