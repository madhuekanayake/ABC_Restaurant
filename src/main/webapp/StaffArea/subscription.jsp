<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.res.model.Subscription" %>
<%@ page import="com.res.dao.SubscriptionDAO" %>

<%
    // Fetch the review list from the database
    SubscriptionDAO subscriptionDAO = new SubscriptionDAO();
    List<Subscription> subscriptionList = subscriptionDAO.getAllSubscriptions();
    request.setAttribute("subscriptionList", subscriptionList);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Subscription List</title>
    <link rel="stylesheet" href="./css/style.css">
</head>
<body>

<jsp:include page="./sideBar.jsp" />

<section id="content">
    <jsp:include page="./navBar.jsp" />

    <main>
        <div class="head-title">
            <div class="left">
                <h1>Subscriptions</h1>
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