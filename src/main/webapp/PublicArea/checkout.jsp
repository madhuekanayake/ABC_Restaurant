<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.res.model.Customer" %>
<%@ page import="java.util.List" %>

<% 
    Customer customer = (Customer) session.getAttribute("customer");
    if (customer == null) {
        // User is not logged in, redirect to the login page
        session.setAttribute("redirectAfterLogin", "checkout.jsp");
        response.sendRedirect("./login.jsp");
        return; // Stop further processing of this page
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Check Out</title>
    <!-- Add your CSS links here -->
    <link rel="stylesheet" href="css/your-custom-styles.css">
</head>
<body>

<jsp:include page="./navBar.jsp" />
<!-- END nav -->

<section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_3.jpg');" data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-center">
            <div class="col-md-9 ftco-animate text-center mb-4">
                <h1 class="mb-2 bread">Check Out</h1>
                <p class="breadcrumbs"><span class="mr-2"><a href="index.jsp">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Check Out <i class="ion-ios-arrow-forward"></i></span></p>
            </div>
        </div>
    </div>
</section>

<section class="bg-light py-5">
    <div class="container">
        <div class="row">
            <div class="col-xl-8 col-lg-8 mb-4">
                <!-- Checkout -->
                <div class="card shadow-0 border">
                    <div class="p-4">
                        <h5 class="card-title mb-3">Checkout</h5>
                        <form action="${pageContext.request.contextPath}/checkout" method="post">
                            <div class="row">
                                <div class="col-6 mb-3">
                                    <p class="mb-0">First name</p>
                                    <div class="form-outline">
                                        <input type="text" id="firstName" name="firstName" placeholder="Type here" class="form-control" required />
                                    </div>
                                </div>
                                <div class="col-6">
                                    <p class="mb-0">Last name</p>
                                    <div class="form-outline">
                                        <input type="text" id="lastName" name="lastName" placeholder="Type here" class="form-control" required />
                                    </div>
                                </div>
                                <div class="col-6 mb-3">
                                    <p class="mb-0">Phone</p>
                                    <div class="form-outline">
                                        <input type="tel" id="phone" name="phone" value="+94 " class="form-control" required />
                                    </div>
                                </div>
                                <div class="col-6 mb-3">
                                    <p class="mb-0">Email</p>
                                    <div class="form-outline">
                                        <input type="email" id="email" name="email" placeholder="example@gmail.com" class="form-control" required />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-6 mb-3">
                                    <p class="mb-0">Address</p>
                                    <div class="form-outline">
                                        <input type="text" id="address" name="address" placeholder="Type here" class="form-control" required />
                                    </div>
                                </div>
                                <div class="col-6 mb-3">
                                    <p class="mb-0">City</p>
                                    <div class="form-outline">
                                        <input type="text" id="city" name="city" placeholder="Type here" class="form-control" required />
                                    </div>
                                </div>
                                <div class="col-sm-4 mb-3">
                                    <p class="mb-0">House</p>
                                    <div class="form-outline">
                                        <input type="text" id="house" name="house" placeholder="Type here" class="form-control" />
                                    </div>
                                </div>
                                <div class="col-sm-4 col-6 mb-3">
                                    <p class="mb-0">Postal code</p>
                                    <div class="form-outline">
                                        <input type="text" id="postalCode" name="postalCode" class="form-control" required />
                                    </div>
                                </div>
                                <div class="col-sm-4 col-6 mb-3">
                                    <p class="mb-0">Zip</p>
                                    <div class="form-outline">
                                        <input type="text" id="zip" name="zip" class="form-control" />
                                    </div>
                                </div>
                            </div>
                            <div class="mb-3">
                                <p class="mb-0">Message to seller</p>
                                <div class="form-outline">
                                    <textarea class="form-control" id="message" name="message" rows="2"></textarea>
                                </div>
                            </div>
                            <div class="float-end">
                                <button type="submit" class="btn btn-primary">Place Order</button>
                                <a href="./menu.jsp" class="btn btn-secondary">Continue Shopping</a>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- Checkout -->
            </div>
            <div class="col-xl-4 col-lg-4 d-flex justify-content-center justify-content-lg-end">
                <div class="ms-lg-4 mt-4 mt-lg-0" style="max-width: 320px;">
                    <h6 class="mb-3">Summary</h6>
                    <div class="d-flex justify-content-between">
                        <p class="mb-2">Total price:</p>
                        <p class="mb-2">Rs${cart.total}</p>
                    </div>
                    <h6 class="text-dark my-4">Items in cart</h6>

                    <table class="table">
                        <thead class="thead-dark">
                            
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${cart.items}">
                                <tr>
                                    <td><img src="${pageContext.request.contextPath}/${item.product.productImagePath}" alt="${item.product.name}" style="width: 50px;"></td>
                                    <td>${item.product.name}</td>
                                    <td>Rs${item.subtotal}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="./footer.jsp" />

<!-- loader -->
<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

<!-- Add your JavaScript links here -->
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
<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&sensor=false"></script>
<script src="js/google-map.js"></script>
<script src="js/main.js"></script>

</body>
</html>