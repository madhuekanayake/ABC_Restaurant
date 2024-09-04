<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.res.model.Contact" %>
<%@ page import="com.res.dao.ContactDAO" %>

<%
    // Fetch the contact list from the database
    ContactDAO contactDAO = new ContactDAO();
    List<Contact> contactList = contactDAO.getAllContacts();
    request.setAttribute("contactList", contactList);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="./image/ABC_logo.jpg">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="./css/style.css">
    <title>ABC Restaurant</title>
</head>
<body>

<jsp:include page="./sideBar.jsp" />

<section id="content">
    <jsp:include page="./navBar.jsp" />

    <main class="container">
        <div class="head-title">
            <div class="left">
                <h1>Queries</h1>
                <ul class="breadcrumb">
                    <li><a href="#">Queries</a></li>
                </ul>
            </div>
        </div>

        <div class="table-data">
            <div class="order">
                <div class="head">
                    <h3>Messages</h3>
                    <div class="d-flex align-items-center">
                        <i class='bx bx-search mr-3'></i>
                        <i class='bx bx-filter'></i>
                    </div>
                </div>

                <form action="${pageContext.request.contextPath}/SendEmail" method="post" class="p-4 bg-light rounded shadow-sm">
                    <div class="form-group">
                        <label for="contactName">Name</label>
                        <input type="text" id="contactName" name="name" class="form-control" value="${param.name}" required placeholder="Name">
                    </div>
                    <div class="form-group">
                        <label for="contactEmail">Email</label>
                        <input type="email" id="contactEmail" name="email" class="form-control" value="${param.email}" required placeholder="Email">
                    </div>
                    <div class="form-group">
                        <label for="subject">Subject</label>
                        <input type="text" name="subject" class="form-control" required placeholder="Subject">
                    </div>
                    <div class="form-group">
                        <label for="message">Message</label>
                        <textarea name="message" id="message" class="form-control" required rows="5" placeholder="Your Message"></textarea>
                    </div>
                    <button type="submit" id="submit" class="btn btn-primary">Submit</button>
                </form>

            </div>
        </div>
    </main>
</section>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="./js/script.js"></script>
</body>
</html>
