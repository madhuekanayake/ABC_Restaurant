<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.res.model.Facility" %>
<%@ page import="com.res.dao.FacilityDAO" %>

<%
    // Fetch the facility list from the database
    FacilityDAO facilityDAO = new FacilityDAO();
    List<Facility> facilityList = facilityDAO.getAllFacilities();
    request.setAttribute("facilityList", facilityList);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="icon" type="image/x-icon" href="./assets/img/ABC_logo.jpg">
    <title>ABC Restaurant</title>
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="./AdminArea/css/other.css">
    <link rel="stylesheet" href="./AdminArea/css/style.css">
        
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
   
        <c:if test="${not empty sessionScope.alertMessage}">
            <div class="alert alert-success">
                ${sessionScope.alertMessage}
            </div>
            <% session.removeAttribute("alertMessage"); %>
        </c:if>
        <div class="head-title">
            <div class="left">
                <h1>Facility List</h1>
                <ul class="breadcrumb">
                    <li>
                        <a href="#">Facilities</a>
                    </li>
                </ul>
            </div>
            <a href="${pageContext.request.contextPath}/AdminArea/add_facility.jsp" class="btn-download">
                <i class='bx bxs-plus-circle'></i>
                <span class="text">Add New Facilities</span>
            </a>
        </div>

      
        <div class="table-data">
            <div class="order">
                <div class="head">
                    <h3>Facilities</h3>
                    <i class='bx bx-search'></i>
                    <i class='bx bx-filter'></i>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Facility Name</th>
                            <th>Description</th>
                            <th>Image</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                       <c:forEach var="facility" items="${facilityList}">
    <tr>
        <td>${facility.id}</td>
        <td>${facility.name}</td>
        <td>${facility.description}</td>
        <td><img src="${pageContext.request.contextPath}/${facility.facilityImagePath}" alt="Facility Image" width="50"></td>
        <td>
            <a href="${pageContext.request.contextPath}/facility_index?action=edit&id=${facility.id}" class="btn-edit"><i class='bx bx-edit'></i></a>
            <a href="${pageContext.request.contextPath}/facility_index?action=delete&id=${facility.id}" class="btn-delete" onclick="return confirm('Are you sure you want to delete this facility?')"><i class='bx bx-trash'></i></a>
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