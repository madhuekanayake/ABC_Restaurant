<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="./assets/img/ABC_logo.jpg">
	<!-- Boxicons -->
	<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
	<!-- My CSS -->
	<link rel="stylesheet" href="./css/style.css">
	<link rel="stylesheet" href="./css/other.css">
	

	<title>ABC Restaurant</title>
	
</head>
<body>

<jsp:include page="./sideBar.jsp" />

<!-- CONTENT -->
<section id="content">
	<jsp:include page="./navBar.jsp" />

	<!-- MAIN -->
	<main>
		<div class="head-title">
			<div class="left">
				<h1>Add New Facility</h1>
				<ul class="breadcrumb">
					<li>
						<a href="#">Dashboard</a>
					</li>
					<li><i class='bx bx-chevron-right'></i></li>
					<li>
						<a class="active" href="#">Add Facility</a>
					</li>
				</ul>
			</div>
		</div>

		<div class="form-container">
			<form action="${pageContext.request.contextPath}/facility_index" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="facilityName">Facility Name:</label>
					<input type="text" class="form-control" id="facilityName" name="name" required>
				</div>
				<div class="form-group">
					<label for="facilityDescription">Facility Description:</label>
					<textarea class="form-control" id="facilityDescription" name="description" rows="4" required></textarea>
				</div>
				<div class="form-group">
					<label for="facilityImage">Facility Image:</label>
					<input type="file" class="form-control" id="facilityImage" name="facilityImage" accept="image/*" required>
				</div>
				<button type="submit" class="btn-submit">Add a Facility</button>
			</form>
		</div>
	</main>
	<!-- MAIN -->
</section>
<!-- CONTENT -->

<script src="./js/script.js"></script>
</body>
</html>
