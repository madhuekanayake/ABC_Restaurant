<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  
  <body>
	  <jsp:include page="./navBar.jsp" />
    <!-- END nav -->
    
    <section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_3.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-center">
          <div class="col-md-9 ftco-animate text-center mb-4">
            <h1 class="mb-2 bread">Contact</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="index.jsp">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Contact us <i class="ion-ios-arrow-forward"></i></span></p>
          </div>
        </div>
      </div>
    </section>
		
		<section class="ftco-section ftco-no-pt ftco-no-pb contact-section">
			<div class="container">
				<div class="row d-flex align-items-stretch no-gutters">
					<div class="col-md-6 pt-5 px-2 pb-2 p-md-5 order-md-last">
						<h2 class="h4 mb-2 mb-md-5 font-weight-bold">Contact Us</h2>
						
						
						<!-- Success message -->
                        <c:if test="${not empty sessionScope.successMessage}">
                            <div class="alert alert-success">
                                ${sessionScope.successMessage}
                            </div>
                            <%
                                // Clear the success message after displaying it
                                session.removeAttribute("successMessage");
                            %>
                        </c:if>
						<form action="${pageContext.request.contextPath}/contact" method="post">
    <div class="form-group">
        <input type="text" class="form-control" name="name" placeholder="Your Name" required>
    </div>
    <div class="form-group">
        <input type="email" class="form-control" name="email" placeholder="Your Email" required>
    </div>
    <div class="form-group">
        <input type="text" class="form-control" name="subject" placeholder="Subject" required>
    </div>
    <div class="form-group">
        <textarea name="message" cols="30" rows="7" class="form-control" placeholder="Message" required></textarea>
    </div>
    <div class="form-group">
        <input type="submit" value="Send Message" class="btn btn-primary py-3 px-5">
    </div>
</form>
						
					</div>
				<div class="col-md-6 d-flex align-items-stretch pb-5 pb-md-0" style="margin-top: 40px;">
    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3960.69553091442!2d79.84399937481284!3d6.9269504183438935!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae259004ed40bb9%3A0x8287e4de6231b972!2sABC%20Restaurant!5e0!3m2!1sen!2slk!4v1725630710953!5m2!1sen!2slk" width="1000" height="600" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
</div>
				
				
				</div>
			</div>
		</section>
		<section class="ftco-section contact-section">
      <div class="container">
        <div class="row d-flex contact-info">
          <div class="col-md-12 mb-4">
            <h2 class="h4 font-weight-bold">Contact Information</h2>
          </div>
          <div class="w-100"></div>
          <div class="col-md-3 d-flex">
          	<div class="dbox">
	            <p><span>Address:</span> ABC Restaurant
WRGW+QJG, Baladaksha Mawatha, Colombo</p>
            </div>
          </div>
          <div class="col-md-3 d-flex">
          	<div class="dbox">
	            <p><span>Phone:</span> <a href="#">+94 11 234 5678</a></p>
            </div>
          </div>
          <div class="col-md-3 d-flex">
          	<div class="dbox">
	            <p><span>Email:</span> <a href="#">abcrestaurant@gmail.com</a></p>
            </div>
          </div>
          <div class="col-md-3 d-flex">
          	<div class="dbox">
	            <p><span>Website</span> <a href="#">www.abcrestaurant.lk</a></p>
            </div>
          </div>
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