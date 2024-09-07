<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.res.model.Subscription" %>
<%@ page import="com.res.dao.SubscriptionDAO" %>

<%
    // Fetch the subscription list from the database
    SubscriptionDAO subscriptionDAO = new SubscriptionDAO();
    List<Subscription> subscriptionList = subscriptionDAO.getAllSubscriptions();
    request.setAttribute("subscriptionList", subscriptionList);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC Restaurant - Subscriptions</title>
    <link rel="stylesheet" href="./css/style.css">
    <!-- Include TinyMCE -->
    <script src="https://cdn.tiny.cloud/1/2zwgr1g5gb1lul6y8kux22g6jxrpxupeac7rwd96lg2t8o8t/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
    <script>
        tinymce.init({
            selector: '#emailContent',
            height: 300,
            menubar: false,
            plugins: 'advlist autolink lists link image charmap preview anchor searchreplace visualblocks code fullscreen insertdatetime media table paste code help wordcount',
            toolbar: 'undo redo | formatselect | bold italic backcolor | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | removeformat | help',
            content_css: 'https://www.tiny.cloud/css/codepen.min.css',
            branding: false
        });
    </script>

    <style>
        /* General container styling */
        

        

        

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

        /* Table styling */
        
    </style>
</head>
<body>

<jsp:include page="./sideBar.jsp" />

<section id="content">
    <jsp:include page="./navBar.jsp" />

    <main>
        <div class="head-title">
            <div class="left">
                <h1>Customer Subscriptions</h1>
                <ul class="breadcrumb">
                    <li><a href="#">Subscriptions</a></li>
                </ul>
            </div>
        </div>

        <div class="table-data">
            <div class="order">
                <div class="head">
                    <h3>Subscriptions</h3>
                </div>

                <!-- Email Composition Form -->
                <div class="compose-email">
                    <form action="${pageContext.request.contextPath}/sendBulkEmail" method="post">
                        <input type="text" name="subject" placeholder="Email Subject" required>
                        <textarea id="emailContent" name="emailContent"></textarea>
                        <button type="submit">Send to All Subscribers</button>
                    </form>
                </div>

                <!-- Subscription Table -->
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Email</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="subscription" items="${subscriptionList}">
                            <tr>
                                <td>${subscription.id}</td>
                                <td>${subscription.email}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/subscribe?action=delete&id=${subscription.id}" class="btn-delete" onclick="return confirm('Are you sure you want to delete this subscription?')">
                                        <i class='bx bx-trash'></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </main>
</section>

<script src="./js/script.js"></script>
</body>
</html>