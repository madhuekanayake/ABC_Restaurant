<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.res.model.Review" %>
<%@ page import="com.res.dao.ReviewDAO" %>

<%
    // Fetch the review list from the database
    ReviewDAO reviewDAO = new ReviewDAO();
    List<Review> reviewList = reviewDAO.getAllReviews();
    request.setAttribute("reviewList", reviewList);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="icon" type="image/x-icon" href="./image/ABC_logo.jpg">
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="./css/style.css">
    <title>ABC Restaurant</title>
</head>
<body>

<jsp:include page="./sideBar.jsp" />

<section id="content">
    <jsp:include page="./navBar.jsp" />

    <main>
        <div class="head-title">
            <div class="left">
                <h1>Customer Reviews</h1>
                <ul class="breadcrumb">
                    <li><a href="#">Customer Reviews</a></li>
                </ul>
            </div>
        </div>

        <div class="table-data">
            <div class="order">
                <div class="head">
                    <h3>Customer Reviews</h3>
                    <i class='bx bx-search'></i>
                    <i class='bx bx-filter'></i>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Feedback</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="review" items="${reviewList}">
                            <tr>
                                <td>${review.id}</td>
                                <td>${review.username}</td>
                                <td>${review.message}</td>
                                
                                <td>
    <a href="${pageContext.request.contextPath}/reviews?action=delete&id=${review.id}" class="btn-delete" onclick="return confirm('Are you sure you want to delete this review?')">
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
