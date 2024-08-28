<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.res.model.Staff" %>
<%@ page import="com.res.dao.StaffDAO" %>

<%
// Fetch the staff list from the database
StaffDAO staffDAO = new StaffDAO();
List<Staff> staffList = staffDAO.getAllStaff();
request.setAttribute("staffList", staffList);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminArea/css/admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminArea/css/style.css">
    <title>Staff List</title>
</head>
<body>

    <section id="sidebar">
    <a href="#" class="brand">
        <i class='bx bxs-smile'></i>
        <span class="text">Admin ABC</span>
    </a>
    <ul class="side-menu top">
        <li class="">
            <a href="${pageContext.request.contextPath}/AdminArea/dashboard.jsp">
                <i class='bx bxs-dashboard'></i>
                <span class="text">Dashboard</span>
            </a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/AdminArea/product_index.jsp">
                <i class='bx bx-restaurant'></i>
                
                <span class="text">Manage Products</span>
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
                    <h1>Staff Members List</h1>
                    <ul class="breadcrumb">
                        <li>
                            <a href="#">Staff</a>
                        </li>
                    </ul>
                </div>
                <a href="${pageContext.request.contextPath}/AdminArea/add_staff.jsp" class="btn-download">
                    <i class='bx bxs-plus-circle'></i>
                    <span class="text">Add New Staff Members</span>
                </a>
            </div>

            <div class="table-data">
                <div class="order">
                    <div class="head">
                        <h3>Staff Members</h3>
                        <i class='bx bx-search'></i>
                        <i class='bx bx-filter'></i>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Staff Member Name</th>
                                <th>Email</th>
                                <th>Password</th>
                                <th>Profile Image</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                           <c:forEach var="staff" items="${staffList}">
    <tr>
        <td>${staff.id}</td>
        <td>${staff.name}</td>
        <td>${staff.email}</td>
        <td>${staff.password}</td>
        <td>
            <img src="${pageContext.request.contextPath}/${staff.profileImagePath}" alt="${staff.name}" width="50">
        </td>
        <td>
            <a href="${pageContext.request.contextPath}/AdminArea/edit_staff.jsp?id=${staff.id}" class="btn-edit">Edit</a>
            <a href="${pageContext.request.contextPath}/staff?action=delete&id=${staff.id}" class="btn-delete" onclick="return confirm('Are you sure you want to delete this staff member?')"><i class='bx bx-trash'></i>
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

    <script src="${pageContext.request.contextPath}/AdminArea/js/script.js"></script>
</body>
</html>
