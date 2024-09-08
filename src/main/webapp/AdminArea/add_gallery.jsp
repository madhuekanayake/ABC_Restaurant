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
				<h1>Add New Gallery Image</h1>
				<ul class="breadcrumb">
					<li>
						<a href="#">Gallery</a>
					</li>
					<li><i class='bx bx-chevron-right'></i></li>
					<li>
						<a class="active" href="#">Add Gallery</a>
					</li>
				</ul>
			</div>
		</div>

		<div class="form-container">
			<form action="${pageContext.request.contextPath}/gallery_index" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="galleryImage">Gallery Image:</label>
					<input type="file" class="form-control" id="galleryImage" name="galleryImage" accept="image/*" required>
				</div>
				<div class="form-group">
					<label for="galleryDescription">Gallery Description:</label>
					<textarea class="form-control" id="galleryDescription" name="description" rows="4" required></textarea>
				</div>
				<button type="submit" class="btn-submit">Add a Gallery Image</button>
			</form>
		</div>
	</main>
	<!-- MAIN -->
</section>
<!-- CONTENT -->

<script src="./js/script.js"></script>
</body>
</html>
