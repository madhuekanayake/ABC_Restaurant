<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="./assets/img/ABC_logo.jpg">
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminArea/css/admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminArea/css/style.css">
    <title>Edit Gallery Image</title>
    <style>
        /* Form styling */
        

        .form-group {
            margin-bottom: 30px;
        }

        .form-group input[type="text"],
        .form-group input[type="file"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }

        .form-group img {
            margin-top: 10px;
            border-radius: 4px;
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
            background-color: #5cb85c;
            color: #fff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .btn-secondary {
            background-color: #6c757d;
            color: #fff;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }

    </style>
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
        <li>
            <a href="${pageContext.request.contextPath}/AdminArea/facility_index.jsp">
                <i class='bx bx-hotel'></i>
                
                <span class="text">Manage Facilities</span>
            </a>
        </li>
        <li class="active">
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
		<script>
    document.getElementById('logout-link').addEventListener('click', function(event) {
        var confirmation = confirm('Do you want to log out?');
        if (!confirmation) {
            event.preventDefault(); // Prevents the default action (navigation) if the user cancels
        }
    });
</script>
</section>

<section id="content">
    <jsp:include page="./navBar.jsp" />

    <main>
        <div class="head-title">
            <div class="left">
                <h1>Edit Gallery Image</h1>
                <ul class="breadcrumb">
                    <li>
                        <a href="${pageContext.request.contextPath}/gallery_index">Gallery</a>
                    </li>
                    <li><i class='bx bx-chevron-right'></i></li>
                    <li>
                        <a class="active" href="#">Edit</a>
                    </li>
                </ul>
            </div>
        </div>

        <div class="form-container">
            <form action="${pageContext.request.contextPath}/gallery_index?action=update" method="post" enctype="multipart/form-data">
                <input type="hidden" name="id" value="${gallery.id}">
                
                <div class="form-group">
                    <label for="description">Description:</label>
                    <input type="text" id="description" name="description" value="${gallery.description}" required>
                </div>
                
                <div class="form-group">
                    <label for="galleryImage">Current Image:</label>
                    <img src="${pageContext.request.contextPath}/${gallery.galleryImagePath}" alt="Current Gallery Image" width="100">
                </div>
                
                <div class="form-group">
                    <label for="newGalleryImage">New Image (optional):</label>
                    <input type="file" id="newGalleryImage" name="newGalleryImage">
                </div>
                
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Update Gallery Image</button>
                    
                </div>
            </form>
        </div>
    </main>
</section>

<script src="${pageContext.request.contextPath}/AdminArea/js/script.js"></script>
</body>
</html>
