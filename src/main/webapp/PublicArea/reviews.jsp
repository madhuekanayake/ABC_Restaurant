<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="./navBar.jsp" />
<!-- END nav -->

<section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_3.jpg');" data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-center">
            <div class="col-md-9 ftco-animate text-center mb-4">
                <h1 class="mb-2 bread">Customer Reviews</h1>
                <p class="breadcrumbs"><span class="mr-2"><a href="index.jsp">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Customer Reviews <i class="ion-ios-arrow-forward"></i></span></p>
            </div>
        </div>
    </div>
</section>

<section class="ftco-section ftco-no-pt ftco-no-pb contact-section">
    <div class="container">
    
        <div class="row d-flex align-items-stretch no-gutters">
            <div class="col-md-6 pt-5 px-2 pb-2 p-md-5 order-md-last" style="margin-top: 40px;">
                <h2 class="h4 mb-2 mb-md-5 font-weight-bold">Customer Reviews</h2>

                <!-- Display success message -->
                <% if (session.getAttribute("success") != null) { %>
                    <div class="alert alert-success">
                        <%= session.getAttribute("success") %>
                    </div>
                    <% session.removeAttribute("success"); %> <!-- Remove the success message after displaying it -->
                <% } %>

                <!-- Display error message -->
                <% if (session.getAttribute("error") != null) { %>
                    <div class="alert alert-danger">
                        <%= session.getAttribute("error") %>
                    </div>
                    <% session.removeAttribute("error"); %> <!-- Remove the error after displaying it -->
                <% } %>

                <form action="${pageContext.request.contextPath}/reviews" method="post">
                    <div class="form-group">
                        <input type="text" class="form-control" name="username" placeholder="Username" required>
                    </div>
                    <div class="form-group">
                        <textarea class="form-control" name="message" placeholder="Feedback" rows="4" required></textarea>
                    </div>
                    <div class="form-group">
                        <input type="submit" value="Submit Review" class="btn btn-primary py-3 px-5">
                    </div>
                </form>

                <!-- Display reviews -->
                <c:forEach var="review" items="${reviewList}">
                    <div class="review">
                        <h4><c:out value="${review.username}"/></h4>
                        <p><c:out value="${review.message}"/></p>
                    </div>
                </c:forEach>

            </div>
            <div class="col-md-6 d-flex align-items-stretch pb-5 pb-md-0" style="margin-top: 40px;">
                <img src="./images/about-1.jpg" alt="About Us" class="img-fluid w-100 h-100" style="object-fit: cover;">
            </div>
        </div>
    </div>
</section>

<jsp:include page="./footer.jsp" />
 <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
<script src="js/script.js"></script>

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