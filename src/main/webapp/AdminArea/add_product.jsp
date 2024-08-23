<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!-- Boxicons -->
	<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
	<!-- My CSS -->
	<link rel="stylesheet" href="./css/style.css">

	<title>Add Product</title>
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

<jsp:include page="./sideBar.jsp" />

<!-- CONTENT -->
<section id="content">
	<jsp:include page="./navBar.jsp" />

	<!-- MAIN -->
	<main>
		<div class="head-title">
			<div class="left">
				<h1>Add New Product</h1>
				<ul class="breadcrumb">
					<li>
						<a href="#">Dashboard</a>
					</li>
					<li><i class='bx bx-chevron-right'></i></li>
					<li>
						<a class="active" href="#">Add Product</a>
					</li>
				</ul>
			</div>
		</div>

		<div class="form-container">
			<form action="${pageContext.request.contextPath}/product_index" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="productName">Product Name:</label>
					<input type="text" class="form-control" id="productName" name="name" required>
				</div>
				<div class="form-group">
					<label for="productPrice">Product Price:</label>
					<input type="number" class="form-control" id="productPrice" name="price" required>
				</div>
				<div class="form-group">
					<label for="productDescription">Product Description:</label>
					<textarea class="form-control" id="productDescription" name="description" rows="4" required></textarea>
				</div>
				<div class="form-group">
					<label for="productCategory">Product Category:</label>
					<select class="form-control" id="productCategory" name="category" required>
						<option value="breakfast">Breakfast</option>
						<option value="lunch">Lunch</option>
						<option value="dinner">Dinner</option>
						<option value="salads">Salads</option>
						<option value="desserts">Desserts</option>
						<option value="beverages">Beverages</option>
						<option value="wine">Wine</option>
					</select>
				</div>
				<div class="form-group">
					<label for="productImage">Product Image:</label>
					<input type="file" class="form-control" id="productImage" name="productImage" accept="image/*" required>
				</div>
				<button type="submit" class="btn-submit">Add a Product</button>
			</form>
		</div>
	</main>
	<!-- MAIN -->
</section>
<!-- CONTENT -->

<script src="./js/script.js"></script>
</body>
</html>
