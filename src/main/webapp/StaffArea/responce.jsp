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
    <link rel="stylesheet" href="./css/style.css">
    <title>ABC Restaurant</title>
    
    <style>
        

        /* Form styling */
        .compose-email {
            margin-bottom: 20px;
        }

        .compose-email form {
            background-color: #fafafa;
            padding: 20px;
            border-radius: 8px;
            border: 1px solid #ddd;
        }

        .compose-email input[type="text"],
                .compose-email input[type="email"],
        .compose-email textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }

        .compose-email button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }

        .compose-email button:hover {
            background-color: #0056b3;
        }
        

        /* Button styling */
        .btn {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 4px;
            text-align: center;
            text-decoration: none;
            transition: background-color 0.3s;
            width: 100%;
            border: none;
        }

        .btn-primary {
            background-color: #007bff;
            color: #fff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>
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

                <!-- Email Response Form -->
                <form action="${pageContext.request.contextPath}/SendEmail" method="post" class="compose-email">
                    <div class="form-group">
                        <label for="contactName">Name</label>
                        <input type="text" id="contactName" name="name" class="form-control" value="${param.name}" required placeholder="Name" readonly>
                    </div>
                    <div class="form-group">
                        <label for="contactEmail">Email</label>
                        <input type="email" id="contactEmail" name="email" class="form-control" value="${param.email}" required placeholder="Email" readonly>
                    </div>
                    <div class="form-group">
                        <label for="customerMessage">Customer Message</label>
                        <textarea name="customerMessage" id="customerMessage" class="form-control" required rows="5" readonly>${param.message}</textarea>
                    </div>
                    <div class="form-group">
                        <label for="subject">Subject</label>
                        <input type="text" name="subject" class="form-control" required placeholder="Subject">
                    </div>
                    <div class="form-group">
                        <label for="replyMessage">Reply</label>
                        <textarea name="replyMessage" id="replyMessage" class="form-control" required rows="5" placeholder="Your Message"></textarea>
                    </div>
                    <button type="submit" id="submit" class="btn btn-primary">Send Response</button>
                </form>
            </div>
        </div>
    </main>
</section>

<script src="./js/script.js"></script>
</body>
</html>