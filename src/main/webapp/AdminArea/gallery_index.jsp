<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.res.model.Gallery" %>
<%@ page import="com.res.dao.GalleryDAO" %>

<%
    // Fetch the product list from the database
    GalleryDAO galleryDAO = new GalleryDAO();
    List<Gallery> galleryList = galleryDAO.getAllGalleryImages();
    request.setAttribute("galleryList", galleryList);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminArea/css/admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminArea/css/style.css">

    <title>Gallery List</title>
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
                <h1>Gallery List</h1>
                <ul class="breadcrumb">
                    <li>
                        <a href="#">Gallery</a>
                    </li>
                </ul>
            </div>
            <a href="${pageContext.request.contextPath}/AdminArea/add_gallery.jsp" class="btn-download">
                <i class='bx bxs-plus-circle'></i>
                <span class="text">Add New Gallery Image</span>
            </a>
        </div>

        <div class="table-data">
            <div class="order">
                <div class="head">
                    <h3>Gallery Images</h3>
                    <i class='bx bx-search'></i>
                    <i class='bx bx-filter'></i>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Image</th>
                            <th>Description</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="gallery" items="${galleryList}">
                            <tr>
                                <td>${gallery.id}</td>
                                <td><img src="${pageContext.request.contextPath}/${gallery.galleryImagePath}" alt="Gallery Image" width="50"></td>
                                <td>${gallery.description}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/AdminArea/edit_gallery.jsp?id=${gallery.id}" class="btn-edit">Edit</a>
                                    <a href="${pageContext.request.contextPath}/gallery_index?action=delete&id=${gallery.id}" class="btn-delete" onclick="return confirm('Are you sure you want to delete this gallery image?')">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </main>
</section>

<script src="${pageContext.request.contextPath}/AdminArea/js/script.js"></script>
</body>
</html>