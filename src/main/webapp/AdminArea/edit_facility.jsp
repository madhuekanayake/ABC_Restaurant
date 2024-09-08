<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="./assets/img/ABC_logo.jpg">
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="./AdminArea/css/other.css">
    <link rel="stylesheet" href="./AdminArea/css/style.css">
    <title>Edit Facility</title>
    
</head>
<body>
<section id="sidebar">
    <a href="#" class="brand">
        <i class='bx bxs-smile'></i>
        <span class="text">Admin ABC</span>
    </a>
    <ul class="side-menu top">
        <li>
            <a href="${pageContext.request.contextPath}/AdminArea/dashboard.jsp">
                <i class='bx bxs-dashboard'></i>
                <span class="text">Dashboard</span>
            </a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/AdminArea/product_index.jsp">
                <i class='bx bx-restaurant'></i>
                <span class="text">Manage Product</span>
            </a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/AdminArea/gallery_index.jsp">
                <i class='bx bx-images'></i>
                <span class="text">Manage Gallery</span>
            </a>
        </li>
        <li class="active">
            <a href="${pageContext.request.contextPath}/AdminArea/facility_index.jsp">
                <i class='bx bx-hotel'></i>
                <span class="text">Manage Facilities</span>
            </a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/AdminArea/offer_index.jsp">
                <i class='bx bx-purchase-tag'></i>
                <span class="text">Manage Offers</span>
            </a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/AdminArea/staff_index.jsp">
                <i class='bx bx-user-plus'></i>
                <span class="text">Manage Staff</span>
            </a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/AdminArea/customer_index.jsp">
                <i class='bx bx-id-card'></i>
                <span class="text">View Customers</span>
            </a>
        </li>
        <li>
            <a href="./contact.jsp">
                <i class='bx bx-envelope'></i>
                <span class="text">Queries</span>
            </a>
        </li>
    </ul>
    <ul class="side-menu">
        <li>
            <a href="./admin_login.jsp" class="logout" id="logout-link">
                <i class='bx bxs-log-out-circle'></i>
                <span class="text">Logout</span>
            </a>
        </li>
    </ul>
</section>

<section id="content">
    <jsp:include page="./navBar.jsp" />

    <main>
        <div class="head-title">
            <div class="left">
                <h1>Edit Facility</h1>
                <ul class="breadcrumb">
                    <li>
                        <a href="${pageContext.request.contextPath}/facility_index">Facilities</a>
                    </li>
                    <li><i class='bx bx-chevron-right'></i></li>
                    <li>
                        <a class="active" href="#">Edit</a>
                    </li>
                </ul>
            </div>
        </div>

        <div class="form-container">
            <form action="${pageContext.request.contextPath}/facility_index?action=update" method="post" enctype="multipart/form-data">
                <input type="hidden" name="id" value="${facility.id}">
                
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" value="${facility.name}" required>
                </div>
                
                <div class="form-group">
                    <label for="description">Description:</label>
                    <input type="text" id="description" name="description" value="${facility.description}" required>
                </div>
                
                <div class="form-group">
                    <label for="facilityImage">Current Image:</label>
                    <img src="${pageContext.request.contextPath}/${facility.facilityImagePath}" alt="Current Facility Image" width="100">
                </div>
                
                <div class="form-group">
                    <label for="newFacilityImage">New Image (optional):</label>
                    <input type="file" id="newFacilityImage" name="newFacilityImage">
                </div>
                
                <div class="form-group">
                    <button type="submit" class="btn-update">Update Facility</button>
                </div>
            </form>
        </div>
    </main>
</section>

<script src="${pageContext.request.contextPath}/AdminArea/js/script.js"></script>
<script>
    document.getElementById('logout-link').addEventListener('click', function(event) {
        var confirmation = confirm('Do you want to log out?');
        if (!confirmation) {
            event.preventDefault();
        }
    });
</script>
</body>
</html>