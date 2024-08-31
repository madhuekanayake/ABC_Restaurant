<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.res.model.Gallery" %>
<%@ page import="com.res.dao.GalleryDAO" %>

<%
    // Fetch the gallery list from the database
    GalleryDAO galleryDAO = new GalleryDAO();
    List<Gallery> galleryList = galleryDAO.getAllGalleryImages();
    request.setAttribute("galleryList", galleryList);
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>ABC Resraurant</title>
    
    <link rel="icon" type="image/x-icon" href="./images/ABC_logo.jpg">
        
        <style>
      .gallery-item {
        position: relative;
        overflow: hidden;
      }
      .gallery-item img {
        width: 100%;
        height: 300px; /* Set a fixed height for all images */
        object-fit: cover; /* Ensure images cover the container */
      }
      .gallery-item .description {
    
        color: black;
        font-size: 18px;
        padding: 10px;
        text-align: center;
        width: 100%;
      }
    </style>    
  </head>
  <body>
    

    <jsp:include page="./navBar.jsp" />
    <!-- END nav -->

    <section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_3.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-center">
          <div class="col-md-9 ftco-animate text-center mb-4">
            <h1 class="mb-2 bread">Gallery</h1>
            <p class="breadcrumbs">
              <span class="mr-2"><a href="index.jsp">Home <i class="ion-ios-arrow-forward"></i></a></span>
              <span>Gallery <i class="ion-ios-arrow-forward"></i></span>
            </p>
          </div>
        </div>
      </div>
    </section>

   <section class="ftco-section">
      <div class="container">
      <div class="row justify-content-center mb-5 pb-2">
                <div class="col-md-12 text-center heading-section ftco-animate">
                    <span class="subheading">Gallery</span>
                    <h2 class="mb-4">Our Gallery</h2>
                </div>
            </div>
        <div class="row">
          <c:forEach var="gallery" items="${galleryList}">
            <div class="col-md-4 mb-4">
              <div class="gallery-item">
                <img src="${pageContext.request.contextPath}/${gallery.galleryImagePath}" alt="Gallery Image" class="img-fluid">
                <div class="description">${gallery.description}</div>
              </div>
            </div>
          </c:forEach>
        </div>
      </div>
    </section>

<jsp:include page="./footer.jsp" />

    <!-- loader -->
    <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#F96D00"/></svg></div>

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
    <script src="js/main.js"></script>
  </body>
</html>
