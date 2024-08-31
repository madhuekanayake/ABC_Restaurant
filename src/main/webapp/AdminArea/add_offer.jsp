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

	<title>ABC Restaurant</title>
	<style>

		<style>
		.form-container {
			background-color: white;
			padding: 40px;
			border-radius: 8px;
			box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
			width: 100%;
			max-width: 800px;
			margin: 20px auto;
		}

		.form-container h1 {
			text-align: center;
			margin-bottom: 30px;
			font-size: 24px;
			color: #333;
		}

		.form-step {
			display: none;
		}

		.form-step.active {
			display: block;
		}

		.form-container .form-group {
			margin-bottom: 20px;
		}

		.form-container label {
			margin-bottom: 5px;
			font-weight: bold;
			color: #555;
		}

		.form-container input, 
		.form-container textarea, 
		.form-container select {
			padding: 10px;
			border: 1px solid #ccc;
			border-radius: 4px;
			width: 100%;
			box-sizing: border-box;
			font-size: 16px;
		}

		.form-container textarea {
			resize: vertical;
		}

		.form-container .btn {
			padding: 15px;
			border: none;
			border-radius: 4px;
			background-color: #5cb85c;
			color: white;
			cursor: pointer;
			font-size: 18px;
			text-align: center;
		}

		.form-container .btn:hover {
			background-color: #4cae4c;
		}

		.form-container .btn-secondary {
			background-color: #d9534f;
		}

		.form-container .btn-secondary:hover {
			background-color: #c9302c;
		}
	</style>
</head>
<body>

<!-- Include Sidebar -->
<jsp:include page="./sideBar.jsp" />

<!-- CONTENT -->
<section id="content">
	<!-- Include Navbar -->
	<jsp:include page="./navBar.jsp" />

	<!-- MAIN -->
	<main>
		<div class="head-title">
			<div class="left">
				<h1>Add New Offer</h1>
				<ul class="breadcrumb">
					<li>
						<a href="#">Dashboard</a>
					</li>
					<li><i class='bx bx-chevron-right'></i></li>
					<li>
						<a class="active" href="#">Add Offer</a>
					</li>
				</ul>
			</div>
		</div>

		<!-- Offer Form -->
		<div class="form-container">
			<form action="${pageContext.request.contextPath}/offer_index" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="offerDescription">Offer Description:</label>
					<textarea class="form-control" id="offerDescription" name="description" rows="4" required></textarea>
				</div>
				<div class="form-group">
					<label for="offerImage">Offer Image:</label>
					<input type="file" class="form-control" id="offerImage" name="offerImage" accept="image/*" required>
				</div>
				<button type="submit" class="btn-submit">Add a Offer</button>
			</form>
		</div>
		<!-- MAIN -->
	</main>
	<!-- CONTENT -->

</section>

<script src="./js/script.js"></script>
</body>
</html>
