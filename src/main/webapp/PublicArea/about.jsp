<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.res.model.Facility" %>
<%@ page import="com.res.dao.FacilityDAO" %>
<%@ page import="com.res.model.Review" %>
<%@ page import="com.res.dao.ReviewDAO" %>

<%
    // Fetch the facility list from the database
    FacilityDAO facilityDAO = new FacilityDAO();
    List<Facility> facilityList = facilityDAO.getAllFacilities();
    request.setAttribute("facilityList", facilityList);
%>

<%
    // Fetch the review list from the database
    ReviewDAO reviewDAO = new ReviewDAO();
    List<Review> reviewList = reviewDAO.getAllReviews();
    request.setAttribute("reviewList", reviewList);
%>
<style>
  .facility-image {
    width: 150px;
    height: 150px;
    object-fit: cover; /* Ensures images are the same size and covers the area */

  .services:hover {
    transform: translateY(-10px); /* Optional: creates a slight lift effect on hover */
  }
</style>
  <jsp:include page="./navBar.jsp" />
    <!-- END nav -->
    
    <section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_3.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-center">
          <div class="col-md-9 ftco-animate text-center mb-4">
            <h1 class="mb-2 bread">About</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>About <i class="ion-ios-arrow-forward"></i></span></p>
          </div>
        </div>
      </div>
    </section>


		<section class="ftco-section ftco-wrap-about">
			<div class="container">
				<div class="row">
					<div class="col-md-7 d-flex">
						<div class="img img-1 mr-md-2" style="background-image: url(images/about.jpg);"></div>
						<div class="img img-2 ml-md-2" style="background-image: url(images/about-1.jpg);"></div>
					</div>
					<div class="col-md-5 wrap-about pt-5 pt-md-5 pb-md-3 ftco-animate">
	          <div class="heading-section mb-4 my-5 my-md-0">
	          	<span class="subheading">About</span>
	            <h2 class="mb-4">ABC Restaurant</h2>
	          </div>
	          <p>Nestled by the Mahaweli River, ABC Restaurant offers a tranquil dining experience where every dish is a crafted delight, surrounded by natural beauty.</p>
						<pc class="time">
							<span>Mon - Sun <strong>8 AM - 11 PM</strong></span>
							<span><a href="#">+94 11 234 5678</a></span>
						</p>
					</div>
				</div>
			</div>
		</section>

		
		<section class="ftco-section ftco-counter img ftco-no-pt" id="section-counter">
    	<div class="container">
    		<div class="row d-md-flex">
    			<div class="col-md-9">
    				<div class="row d-md-flex align-items-center">
		          <div class="col-md-6 col-lg-3 mb-4 mb-lg-0 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18">
		              <div class="text">
		                <strong class="number" data-number="8">0</strong>
		                <span>Branches</span>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-6 col-lg-3 mb-4 mb-lg-0 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18">
		              <div class="text">
		                <strong class="number" data-number="100">0</strong>
		                <span>Menus/Dish</span>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-6 col-lg-3 mb-4 mb-lg-0 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18">
		              <div class="text">
		                <strong class="number" data-number="50">0</strong>
		                <span>Staffs</span>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-6 col-lg-3 mb-4 mb-lg-0 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18">
		              <div class="text">
		                <strong class="number" data-number="15000">0</strong>
		                <span>Happy Customers</span>
		              </div>
		            </div>
		          </div>
	          </div>
          </div>
          <div class="col-md-3 text-center text-md-left">
          	<p>Nestled by the Mahaweli River, ABC Restaurant offers a tranquil dining experience where every dish is a crafted delight, surrounded by natural beauty.</p>
          </div>
        </div>
    	</div>
    </section>

<section class="ftco-section bg-light">
  <div class="container">
    <div class="row justify-content-center mb-5 pb-2">
      <div class="col-md-12 text-center heading-section ftco-animate">
        <span class="subheading">Facilities</span>
        <h2 class="mb-4">Our Facilities</h2>
      </div>
    </div>
    <div class="row">
      <c:forEach var="facility" items="${facilityList}">
        <div class="col-md-4 d-flex align-self-stretch ftco-animate text-center">
          <div class="media block-6 services d-block" style="transition: transform 0.3s ease;">
            <div class="icon d-flex justify-content-center align-items-center">
              <!-- Increase the image size to 150px by 150px -->
              <img src="${pageContext.request.contextPath}/${facility.facilityImagePath}" alt="${facility.name}" style="width: 300px; height: 200px; object-fit: cover;">
            </div>
            <div class="media-body p-2 mt-3">
              <h3 class="heading">${facility.name}</h3>
              <p>${facility.description}</p>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>
</section>


		
		
		
    
		<section class="ftco-section">
			<div class="container">
				<div class="row justify-content-center mb-5 pb-2">
          <div class="col-md-12 text-center heading-section ftco-animate">
          	<span class="subheading">Chef</span>
            <h2 class="mb-4">Our Master Chef</h2>
          </div>
        </div>	
				<div class="row">
					<div class="col-md-6 col-lg-3 ftco-animate">
						<div class="staff">
							<div class="img" style="background-image: url(images/chef-4.jpg);"></div>
							<div class="text pt-4">
								<h3>Rohan Silva</h3>
								<span class="position mb-2">Restaurant Owner</span>
								<!-- <p>A small river named Duden flows by their place and supplies</p> -->
								<div class="faded">
									<!-- <p>I am an ambitious workaholic, but apart from that, pretty simple person.</p> -->
									<ul class="ftco-social d-flex">
		                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
		                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
		                <li class="ftco-animate"><a href="#"><span class="icon-google-plus"></span></a></li>
		                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
		              </ul>
	              </div>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-3 ftco-animate">
						<div class="staff">
							<div class="img" style="background-image: url(images/chef-2.jpg);"></div>
							<div class="text pt-4">
								<h3>Nadeesha Welson</h3>
								<span class="position mb-2">Head Chef</span>
								<!-- <p>A small river named Duden flows by their place and supplies</p> -->
								<div class="faded">
									<!-- <p>I am an ambitious workaholic, but apart from that, pretty simple person.</p> -->
									<ul class="ftco-social d-flex">
		                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
		                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
		                <li class="ftco-animate"><a href="#"><span class="icon-google-plus"></span></a></li>
		                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
		              </ul>
	              </div>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-3 ftco-animate">
						<div class="staff">
							<div class="img" style="background-image: url(images/chef-3.jpg);"></div>
							<div class="text pt-4">
								<h3>Kamal Fernando</h3>
								<span class="position mb-2">Chef</span>
								<!-- <p>A small river named Duden flows by their place and supplies</p> -->
								<div class="faded">
									<!-- <p>I am an ambitious workaholic, but apart from that, pretty simple person.</p> -->
									<ul class="ftco-social d-flex">
		                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
		                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
		                <li class="ftco-animate"><a href="#"><span class="icon-google-plus"></span></a></li>
		                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
		              </ul>
	              </div>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-3 ftco-animate">
						<div class="staff">
							<div class="img" style="background-image: url(images/chef-1.jpg);"></div>
							<div class="text pt-4">
								<h3>Uditha Perera</h3>
								<span class="position mb-2">Chef</span>
								<!-- <p>A small river named Duden flows by their place and supplies</p> -->
								<div class="faded">
									<!-- <p>I am an ambitious workaholic, but apart from that, pretty simple person.</p> -->
									<ul class="ftco-social d-flex">
		                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
		                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
		                <li class="ftco-animate"><a href="#"><span class="icon-google-plus"></span></a></li>
		                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
		              </ul>
	              </div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<section class="ftco-section bg-light">
  <div class="container">
    <div class="row justify-content-center mb-5 pb-2">
      <div class="col-md-12 text-center heading-section ftco-animate">
        <span class="subheading">Reviews</span>
        <h2 class="mb-4">Customer Reviews</h2>
      </div>
    </div>
    <div id="reviewCarousel" class="carousel slide" data-ride="carousel" data-interval="2000">
      <div class="carousel-inner">
        <c:forEach var="review" items="${reviewList}" varStatus="status">
          <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
            <div class="d-flex justify-content-center">
              <div class="media block-6 services d-block text-center" style="transition: transform 0.3s ease; max-width: 600px;">
                <div class="icon d-flex justify-content-center align-items-center">
                  <!-- Icon can be added here if needed -->
                </div>
                <div class="media-body p-2 mt-3">
                  <h3 class="heading">${review.username}</h3>
                  <p>${review.message}</p>
                </div>
              </div>
            </div>
          </div>
        </c:forEach>
      </div>
      <!-- Controls -->
      <a class="carousel-control-prev" href="#reviewCarousel" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#reviewCarousel" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </div>
</section>
		
		
    
		
<jsp:include page="./footer.jsp" />
  

  <!-- loader -->
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