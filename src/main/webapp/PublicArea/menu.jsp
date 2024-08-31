<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.res.model.Product" %>
<%@ page import="com.res.dao.ProductDAO" %>

<%
    // Fetch the product list from the database
    ProductDAO productDAO = new ProductDAO();
    List<Product> productList;
    
    // Check if there's a search query
    String searchQuery = request.getParameter("searchQuery");
    if (searchQuery != null && !searchQuery.trim().isEmpty()) {
        productList = productDAO.searchProducts(searchQuery);
    } else {
        productList = productDAO.getAllProducts();
    }
    request.setAttribute("productList", productList);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="icon" type="image/x-icon" href="./images/ABC_logo.jpg">
    <title>ABC Restaurant</title>
    <!-- Add your CSS links here -->
</head>
<body>


    <jsp:include page="./navBar.jsp" />
    <!-- END nav -->

    <section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_3.jpg');" data-stellar-background-ratio="0.5">
        <div class="overlay"></div>
        <div class="container">
            <div class="row no-gutters slider-text align-items-end justify-content-center">
                <div class="col-md-9 ftco-animate text-center mb-4">
                    <h1 class="mb-2 bread">Specialties</h1>
                    <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Menu <i class="ion-ios-arrow-forward"></i></span></p>
                </div>
            </div>
        </div>
    </section>

    <section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center mb-5 pb-2">
                <div class="col-md-12 text-center heading-section ftco-animate">
                    <span class="subheading">Products</span>
                    <h2 class="mb-4">Our Featured Products</h2>
                </div>
            </div>
            
            <!-- Search Form -->
            <div class="row justify-content-center mb-5">
                <div class="col-md-6">
                    <form action="${pageContext.request.contextPath}/PublicArea/menu.jsp" method="get">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search products..." name="searchQuery" value="${param.searchQuery}">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="submit">Search</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Product Listing -->
            <div class="row">
                <c:forEach var="product" items="${productList}">
                    <div class="col-md-6 col-lg-3 ftco-animate">
                        <div class="staff text-center" style="margin-bottom: 40px;">
                            <img src="${pageContext.request.contextPath}/${product.productImagePath}" alt="${product.name}" class="img-fluid" style="width: 200px; height: 200px;">
                            <div class="text pt-4">
                                <h3>${product.name}</h3>
                                <span class="position mb-2">Category: ${product.category}</span>
                                <p class="price">${product.price}</p>
                                <form action="${pageContext.request.contextPath}/cart" method="post">
                                    <input type="hidden" name="action" value="add">
                                    <input type="hidden" name="productId" value="${product.id}">
                                    <input type="hidden" name="quantity" value="1">
                                    <button type="submit" class="btn btn-primary mt-3">Add to Cart</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>

    
<jsp:include page="./footer.jsp" />
<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

<script src="js/jquery.min.js"></script>
<script src="js/jquery-migrate-3.0.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.waypoints.min.js"></script>
<script src="js/jquery.stellar.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/aos.js"></script>
<script src="js/jquery.animateNumber.min.js"></script>
<script src="js/bootstrap-datepicker.js"></script>
<script src="js/jquery.timepicker.min.js"></script>
<script src="js/scrollax.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="js/google-map.js"></script>
<script src="js/main.js"></script>

</body>
</html>

<!-- ... (keep the existing scripts) ... -->