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
    <title>Edit Product</title>
  
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
</section>

<section id="content">
    <jsp:include page="./navBar.jsp" />
    <main>
        <div class="head-title">
            <div class="left">
                <h1>Edit Product</h1>
                <ul class="breadcrumb">
                    <li>
                        <a href="${pageContext.request.contextPath}/product_index">Products</a>
                    </li>
                    <li><i class='bx bx-chevron-right'></i></li>
                    <li>
                        <a class="active" href="#">Edit</a>
                    </li>
                </ul>
            </div>
        </div>

        <div class="form-container">
            <form action="${pageContext.request.contextPath}/product_index?action=update" method="post" enctype="multipart/form-data">
                <input type="hidden" name="id" value="${product.id}">
                
                <div class="form-group">
                    <label for="name">Product Name:</label>
                    <input type="text" id="name" name="name" value="${product.name}" required>
                </div>
                
                <div class="form-group">
                    <label for="price">Price:</label>
                    <input type="number" id="price" name="price" value="${product.price}" step="0.01" required>
                </div>
                
                <div class="form-group">
                    <label for="description">Description:</label>
                    <textarea id="description" name="description" required>${product.description}</textarea>
                </div>
                
                <div class="form-group">
                    <label for="category">Category:</label>
                    <select id="category" name="category" required>
                        <option value="Breakfast" ${product.category == 'Appetizer' ? 'selected' : ''}>Breakfast</option>
                        <option value="Lunch" ${product.category == 'Main Course' ? 'selected' : ''}>Lunch</option>
                        <option value="Dinner" ${product.category == 'Dessert' ? 'selected' : ''}>Dinner</option>
                        <option value="Salads" ${product.category == 'Beverage' ? 'selected' : ''}>Salads</option>
                        <option value="Desserts" ${product.category == 'Main Course' ? 'selected' : ''}>Desserts</option>
                        <option value="Beverages" ${product.category == 'Dessert' ? 'selected' : ''}>Beverages</option>
                        <option value="Wine" ${product.category == 'Beverage' ? 'selected' : ''}>Wine</option>
                        
                       
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="currentImage">Current Image:</label>
                    <img src="${pageContext.request.contextPath}/${product.productImagePath}" alt="Current Product Image" width="100">
                </div>
                
                <div class="form-group">
                    <label for="newProductImage">New Image (optional):</label>
                    <input type="file" id="newProductImage" name="newProductImage">
                </div>
                
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Update Product</button>
                </div>
            </form>
        </div>
    </main>
</section>

<script>
    document.getElementById('logout-link').addEventListener('click', function(event) {
        var confirmation = confirm('Do you want to log out?');
        if (!confirmation) {
            event.preventDefault(); 
        }
    });
</script>
<script src="${pageContext.request.contextPath}/AdminArea/js/script.js"></script>
</body>
</html>
